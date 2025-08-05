<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","event_tabulator"]);
$active_event = $event[0]['id'];

$tabulator = $event[0]['event_tabulator'];

$judge = $con->getData("SELECT CONCAT(first_name, ' ', last_name) fullname FROM users WHERE id = ".$_SESSION['id']);

$notification = array(
	"event_id"=>$active_event,
	"user_id"=>$tabulator,	
	"icon"=>"fa-users",
	"message"=>$judge[0]['fullname']." has finished scoring for <strong>".$_POST['portion_description']." Portion</strong><hr>Click this notification to dismiss",
	"date_created"=>"CURRENT_TIMESTAMP"
);

$con->table = "notifications";
$notify = $con->insertData($notification);

?>