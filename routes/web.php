<?php
    Route::auth();

Route::group(['middleware' => 'web'], function () {
    Route::get('/', 'HomeController@index');
    Route::get('/home', 'HomeController@index');

	Route::post('store', 'HomeController@saveChat');
	Route::get('chat-data','HomeController@getChatData');
});

