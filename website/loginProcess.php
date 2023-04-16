<?php
include("../controllers/contact_controller.php");



if(isset($_POST['loginButton'])){
    $email=$_POST['cust_email'];
    $unencryptpass=$_POST['cust_pass'];


    if(getUserDetailsByEmail_ctr($email)!=false){
        
        $result=getUserDetailsByEmail_ctr($email);
        $encryptpass=$result['cust_pass'];
        if($verify){
            session_start();
            $_SESSION['cust_id']=$result['customer_id'];
            $_SESSION['cust_fname']=$result['customer_fname'];
            $_SESSION['cust_lname']=$result['customer_lname'];
            $_SESSION['cust_email']=$result['customer_email'];
            $_SESSION['user_role']=$result['user_role'];
            if ($_SESSION['user_role'] == 2) {
                header('location: ../admin/tables.php');
                } else if($_SESSION['user_role'] == 1) {
                    header('location: ../website/homepage.php');
                }
        
        }
        else{
            session_start();
            $_SESSION['error'] = 'Invalid login details!';		
            header('Location:../website/login.php');
        }
    }
}
else {
	
	header('Location:../website/login.php');
}


?>
