@extends('layouts.app')
@section('content')
<div class="container spark-screen">
    <div class="row">
        <div class="col-md-4">

            @if(isset($users))
            <ul class="list-group">
              @foreach($users as $user)
              <a href="javascript:;" class="user_list" data-id="{{$user->id}}" onclick="getchats(this);">
              <li class="list-group-item d-flex justify-content-between align-items-center" >
                {{ $user->name }}
                <span class="badge badge-primary badge-pill">123</span>
              </li>
              </a>
              @endforeach
            </ul>
            @endif          
        </div>
        <div class="col-md-8 ">

          <div class="row chat-window" id="chat_window_1" >
              <div class="col-xs-12 col-md-12">
                <div class="panel panel-default">
                      <div class="panel-heading"></div>
                      <div class="panel-body msg_container_base js_messages">
                      </div>
                      <div class="panel-footer">
                        <form method="post" class="ajax_form" enctype="multipart/form-data">   
                        <input type="hidden" name="receiver_id">
                          <div class="input-group">
                              <input id="btn-input" type="text" class="form-control input-md chat_input" placeholder="Write your message here..." name="message"/>
                              <span class="input-group-btn">
                                <button class="btn btn-success btn-md "data-toggle="modal" data-target="#myModal"  id="" type="button"><i class="fa fa-paperclip" aria-hidden="true"></i></button>
                              <button class="btn btn-primary btn-md" id="btn-chat" type="submit" name="submit">Send</button>
                              </span>
                          </div>
                        </form> 
                      </div>
                  </div>
              </div>
          </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Drop file to upload</h4>
      </div>
      <div class="modal-body">
         <div class="image_upload_div">
            <form action="{{ url('store') }}" class="dropzone" method="post" enctype="multipart/form-data">
              {{ csrf_field() }}
              <input type="hidden" name="receiver_id">                      
            </form>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<script type="text/javascript">
  var base_url = '{{ url('') }}';
</script>

<script type="text/javascript">

      $(document).ready(function(){
        var socket = io.connect( 'http://'+window.location.hostname+':3000');
        socket.on('message',function (data) {
          data = $.parseJSON(data);

          if(data.sender_id == <?php echo (Auth::user())?Auth::user()->id:0; ?>){
            $(".js_messages").append('<div class="chitting-row login_user"><div class="messager-img right-messages"></div><div class="messager-detail width-90 right-message-chatting right-arrow"><p class="messager-name right-chat">'+data.date+'<span class="float-right">'+data.username+'</span></p><p class="msg-of-messager">'+data.message+'</p></div></div>');
          }

          if(data.receiver_id == <?php echo (Auth::user())?Auth::user()->id:0; ?>) {
            toastr.info('<p>'+data.username+'</p><p style="font-size:13px; margin-top:5px;">'+data.message+'</p>');

            $(".js_messages").append('<div class="chitting-row guest_user"><div class="messager-img"></div><div class="messager-detail width-90 left-arrow"><p class="messager-name">'+data.date+'<span class="float-right">'+data.username+'</span></p><p class="msg-of-messager">'+data.message+'</p></div></div>');
          }

        });

      $('.user_list:first-child').addClass('active');
      var sender_id = $('.user_list:first-child').attr('data-id');      
      $("input[name*='receiver_id']").val(sender_id);
      getChatData(sender_id);

      $('.ajax_form').on('submit', function(e) {
        e.preventDefault();
        $("button[name*='submit']").prop('disabled', false);
        var message = $("input[name*='message']").val().trim();
        var file = $("input[name*='file']").val();
        if(
          (message!=null && message!='' ) ||
          (file!=null && file!='' )
          ){
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({ 
              type: "POST",
              url: base_url+'/store',
              data: new FormData(this),
              processData: false,
              contentType: false,
              dataType: 'json',
              success:function(data){
                $("textarea[name*='message']").val('');
                $("input[name*='file']").val('');
              }
            });
        }
      });

  });

  function getChatData(sender_id) {
    $("input[name*='receiver_id']").val(sender_id);
    $.getJSON(base_url+"/chat-data",{sender_id:sender_id}, function(result){
        $('.js_messages').html(result.html);
        $('.panel-heading').text(result.sender.name)
    });
  }

  function getchats($this) {
    var sender_id =  $($this).attr('data-id');
    $('.user_list').removeClass('active');
    $($this).addClass('active');
    getChatData(sender_id);
  }

</script>
@endsection