<?php
//for MongoDB server
//Database credentials

// require_once _DIR_ . '/vendor/autoload.php';

//Database credentials
//for XAMPP
define("DATABASE", "deliveryBees");
define("SERVER", "localhost");
define("USERNAME", "root");
define("PASSWD", "");


// Creating a database
// $client = new MongoDB\Client;

// if ($client->deliveryBees) {
//     $client->dropDatabase('deliveryBees');
// }

// //Creating a collection
// $db = $client->deliveryBees;

// $collection = $db->Dbees_collection;
// //var_dump($collection);


// // Inserting a document [table]
// $adminLogin = $collection->insertOne(
//     [
//         '_id' => 1,
//         'admin' => "yaw.kwakye@gmail.com",
//         'password' => "idhoayd2094"
//     ]
// );

// var_dump($adminLogin->getInsertedId());

?>

<?php
// require 'vendor/autoload.php';

// define("DATABASE", "deliveryBees");
// define("SERVER", "mongodb://localhost:27017");
// define("USERNAME", "root");
// define("PASSWORD", "wedeliver");

// // Create a MongoDB client instance
// $uri = SERVER;
// $options = [
//     'username' => USERNAME,
//     'password' => PASSWORD,
//     'authSource' => DATABASE,
// ];
// $client = new MongoDB\Client($uri, $options);

// // Select the database to use
// $database = $client->selectDatabase(DATABASE);
?>


