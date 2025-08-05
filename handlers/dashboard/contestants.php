<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);

$contestants = [];

if (count($event)) {
	
	$con->table = "contestants";
	
	$contestants = $con->get(["event_id"=>$event[0]['id'],"is_active"=>1],["id","contestant_no","contestant_name","description"]);

	$con->table = "portions_contestants";

	$portions_contestants = $con->get(["portion_id"=>$_POST['portion_id']],["id","contestant_id","(SELECT contestants.contestant_no FROM contestants WHERE contestants.id = portions_contestants.contestant_id) contestant_no","(SELECT contestants.contestant_name FROM contestants WHERE contestants.id = portions_contestants.contestant_id) contestant_name","(SELECT description FROM contestants WHERE contestants.id = portions_contestants.contestant_id) description"]);		

};

foreach ($contestants as $key => $contestant) {
	
	$contestants[$key]['participant'] = isParticipant($portions_contestants,$contestant);
	
};

echo json_encode($contestants);

function isParticipant($portions_contestants,$contestant) {
	
	$isParticipant = false;
	
	foreach ($portions_contestants as $pc) {
		
		if ($pc['contestant_id'] == $contestant['id']) $isParticipant = true;
		
	}
	
	return $isParticipant;
	
};

?>