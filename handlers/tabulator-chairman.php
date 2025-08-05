<?php

require_once '../db.php';

$con = new pdo_db("tabulation_events");

$active_event = $con->get(["is_active"=>1],["id","description","event_tabulator","event_chairman"]);

$tabulator_chairman = [];

if (count($active_event)) {
	
	$tabulator = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) full_name FROM users WHERE id = ".$active_event[0]['event_tabulator']);
	
	$chairman = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) full_name FROM users WHERE id = ".$active_event[0]['event_chairman']);
	
	$tabulator_chairman = array(
		"tabulator"=>$tabulator[0],
		"chairman"=>$chairman[0]
	);
	
};

echo json_encode($tabulator_chairman);

?>