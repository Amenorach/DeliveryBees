<?php
//for MongoDB server
//Database credentials

require 'vendor/autoload.php';

define("DATABASE", "deliveryBees");
define("SERVER", "mongodb://localhost:...");
define("USERNAME", "root");
define("PASSWORD", "wedeliver");

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


