<?php
include_once("../settings/db_class.php");

class ContactClass extends db_connection
{
    public function identifyVehicle_cls()
    {
        //write the sql
        $sql = "SELECT vehicle.id, couriervehiclerider.licenseNumber
        FROM `couriervehiclerider`
        INNER JOIN `vehicle` ON vehicle.id = couriervehiclerider.vehicleID
        WHERE couriervehiclerider.licenseNumber LIKE 'GW%'";
        //execute the sql
        return $this->fetch($sql);
    }

    public function deliveryInfo_cls()
    {
        //write the sql
        $sql = "SELECT DeliveryInformation.deliveryID, DeliveryInformation.deliveryDate, Courier.Rider_fname, Courier.Rider_lname , Package.price
        FROM 
          `DeliveryInformation` 
          INNER JOIN `Courier` ON DeliveryInformation.courierID = Courier.courierID 
          LEFT OUTER JOIN `Package` ON DeliveryInformation.deliveryID = Package.deliveryID
        WHERE 
          DeliveryInformation.deliveryDate < '2023-04-16'
        ORDER BY 
          DeliveryInformation.deliveryDate DESC";
        //execute the sql
        return $this->fetch($sql);
    }

    public function invoice_cls()
    {
        //write the sql
        $sql = "SELECT 
        d.deliveryID,
        d.deliveryDate,
        COUNT(p.packageID) as num_packages,
        SUM(p.price) as total_price,
        SUM(CASE WHEN p.paymentStatus = 'Paid' THEN p.price ELSE 0 END) as total_paid,
        SUM(CASE WHEN p.paymentStatus = 'Unpaid' THEN p.price ELSE 0 END) as total_unpaid
      FROM 
        `DeliveryInformation` d 
        LEFT JOIN `Package` p ON d.deliveryID = p.deliveryID
      GROUP BY 
        d.deliveryID
      ORDER BY 
        d.deliveryDate DESC;";
        //execute the sql
        return $this->fetch($sql);
    }

    public function inventory_cls()
    {
        //write the sql
        $sql = "SELECT Package.packageID, Package.pWeight, Package.price, vehicle.make, vehicle.model, vehicle.type, DeliveryInformation.deliverystatus
        FROM `Package`
        INNER JOIN `couriervehiclerider` ON Package.courierId = couriervehiclerider.courierId
        INNER JOIN `vehicle` ON couriervehiclerider.vehicleID = vehicle.id
        INNER JOIN `DeliveryInformation` ON Package.deliveryID = DeliveryInformation.deliveryID
        WHERE Package.pWeight > 0.05
        ORDER BY Package.pWeight DESC";
        //execute the sql
        return $this->fetch($sql);
    }

    public function sender_cls()
    {
        //write the sql
        $sql = "SELECT customer.cust_ID,customer.cust_fname, customer.cust_lname, customer.cust_phone, customer.cust_email,
        SenderAddress.street, SenderAddress.houseNumber, SenderAddress.city
        FROM ((Sender
        INNER JOIN `customer` ON customer.cust_ID = Sender.cust_ID)
        INNER JOIN `SenderAddress` ON Sender.senderID = SenderAddress.senderID)";
        //execute the sql
        return $this->fetch($sql);
    }

    public function recipients_cls()
    {
        //write the sql
        $sql = "SELECT customer.cust_ID,customer.cust_fname, customer.cust_lname, customer.cust_phone, customer.cust_email,
        recipientAddress.street, recipientAddress.houseNumber, recipientAddress.city
      FROM ((`recipient`
      INNER JOIN `customer` ON customer.cust_ID = recipient.cust_ID)
      INNER JOIN `recipientAddress` ON recipient.recipientID = recipientAddress.recipientID);";
        //execute the sql
        return $this->fetch($sql);
    }
    

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
    function sel_regis_cls($b, $c)
    {
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
