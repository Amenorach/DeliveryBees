<?php
include_once 'all_controller.php';


if (isset($_POST['insertBtn'])) {
    $fname = $_POST['customer_fname'];
    $lname = $_POST['customer_lname'];
    $number = $_POST['customer_contact'];
    $country = $_POST['customer_country'];
    $email = $_POST['customer_email'];
    $password = password_hash($_POST['customer_pass'], PASSWORD_DEFAULT); 
    $user_role = 1;

    //  var_dump($fname, $lname, $number, $country, $email, $password, $user_role);
    $result = add_record_ctr($fname, $lname, $number, $country, $email, $password, $user_role);
    if ($result == true) {
        header('Location: login.php');
    } else {
        echo 'error';
    }
}

?>
