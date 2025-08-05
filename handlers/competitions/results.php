<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);

$competitions = [];

if (count($event)) {
	
	$event_id = $event[0]['id'];
	
	$competitions = $con->getData("SELECT id, description, winners, '".$event[0]['description']."' tabulation_event, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_tabulator'].") event_tabulator, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_chairman'].") event_chairman FROM competitions WHERE event_id = $event_id AND is_shown = 1");
	
	foreach ($competitions as $i => $competition) {
		
		$sql = "SELECT id, c_id, round_id, (SELECT description FROM rounds WHERE rounds.id = competition_rounds.round_id) round_description, percentage FROM competition_rounds WHERE c_id = ".$competition['id'];

		$rounds = $con->getData($sql);
		
		$overall_contestants = [];
		
		$contestants = $con->getData("SELECT contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM competition_contestants LEFT JOIN contestants ON competition_contestants.contestant_id = contestants.id WHERE competition_contestants.c_id = ".$competition['id']." ORDER BY contestants.contestant_no");		
		
		$overall_contestants = $contestants;
		
		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$overall_contestants[$ii]['competition_total'] = 0; 
			
		};
		
		foreach ($rounds as $ii => $round) {

			$table_header = [];
			$table_header_overall = [];
			$table_header[] = array("th"=>"No");
			$table_header[] = array("th"=>"Contestant");

			$rounds_portions = $con->getData("SELECT rounds_portions.id, rounds_portions.portion_id, (SELECT portions.description FROM portions WHERE portions.id = rounds_portions.portion_id) portion_description, rounds_portions.percentage FROM rounds_portions WHERE rounds_portions.round_id = ".$round['round_id']);

			foreach ($rounds_portions as $rp) {
				
				$table_header[] = array("th"=>$rp['portion_description']." (".$rp['percentage']."%)");
				
			};

			// $table_header[] = array("th"=>"Total Scores");
			$table_header[] = array("th"=>"Percentage Total");
			
			$table_header_overall[] = array("th"=>"No");
			$table_header_overall[] = array("th"=>"Contestant");
			$table_header_overall[] = array("th"=>"Total");
			$table_header_overall[] = array("th"=>"Adj");
			$table_header_overall[] = array("th"=>"Rank");
			$table_header_overall[] = array("th"=>"Remarks");
			
			$rounds[$ii]['table_header'] = $table_header;	
			
			foreach ($contestants as $iii => $contestant) {

				$contestants[$iii]['scores'] = [];

				$total_scores = 0;
				$percentage_score = 0;

				foreach ($rounds_portions as $rp) { // each portion of round
					
					// get portion_contestant_id
					$get_portion_contestant_id = $con->getData("SELECT id FROM portions_contestants WHERE contestant_id = ".$contestant['id']." AND portion_id = ".$rp['portion_id']);					
					$portion_contestant_id = $get_portion_contestant_id[0]['id'];
					
					// portion judges
					$portion_judges = $con->getData("SELECT * FROM portions_judges WHERE portion_id = ".$rp['portion_id']);
					$no_of_judges = (count($portion_judges)>0)?count($portion_judges):1;
					
					$portion_scores = $con->getData("SELECT SUM(score) portion_scores FROM scores WHERE portion_contestant_id = $portion_contestant_id AND score_criterion IN (SELECT id FROM criteria WHERE portion_id = ".$rp['portion_id'].")");					
					
					$score = (count($portion_scores))?$portion_scores[0]['portion_scores']:0;
					$average = $score/$no_of_judges;
					
					$total_scores += $average;
					$percentage_score += $average*($rp['percentage']/100);
					
					$contestants[$iii]['scores'][] = array(
						"score"=>$score,
						"average"=>$average
					);

				};
				
				// $contestants[$iii]['total_scores'] = $total_scores;
				$contestants[$iii]['percentage_score'] = $percentage_score;
				
				$competition_total = $percentage_score*($round['percentage']/100);
				$overall_contestants[$iii]['competition_total'] += $competition_total; 
				
			};
			
			$rounds[$ii]['contestants'] = $contestants;

		};
		
		$competitions[$i]['rounds'] = $rounds;
		
		$ranks = [];
		
		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$adj = $con->getData("SELECT points FROM scores_adjustments_competitions WHERE c_id = ".$competition['id']." AND contestant_id = ".$overall_contestant['id']);			
			
			$adj_points = (count($adj))?$adj[0]['points']:0;
			
			$overall_contestants[$ii]['adj'] = $adj_points;
			
			$overall_contestants[$ii]['competition_total'] = $overall_contestants[$ii]['competition_total']+$adj_points;			
			
		};
		
		# rank / ties
		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$ranks[] = $overall_contestant['competition_total'];
			
			$overall_contestants[$ii]['tied'] = checkForSATies($overall_contestants,$overall_contestant);						
			
		};
		
		array_multisort($ranks, SORT_DESC, $overall_contestants);
		
		$competitions[$i]['overall'] = array(
			"table_header"=>$table_header_overall,
			"contestants"=>$overall_contestants
		);
		
		$places = $con->getData("SELECT rank, description FROM competition_places WHERE c_id = ".$competition['id']);

		$competitions[$i]['places'] = [];
		foreach ($places as $place) {
			$competitions[$i]['places'][$place['rank']] = $place['description'];
		};			
		
	};
	
};

function checkForSATies($contestants,$contestant_overall) {

	$tied = false;
	$remarks = "";

	foreach($contestants as $contestant) {
		
		if ((string)$contestant['competition_total'] === (string)$contestant_overall['competition_total']) {
			if ($contestant['contestant_no'] === $contestant_overall['contestant_no']) continue;
			$tied = true;
			$remarks .= $contestant['description'].", ";
		};
		
	};

	if ($remarks != "") {
		$remarks = substr($remarks,0,strlen($remarks)-2);
		$remarks = "Tied with ".$remarks;
	};
	
	return array("isTied"=>$tied,"remarks"=>$remarks);

};

echo json_encode($competitions);

?>