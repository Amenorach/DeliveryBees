<?php
include_once(dirname(__FILE__)) . "../../settings/dbClass.php";

class ContactClass extends db_connection
{
    function add_Cust_record_cls($fname, $lname, $number, $country, $email, $password, $user_role)
    {
        // return true or false
        return $this->db_query(
            "INSERT INTO customer (`customer_fname`, `customer_lname`, `customer_contact`, `customer_country`, `customer_email`, `customer_pass`, `user_role`) VALUES ('$fname', '$lname', '$number', '$country', '$email', '$password', '$user_role')"
        );
    }

    function add_Admin_record_cls($fname, $lname, $number, $country, $email, $password, $user_role)
    {
        // return true or false
        return $this->db_query(
            "INSERT INTO customer (`customer_fname`, `customer_lname`, `customer_contact`, `customer_country`, `customer_email`, `customer_pass`, `user_role`) VALUES ('$fname', '$lname', '$number', '$country', '$email', '$password', '$user_role')"
        );
    }

    function add_newsletrecord_cls($mailname)
    {
        // return true or false
        return $this->db_query(
            "INSERT INTO newsletter (`news_email`) VALUES ('$mailname')"
        );
    }
    
    
    function getUserDetailsByEmail_cls($email)
    {
        //write the sql
        $sql = "SELECT * FROM `customer` WHERE `customer_email` = '$email'";
        //execute the sql
        return $this->fetchOne($sql);
    }

    function getAdminDetailsByEmail_cls($email)
    {
        //write the sql
        $sql = "SELECT * FROM `customer` WHERE `customer_email` = '$email' AND `user_role` = 2";
        //execute the sql
        return $this->fetchOne($sql);
    }
    
    //login
	function sel_regis_cls ($b,$c){
		$c_p = md5($c);
		$sql = "SELECT * FROM `customer` WHERE `customer_email` = '$b' AND `customer_pass` = '$c_p'";
		return $this->db_fetch_one($sql);
	}

    function get_all_records_cls()
    {
        // return true or false
        return $this->db_query(
            "SELECT * from customer"
        );
    }

    function get_all_newsrecords_cls()
    {
        // return true or false
        return $this->db_query(
            "SELECT * from newsletter"
        );
    }
    

    // function get_all_newsrecords_cls()
    // {
    //     $sql = "SELECT * FROM `newsletter`";
    //     // return true or false
    //     return $this->fetch($sql);
    // }

    function get_all_adminrecords_cls()
    {
        // return true or false
        return $this->db_query(
            "SELECT * from customer WHERE `user_role` = 2"
        );
    }

    function get_one_record_cls($cid)
    {
        // return true or false
        return $this->db_query(
            "SELECT * from customer where customer_id ='$cid'"
        );
    }

    function update_record_cls($id, $name, $number, $country)
    {
        // return true or false
        return $this->db_query(
            "UPDATE `customer` SET `customer_name`='$name',`customer_contact`='$number',`customer_country`='$country' WHERE `customer_id`='$id'"
        );
    }

    function delete_record_cls($id)
    {
        // return true or false
        return $this->db_query(
            "DELETE FROM `customer` WHERE `customer_id`='$id'"
        );
    }

    function delete_newsrecord_cls($id)
    {
        // return true or false
        return $this->db_query(
            "DELETE FROM `newsletter` WHERE `news_id`='$id'"
        );
    }

}
