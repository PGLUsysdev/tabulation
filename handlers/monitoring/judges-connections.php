<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

set_error_handler('no_connectivity');

function no_connectivity($errno, $errstr, $errfile, $errline) {

	
};

$portion_id = (isset($_POST['id']))?$_POST['id']:0;

$con = new pdo_db();

$judges = $con->getData("SELECT * FROM portions_judges WHERE portion_id = $portion_id");

foreach ($judges as $i => $judge) {
	
	$j = $con->getData("SELECT CONCAT(first_name, ' ', last_name) name, ip_address FROM users WHERE id = ".$judge['judge_id']);
	
	$judges[$i]['name'] = $j[0]['name'];
	
	$ip_address = $j[0]['ip_address'];
	$judges[$i]['ip_address'] = $ip_address;
	
	$status = false;
	
	if (($ip_address!=null)&&($ip_address!="")) $status = is_connected($ip_address);

	$judges[$i]['status'] = $status;
	
};

function is_connected($ip)
{
    $connected = @fsockopen($ip, 80); 
    //website, port  (try 80 or 443)
    if ($connected){
        $is_conn = true; //action when connected
        fclose($connected);
    }else{
        $is_conn = false; //action in connection failure
    }
    return $is_conn;

}

echo json_encode($judges);

?>