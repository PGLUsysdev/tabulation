<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$portion_id = (isset($_POST['id']))?$_POST['id']:0;

$con = new pdo_db();

$judges = $con->getData("SELECT * FROM portions_judges WHERE portion_id = $portion_id");

foreach ($judges as $i => $judge) {
	
	$j = $con->getData("SELECT CONCAT(first_name, ' ', last_name) name FROM users WHERE id = ".$judge['judge_id']);
	
	$judges[$i]['name'] = $j[0]['name'];
	
	$status = "On going"; # Waiting for confirmation, Done
	
	# progress
	# get portion contestants
	$contestants = $con->getData("SELECT GROUP_CONCAT(id) contestants FROM portions_contestants WHERE portion_id = $portion_id");	

	$portion_constestants = $con->getData("SELECT id FROM portions_contestants WHERE portion_id = $portion_id");
	$total_contestants = count($portion_constestants);
	
	# get portion criteria
	$criteria = $con->getData("SELECT GROUP_CONCAT(id) criteria FROM criteria WHERE portion_id = $portion_id");
	$portion_criteria = $con->getData("SELECT id FROM criteria WHERE portion_id = $portion_id");
	$total_criteria = count($portion_criteria);
	
	$total = $total_contestants*$total_criteria;
	
	$position = 0;
	if ($total>0) {
		$scores = $con->getData("SELECT * FROM scores WHERE judge_id = ".$judge['judge_id']." AND portion_contestant_id IN (".$contestants[0]['contestants'].") AND score_criterion IN (".$criteria[0]['criteria'].")");
		foreach ($scores as $score) {
			if ($score['score']>0) {
				$position++;
			} else {
				$get_criterion = $con->getData("SELECT extract_portion FROM criteria WHERE id = ".$score['score_criterion']);
				if ((count($get_criterion)) && ($get_criterion[0]['extract_portion']!=null)) $position++;
			}
		};
	} else {
		$total = 1;
	};

	$progress = ceil(($position/$total)*100);
	$judges[$i]['progress'] = $progress;
	
	if ($progress==100) $status = "Waiting for confirmation";

	$confirmation = $con->getData("SELECT * FROM portions_judges_confirmation WHERE judge_id = ".$judge['judge_id']." AND portion_id = ".$portion_id);

	if (count($confirmation)) {
		if ($confirmation[0]['confirmation']==1) $status = "Done";
	};

	$judges[$i]['status'] = $status;
	
};

$criteria_progress = [];

$criteria_headers = $con->getData("SELECT id, description FROM criteria WHERE portion_id = $portion_id");

$criterion_headers = [];
foreach ($criteria_headers as $ch) {
	
	$criterion_headers[] = array(
		"id"=>$ch['id'],
		"th"=>$ch['description']
	);	
	
};

$criterion_judges = [];
foreach ($judges as $i => $pj) {

	$j = $con->getData("SELECT CONCAT(first_name, ' ', last_name) name FROM users WHERE id = ".$pj['judge_id']);

	$judge_criteria = [];
	
	$get_portion_criteria_ids = $con->getData("SELECT GROUP_CONCAT(id) contestants FROM portions_contestants WHERE portion_id = $portion_id");
	
	$get_portion_constestants = $con->getData("SELECT id FROM portions_contestants WHERE portion_id = $portion_id");
	$judge_total_contestants = (count($get_portion_constestants))?count($get_portion_constestants):1;

	foreach ($criterion_headers as $ich => $ch) {
		
		$judge_scores = [];
		
		if (count($get_portion_constestants)) {
			$js_sql = "SELECT score FROM scores WHERE judge_id = ".$pj['judge_id']." AND portion_contestant_id IN (".$get_portion_criteria_ids[0]['contestants'].") AND score_criterion = ".$ch['id'];
			$judge_scores = $con->getData($js_sql);
		}
		
		$criterion_progress = 0;

		foreach ($judge_scores as $js) {
			
			if ($js['score']>0) $criterion_progress++;
			
		};

		$judge_criteria[$ich] = array(
			"id"=>$ch['id'],
			"progress"=>ceil(($criterion_progress/$judge_total_contestants)*100)
		);
	};

	$criterion_judges[] = array(
		"judge_id"=>$pj['judge_id'],
		"name"=>$j[0]['name'],
		"criteria"=>$judge_criteria
	);

};

$criteria_progress = array(
	"headers"=>$criterion_headers,
	"judges"=>$criterion_judges
);

$status = array(
	"portion"=>$judges,
	"criteria"=>$criteria_progress
);

echo json_encode($status);

?>