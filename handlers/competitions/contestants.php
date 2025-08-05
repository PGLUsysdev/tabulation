<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);

$contestants = [];

$competition_id = $_POST['id'];

if (count($event)) {
	
	$con->table = "contestants";
	
	$contestants = $con->get(["event_id"=>$event[0]['id'],"is_active"=>1],["id","contestant_no","contestant_name","description"]);

	$competition_contestants = $con->getData("SELECT id, contestant_id, (SELECT contestants.contestant_no FROM contestants WHERE contestants.id = competition_contestants.contestant_id) contestant_no, (SELECT contestants.contestant_name FROM contestants WHERE contestants.id = competition_contestants.contestant_id) contestant_name, (SELECT contestants.description FROM contestants WHERE contestants.id = competition_contestants.contestant_id) description FROM competition_contestants WHERE c_id = ".$competition_id);

};

foreach ($contestants as $key => $contestant) {
	
	$contestants[$key]['participant'] = isParticipant($competition_contestants,$contestant);
	
};

echo json_encode($contestants);

function isParticipant($competition_contestants,$contestant) {
	
	$isParticipant = false;
	
	foreach ($competition_contestants as $cc) {
		
		if ($cc['contestant_id'] == $contestant['id']) $isParticipant = true;
		
	}
	
	return $isParticipant;
	
};

?>