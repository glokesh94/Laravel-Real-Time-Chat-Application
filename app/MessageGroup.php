<?php
namespace App;
use Illuminate\Database\Eloquent\Model;

class MessageGroup extends Model
{
    protected $fillable = array(
    	'owner_user_id',
	    'last_message_date',
	    'status'   ,
	);



}
