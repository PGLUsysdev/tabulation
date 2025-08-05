<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$round_portions = (isset($_POST['portions']))?$_POST['portions']:[];

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);
$active_event = $event[0]['id'];

$portions = [];

$portion_ids = [];
foreach ($round_portions as $rp) {
	
	$portion_ids[] = $rp['portion_id'];
	
};
$ids = implode(",",$portion_ids);

if (count($event)) {
	
	$con->table = "portions";
	$sql = "SELECT id, description FROM portions WHERE event_id = $active_event AND is_shown = 1 AND id NOT IN ($ids)";
	$portions = $con->getData($sql);
	
};

echo json_encode($portions);

?>