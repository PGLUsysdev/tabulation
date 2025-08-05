<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions_judges");

$event_id = (isset($_POST['event_id']))?$_POST['event_id']:0;
$portion_id = $_POST['portion_id'];

$judges = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) fullname, gender FROM users WHERE tabulation_event = $event_id AND user_group = 2 ORDER BY id DESC");

$portions_judges = $con->getData("SELECT id, portion_id, judge_id FROM portions_judges WHERE portion_id = $portion_id");

if (count($portions_judges)==0) {

	foreach ($judges as $judge) {
		
		$portions_judges[] = array(
			"id"=>0,
			"portion_id"=>$portion_id,
			"judge_id"=>$judge['id'],
			"judge_fullname"=>$judge['fullname'],
			"gender"=>$judge['gender'],
			"status"=>false
		);
		
	};

} else {
	
	$portions_judges = [];
	
	foreach ($judges as $judge) {
		
		$portion_judge = $con->getData("SELECT id, portion_id, judge_id FROM portions_judges WHERE portion_id = $portion_id AND judge_id = ".$judge['id']);
		
		$portions_judges[] = array(
			"id"=>(count($portion_judge))?$portion_judge[0]['id']:0,
			"portion_id"=>$portion_id,
			"judge_id"=>$judge['id'],
			"judge_fullname"=>$judge['fullname'],
			"gender"=>$judge['gender'],
			"status"=>(count($portion_judge))?true:false
		);
		
	};
	
};

echo json_encode($portions_judges);

?>