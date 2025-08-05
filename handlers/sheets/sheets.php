<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../criterion-portion.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);

$portions = [];

if (count($event)) {
	
	$judges = [];
	
	// $judges = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) fullname, '' search FROM users WHERE user_group = 2 AND tabulation_event = ".$event[0]['id']);	
	// $no_of_judges = (count($judges))?count($judges):1;
	
	$sql = "SELECT portions.id, portions.description, portions.winners, '".$event[0]['description']."' tabulation_event, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_chairman'].") event_chairman, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_tabulator'].") event_tabulator FROM portions WHERE portions.event_id = ".$event[0]['id']." AND portions.is_shown = 1";
	$portions = $con->getData($sql);	
	
	foreach ($portions as $ip => $portion) { # per portion
		
		$portion_judges = $con->getData("SELECT users.id, CONCAT(users.first_name, ' ', users.last_name) fullname FROM portions_judges LEFT JOIN users ON portions_judges.judge_id = users.id WHERE users.user_group = 2 AND portions_judges.portion_id = ".$portion['id']." AND users.tabulation_event = ".$event[0]['id']);			
		$no_of_judges = (count($portion_judges))?count($portion_judges):1;
		
		$contestants = [];
		
		$contestants = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = $portion[id]");
		
		$table_header = [];
		$table_header_overall = [];
		$criteria = $con->getData("SELECT id, description, percentage, minimum, extract_portion FROM criteria WHERE portion_id = $portion[id] ORDER BY id");
		if (count($criteria)) {
			$table_header[] = array("th"=>"No","has_extract_portion"=>false);
			$table_header[] = array("th"=>"Contestant","has_extract_portion"=>false);
			foreach ($criteria as $i => $criterion) {
				$table_header[] = array(
					"th"=>$criterion['description']." (".$criterion['percentage']."%)",
					"has_extract_portion"=>($criterion['extract_portion']==null)?false:true
				);
				$table_header_overall[] = array("id"=>$criterion['id'],"th"=>$criterion['description']." (".$criterion['percentage']."%)");
			};
		};	

		# for search
		$portions[$ip]['search'] = "";
		
		# judges
		$portions[$ip]['judges'] = $portion_judges;
		
		foreach ($portions[$ip]['judges'] as $ij => $judge) { # per judge			
			
			# table header
			$portions[$ip]['judges'][$ij]['table_header'] = $table_header;
			
			$portions[$ip]['judges'][$ij]['contestants'] = $contestants;			
			
			foreach($portions[$ip]['judges'][$ij]['contestants'] as $ic => $contestant) { # per contestant
				
				$scores = $criteria;
				
				foreach ($scores as $is => $score) {
					
					$has_extract_portion = ($score['extract_portion']!=null)?true:false;

					$sql = "SELECT id score_id, score FROM scores WHERE score_criterion = ".$score['id']." AND judge_id = $judge[id] AND portion_contestant_id = $contestant[id]";
					$judge_score = $con->getData($sql);
					
					$scores[$is]['score_id'] = intval((string)$judge['id'].(string)$contestant['id']);
					$scores[$is]['score'] = 0;
					$scores[$is]['invalid'] = false;
					$scores[$is]['error_message'] = "";
					
					if ($has_extract_portion) {

						$portion_score = criterion_portion($con,$score['extract_portion'],$contestant['contestant_id']);

						$percentage_portion_score = $portion_score*($score['percentage']/100);

						$percentage_portion_score = round($percentage_portion_score,2);

						$scores[$is]['score'] = $percentage_portion_score;

					};
					
					if (count($judge_score)) {

						$scores[$is]['score_id'] = $judge_score[0]['score_id'];
						$scores[$is]['score'] = $judge_score[0]['score'];

					};
					
				};
				
				$portions[$ip]['judges'][$ij]['contestants'][$ic]['scores'] = $scores;

			};	
			
		};
		
	};	
	
};

header("Content-type: application/json");
echo json_encode($portions);

?>