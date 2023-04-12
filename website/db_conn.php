<?php
//for MongoDB server
//Database credentials

require 'vendor/autoload.php';

define("DATABASE", "mydatabase");
define("SERVER", "mongodb://localhost:27017");
define("USERNAME", "myusername");
define("PASSWORD", "mypassword");

// Create a MongoDB client instance
$uri = SERVER;
$options = [
    'username' => USERNAME,
    'password' => PASSWORD,
    'authSource' => DATABASE,
];
$client = new MongoDB\Client($uri, $options);

// Select the database to use
$database = $client->selectDatabase(DATABASE);
?>


