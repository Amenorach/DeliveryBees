<?php
include_once(dirname(__FILE__)) . "../settings/dbClass.php";

class ContactClass extends db_connection
{
    
    function getUserDetailsByEmail_cls($email)
    {
        //write the sql
        $sql = "SELECT * FROM `customer` WHERE `cust_email` = '$email'";
        //execute the sql
        return $this->fetchOne($sql);
    }

    function getAdminDetailsByEmail_cls($email)
    {
        //write the sql
        $sql = "SELECT * FROM `customer` WHERE `cust_email` = '$email' AND `user_role` = 2";
        //execute the sql
        return $this->fetchOne($sql);
    }
    
    //login
	function sel_regis_cls ($b,$c){
		$c_p = md5($c);
		$sql = "SELECT * FROM `customer` WHERE `cust_email` = '$b' AND `cust_pass` = '$c_p'";
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
            "SELECT * from customer where cust_id ='$cid'"
        );
    }


    function delete_record_cls($id)
    {
        // return true or false
        return $this->db_query(
            "DELETE FROM `customer` WHERE `cust_id`='$id'"
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
