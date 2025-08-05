<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions");

require_once '../active-event.php';

$portion = $_POST;

$toggle = array("id"=>$portion['id'],"toggle"=>($portion['toggle'])?1:0,"last_modified"=>"CURRENT_TIMESTAMP");

$update_portion = $con->updateData($toggle,'id');

# portions_toggles

session_start();

$portion_toggle = array(
	"event_id"=>$active_event['id'],
	"portion_id"=>$portion['id'],
	"user_id"=>$_SESSION['id'],
	"system_log"=>"CURRENT_TIMESTAMP"
);

$con->table="portions_toggles";
$insert_toggle = $con->insertData($portion_toggle);

?>