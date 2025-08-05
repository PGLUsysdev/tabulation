<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$competition_rounds = (isset($_POST['rounds']))?$_POST['rounds']:[];

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);
$active_event = $event[0]['id'];

if (count($event)) {
	
	$con->table = "portions";
	$sql = "SELECT id, description FROM portions WHERE event_id = $active_event AND is_shown = 1";
	$portions = $con->getData($sql);
	
};

echo json_encode($portions);

?>