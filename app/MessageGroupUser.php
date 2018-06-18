<?php
namespace App;
use Illuminate\Database\Eloquent\Model;

class MessageGroupUser extends Model
{
    protected $fillable = array(
    	'message_group_id',
	    'user_id',
        'to_country_id',
	    'status'
	);


}
