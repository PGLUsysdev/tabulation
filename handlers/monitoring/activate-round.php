<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("rounds");

require_once '../active-event.php';

$round = $_POST;

$activate = array("id"=>$round['id'],"is_shown"=>($round['is_shown'])?1:0,"last_modified"=>"CURRENT_TIMESTAMP");

$update_portion = $con->updateData($activate,'id');

# portions_toggles

session_start();

$portion_toggle = array(
	"event_id"=>$active_event['id'],
	"portion_id"=>$round['id'],
	"user_id"=>$_SESSION['id'],
	"system_log"=>"CURRENT_TIMESTAMP"
);

?>