<?php

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);

$portions = [];

if (count($event)) {
	
	$con->table = "portions";
	$portions = $con->get(["event_id"=>$event[0]['id'],"is_shown"=>1],["id","description"]);

	$con->table = "portions_contestants";	
	foreach ($portions as $key => $portion) {
		
		$sql = "SELECT id, (SELECT contestants.contestant_no FROM contestants WHERE contestants.id = portions_contestants.contestant_id) contestant_no, (SELECT contestants.contestant_name FROM contestants WHERE contestants.id = portions_contestants.contestant_id) contestant_name, (SELECT description FROM contestants WHERE contestants.id = portions_contestants.contestant_id) description FROM portions_contestants WHERE portion_id = $portion[id] ORDER BY contestant_id";
		$portions_contestants = $con->getData($sql);
		$portions[$key]['contestants'] = $portions_contestants;
		
	};
	
};

echo json_encode($portions);

?>