<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;

use App\MessageGroupUser;
use App\MessageToUser;
use App\MessageGroup;
use App\Message;
use stdClass;
use DB;
use Auth;
use WebsiteHelper;
use Mail;
use LRedis; 
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $auth_id = Auth::user()->id;
        $users = User::where('id','!=',$auth_id)->get();
        return view('home',compact('users'));
    }

    public function getGroupId($userIds)
    {
      $query = 'SELECT u.message_group_id FROM message_group_users AS u INNER JOIN message_group_users AS i ON u.message_group_id= i.message_group_id AND i.user_id = '.$userIds[0].' INNER JOIN message_group_users AS g ON u.message_group_id= g.message_group_id AND g.user_id = '.$userIds[1].' GROUP BY message_group_id';

      $result = DB::select(DB::raw($query));

      if(isset($result) && count($result) > 0) {
        foreach ($result as $key => $value) {
          return $value->message_group_id;
        }
      }
      return false;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function saveChat(Request $request)
    {
        $sender_id = Auth::user()->id;
        $receiver_id = $request->receiver_id;
        $sender = User::find($sender_id);

        $group_id = $this->getGroupId([$sender_id,$receiver_id]);
        
        if($group_id) {
          $group = MessageGroup::find($group_id);
          $group->last_message_date = Carbon::now()->toDateTimeString();
          $group->save();
        
        } else {
          $group = MessageGroup::create([
            'owner_user_id'=> $sender_id,
            'last_message_date'=> Carbon::now()->toDateTimeString()
          ]);

          if($group) {
            $message_group_user = new MessageGroupUser();
            $message_group_user->message_group_id = $group->id;
            $message_group_user->user_id = $sender_id;
            $message_group_user->save();

            $message_group_user = new MessageGroupUser();
            $message_group_user->message_group_id = $group->id;
            $message_group_user->user_id = $receiver_id;
            $message_group_user->save();
          }
        }

        $file_name = NULL;
        if($request->hasFile('file')){
            $file_upload_path = public_path('uploads/chat_assets/');
            @mkdir($file_upload_path, 0777);
            @chmod($file_upload_path, 0777);

            $file = $request->file('file');
            $file_temp_path     = $file->getPathname();
            $file_extention     = $file->getClientOriginalExtension();
            $file_name          = rand(000000000,999999999).'.'.$file_extention;
            $file->move($file_upload_path, $file_name);
        }

        $save_messages = Message::create([
          'sender_user_id' => $sender_id,
          'message_group_id' => $group->id,
          'message' => $request->message
        ]);

        $message_to_user = MessageToUser::create([
          'message_group_id' => $group->id,
          'message_id' => $save_messages->id,
          'sender_user_id' => $sender_id,
          'receiver_user_id' => $receiver_id,
          'message' => $request->message,
          'attached_file_name' => $file_name
        ]);

        if( $message_to_user ) {
          $redis = LRedis::connection();
          $message = $request->message;

          if($file_name != NULL) {
              if($file_extention == 'jpg' || $file_extention == 'jpeg' || $file_extention == 'png') {
                  $message.= '<p><a href="' . asset('public/uploads/chat_assets/' . $file_name) . '" target="_blank" download ><img style="margin-top:5px;" src="'. asset('public/uploads/chat_assets/' . $file_name) . '" width="100"/></a></p>';
              } else {
                  $message .= '<p><a href="' . asset('public/uploads/chat_assets/' . $file_name) . '" target="_blank" download ><span class="doc-file">'.$file_name.'</span></a></p>';   
              }

          }

          $responsedata = [
              'message'       => $message,
              'sender_id'     => $message_to_user->sender_user_id,
              'receiver_id'   => $message_to_user->receiver_user_id,
              'username'      => $sender->name,
              'date'          => date('d M Y'),
          ];
          $redis->publish('message', json_encode($responsedata));
          return response()->json($request->all());
        }

        $response['status'] = false;
        return json_encode($response);
        
    }


    public function getChatData()
    {
        $sender_id = Input::get('sender_id');
        $receiver_id = Auth::user()->id;

        $sender =  User::find($sender_id);

        $chats = MessageToUser::
                 where(function($query) use ($sender_id,$receiver_id) {

                 $query->where(function($query) use ($sender_id,$receiver_id){
                     $query->where('sender_user_id', $sender_id);
                     $query->where('receiver_user_id', $receiver_id);
                 });

                 $query->orWhere(function($query) use ($sender_id,$receiver_id){
                     $query->where('sender_user_id', $receiver_id);
                     $query->where('receiver_user_id', $sender_id);
                 });
             })
            ->with('sender')
            ->orderBy('id','ASC')
            ->get();

        $html = '';

        foreach ($chats as $key => $chat) {
            
            $file = '';
            if($chat->attached_file_name) {
                $ext = explode('.', $chat->attached_file_name);
                if( $ext[1] == 'jpg'|| $ext[1] == 'jpeg' || $ext[1] == 'png' ) {
                    $file = '<a href="' . asset('public/uploads/chat_assets/' . $chat->attached_file_name) . '" target="_blank" download ><img style="margin-top:5px; width:100px;" src="'.asset('public/uploads/chat_assets/'.$chat->attached_file_name).'" width="100"/></a>';
                } else {
                    $file .= '<a href="' . asset('public/uploads/chat_assets/' . $chat->attached_file_name) . '" target="_blank" download ><span class="doc-file">'.$chat->attached_file_name.'</span></a>';   

                }
            }

            $date = $chat->created_at->format('d M Y');

            if($chat->sender_user_id == $receiver_id) {
              $html .= '<div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10 ">
                            <div class="messages msg_sent">
                               <p>'.$chat->message.'</p><p>'.$file.'</p>
                                <time class="text-right">'.$date.'</time>
                            </div>
                        </div>
                        <div class="col-md-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div>';

            } else {
                $html .= '<div class="row msg_container base_receive">
                        <div class="col-md-2  avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_receive">
                                <p>'.$chat->message.'</p>
                                <p>'.$file.'</p>
                                <time class="text-right">'.$date.'</time>
                            </div>
                        </div>
                    </div>';                
            }
            

        }
        $data['sender'] = $sender;
        $data['html'] = $html;
        return json_encode($data);

    }

 
}
