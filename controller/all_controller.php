<?php 
//make the controller aware of the class
include_once(dirname(__FILE__)) . '/../class/all_class.php';



// function addcustomer_ctr($name, $email, $pass, $country, $city, $contact, $role){
// //run instance
// $add_customer = new ContactPhoneClass();
// //run method
// return $add_customer->addcustomer_cls($name, $email, $pass, $country, $city, $contact, $role);

// }

// function delcontact_ctr($itemid){
// //run instance
// $delete_contact = new ContactPhoneClass();
// //run method
// return $delete_contact->deleteContact_cls($itemid);

// }

// function editcontact_ctr($id,$newname,$newphone){
// //run instance
// $edit_contact = new ContactPhoneClass();
// //run method
// return $edit_contact->editContact_cls($id,$newname,$newphone);

// }


// function selectcontact_ctr(){
//     $selcon = new ContactPhoneClass();

//     $run_select = $selcon->selectContact_cls();

//     if ($run_select){
//         $view = array();

//         while ($onewho=$selcon->db_fetch_all()){
//             $view=$onewho;
//         }
//         return $view;
//     }else{
//         return false;
//     }
// }

function select_exist_customer_ctr($b,$c){
    $select = new ContactClass();
    return $select->sel_regis_cls($b,$c);
  }

function getUserDetailsByEmail_ctr($email){

    $details = new ContactClass();

    return $details->getUserDetailsByEmail_cls($email);
}

function getAdminDetailsByEmail_ctr($email){

    $details = new ContactClass();

    return $details->getAdminDetailsByEmail_cls($email);
}


function get_all_records_ctr()
{
    //create an instance of the class
    $item_object = new ContactClass();

    //run the method
    $item_records = $item_object->get_all_records_cls();

    //check if the method worked
    if ($item_records) {
        //return all the data
        return $item_object->db_fetch_all();
    } else {
        //no data found
        return false;
    }
}

function get_all_newsrecords_ctr()
{
    //create an instance of the class
    $item_object = new ContactClass();

    //run the method
    $item_records = $item_object->get_all_newsrecords_cls();

    //check if the method worked
    if ($item_records) {
        //return all the data
        return $item_object->db_fetch_all();
    } else {
        //no data found
        return false;
    }
}

// function get_all_newsrecords_ctr(){
//     $select= new ContactClass();
//     return $select->get_all_newsrecords_cls();
//   }


// function get_all_newsrecords_ctr()
// {
//     //create an instance of the class
//     $item_object = new ContactClass();

//     //run the method
//     $item_records = $item_object->get_all_newsrecords_cls();

//     //check if the method worked
//     if ($item_records) {
//         //return all the data
//         return $item_object->db_fetch_all();
//     } else {
//         //no data found
//         return false;
//     }
// }

function get_all_adminrecords_ctr()
{
    //create an instance of the class
    $item_object = new ContactClass();

    //run the method
    $item_records = $item_object->get_all_adminrecords_cls();

    //check if the method worked
    if ($item_records) {
        //return all the data
        return $item_object->db_fetch_all();
    } else {
        //no data found
        return false;
    }
}

function get_one_record_ctr($cid)
{
    //create an instance of the class
    $item_object = new ContactClass();

    //run the method
    $item_records = $item_object->get_one_record_cls($cid);

    //check if the method worked
    if ($item_records) {
        //return all the data
        return $item_object->db_fetch_one();
    } else {
        //no data found
        return false;
    }
}

function delete_record_ctr($id)
{
    // create an instance of the Product class
    $class_instance = new ContactClass();
    // call the method from the class
    return $class_instance->delete_record_cls($id);
}

function delete_newsrecord_ctr($id)
{
    // create an instance of the Product class
    $class_instance = new ContactClass();
    // call the method from the class
    return $class_instance->delete_newsrecord_cls($id);
}

?>
