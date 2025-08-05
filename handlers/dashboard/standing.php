<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);

$standing = [];

if (count($event)) {
	
	$judge = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) fullname FROM users WHERE id = ".$_SESSION['id']." AND tabulation_event = ".$event[0]['id']);	

	$contestants = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = ".$_POST['portion_id']);
		
	$table_header = [];
	$criteria = $con->getData("SELECT id, description, percentage FROM criteria WHERE portion_id = ".$_POST['portion_id']." ORDER BY id");
	if (count($criteria)) {
		$table_header[] = array("th"=>"No");
		$table_header[] = array("th"=>"Contestant");
		foreach ($criteria as $i => $criterion) {
			$table_header[] = array("th"=>$criterion['description']." (".$criterion['percentage']."%)");
		};
		$table_header[] = array("th"=>"Total");			
	}
	
	$rank = [];
	
	foreach($contestants as $ic => $contestant) { # per contestant

		$scores = [];
		$total_scores = 0;

		foreach ($criteria as $i => $criterion) {

			$criterion_score = $con->getData("SELECT scores.id, (CONCAT(criteria.description, ' (',criteria.percentage,'%)')) description, scores.score FROM scores LEFT JOIN criteria ON scores.score_criterion = criteria.id WHERE scores.score_criterion = ".$criterion['id']." AND scores.judge_id = ".$judge[0]['id']." AND scores.portion_contestant_id = $contestant[id] ORDER BY scores.score_criterion"); # contestant scores
			
			if (count($criterion_score)) {
			
				foreach ($criterion_score as $cs) {
					
					$total_scores += $cs['score'];
					
				};
				
				$scores[] = $criterion_score[0];
			
			} else {
				
				$criterion_description = $con->getData("SELECT criteria.id, (CONCAT(criteria.description, ' (',criteria.percentage,'%)')) description FROM criteria WHERE criteria.id = ".$criterion['id']);				
				
				$criterion_score = array(
					"id"=>0,
					"description"=>$criterion_description[0]['description'],
					"score"=>0
				);

				$total_scores += $criterion_score['score'];

				$scores[] = $criterion_score;				
				
			};
		
		};
		
		$scores[] = array("id"=>0,"description"=>"Total","score"=>$total_scores);
		$rank[] = $total_scores;			
		
		$contestants[$ic]['scores'] = $scores;

	};
	
	array_multisort($rank, SORT_DESC, $contestants);				
	
	$standing = array("search"=>"","table_header"=>$table_header,"contestants"=>$contestants);
	
};

echo json_encode($standing);

?>