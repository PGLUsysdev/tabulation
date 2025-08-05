<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores");

$judges = $_POST['judges'];

foreach ($judges as $judge) {
	
	$judge_id = $judge['id'];
	$contestants = $judge['contestants'];
	
	foreach ($contestants as $contestant) {
		
		$portion_contestant_id = $contestant['id'];
		
		$scores = $contestant['scores'];
		
		foreach ($scores as $score) {
			
			$score_criterion = $score['id'];
			
			$check = $con->getData("SELECT * FROM scores WHERE judge_id = $judge_id AND portion_contestant_id = $portion_contestant_id AND score_criterion = $score_criterion");
			
			if (count($check)) {
				
				$data = array(
					"id"=>$score['score_id'],"score"=>$score['score']
				);
				
				$update_score = $con->updateData($data,'id');
				
			} else {
				
				$data = array(
					"judge_id"=>$judge_id,
					"portion_contestant_id"=>$portion_contestant_id,
					"score_criterion"=>$score_criterion,
					"score"=>$score['score'],
					"date_created"=>"CURRENT_TIMESTAMP"
				);

				$insert_score = $con->insertData($data);				
				
			};
			
		};
		
	};
	
};

?>