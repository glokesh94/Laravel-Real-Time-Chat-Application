<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## Laravel Real Time Chat Application Using 

Technology: Socket.io, Redis, Express and Nodejs, Laravel Web Framework, MySQL.

## Step 1: Install nodejs
We will install nodejs if we did not install before. So, make sure you can check if nodejs is not install then you can fire following command and install nodejs easily.

    sudo apt-get update

    sudo apt-get install nodejs

## Step 2: Install npm
we have to also need to install npm because we will install more socket.io, redis and express package using npm command, so if you not installed this command before then install by following command.

    sudo apt-get install npm

## Step 3: Install Redis-server
we also require to install redis server because we will manage redis token, so if you not installed this command before then install by following command.

    sudo apt-get install redis-server

## Step 4: Install express redis socket.io

we also require to install redis express redis socket.io, so if you not installed this command before then install by following command.

    npm install express redis socket.io --save


## Step 5: Install Laravel

ok, now we are ready to install laravel 5 application, so if you want to start from scratch then fire following command for laravel new application.

    composer create-project --prefer-dist laravel/laravel blog

## Step 6: Create server.js file

Now, open laravel application root directory and create folder nodejs and also create new file server.js inside nodejs folder, so put bellow code in server.js file.

```js

// nodejs/server.js

var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);
var redis = require('redis');

server.listen(3000);
io.on('connection', function(socket) {
    console.log("connected");
    var redisClient = redis.createClient();
    redisClient.subscribe('message');
    redisClient.on("message", function(channel, data) {
        console.log("new message add in queue " + channel + " channel");
        socket.emit(channel, data);
    });

    socket.on('disconnect', function() {
        redisClient.quit();
    });
}); 
```

## Step 7: Install predis package
In this step we have to install predis package of laravel. 
This package through we can assign message in redis. 
So first fire following command:


    sudo composer require predis/predis

Now we have to add an alias of predis package so open config/app.php and replace following line:

``` 'Redis'     => Illuminate\Support\Facades\Redis::class, ```

Replace Into

``` 'LRedis'    => 'Illuminate\Support\Facades\Redis' ```

## Step 8: Clone or Download the repository
    
    $ git clone https://github.com/glokesh94/Laravel-Real-Time-Chat-Application 

    $ cd Laravel-Real-Time-Chat-Application 

Run the server using the following command: 

    $ sudo node server.js

The server starts running on local server. 
Go to the browser and type the following url: 

    http://localhost/Laravel-Real-Time-Chat-Application

## License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
