<?php
namespace App;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $fillable = array(
    	'sender_user_id',
	    'message_group_id',
        'message',
	    'status'   ,
	);

    public function user()
    {
        return $this->belongsTo('App\User', 'sender_user_id', 'id');
    }


}
