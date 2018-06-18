<?php
namespace App;
use Illuminate\Database\Eloquent\Model;

class MessageToUser extends Model
{
    protected $fillable = array(
    	'message_group_id',
	    'message_id',
        'sender_user_id',
	    'receiver_user_id',
	    'message',
	    'attached_file_name',
	    'read_status',
	    'is_sent_for_notification',
        'is_delete_by_receiver',
        'status'
	);

    public function sender()
    {
        return $this->belongsTo('App\User', 'sender_user_id', 'id');
    }

    public function receiver()
    {
        return $this->belongsTo('App\User', 'receiver_user_id', 'id');
    }

}
