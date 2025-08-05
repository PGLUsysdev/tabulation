<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);

$contestants = [];

$special_award_id = $_POST['id'];

if (count($event)) {
	
	$con->table = "contestants";
	
	$contestants = $con->get(["event_id"=>$event[0]['id'],"is_active"=>1],["id","contestant_no","contestant_name","description"]);

	$special_award_contestants = $con->getData("SELECT id, contestant_id, (SELECT contestants.contestant_no FROM contestants WHERE contestants.id = special_award_contestants.contestant_id) contestant_no, (SELECT contestants.contestant_name FROM contestants WHERE contestants.id = special_award_contestants.contestant_id) contestant_name, (SELECT contestants.description FROM contestants WHERE contestants.id = special_award_contestants.contestant_id) description FROM special_award_contestants WHERE sac_id = ".$special_award_id);

};

foreach ($contestants as $key => $contestant) {
	
	$contestants[$key]['participant'] = isParticipant($special_award_contestants,$contestant);
	
};

echo json_encode($contestants);

function isParticipant($special_award_contestants,$contestant) {
	
	$isParticipant = false;
	
	foreach ($special_award_contestants as $cc) {
		
		if ($cc['contestant_id'] == $contestant['id']) $isParticipant = true;
		
	}
	
	return $isParticipant;
	
};

?>