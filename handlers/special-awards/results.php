<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);

$special_awards = [];

if (count($event)) {
	
	$event_id = $event[0]['id'];
	
	$special_awards = $con->getData("SELECT id, description, winners, '".$event[0]['description']."' tabulation_event, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_tabulator'].") event_tabulator, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_chairman'].") event_chairman FROM special_awards WHERE event_id = $event_id AND is_shown = 1");
	
	foreach ($special_awards as $i => $special_award) {
		
		$special_awards[$i]['chairman_id'] = $event[0]['event_chairman'];
		
		$sql = "SELECT id, sac_id, portion_id, criteria_id, (SELECT description FROM criteria WHERE criteria.id = special_award_criteria.criteria_id) criteria_description, percentage FROM special_award_criteria WHERE sac_id = ".$special_award['id'];
		$criteria = $con->getData($sql);

		$contestants = $con->getData("SELECT special_award_contestants.contestant_id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM special_award_contestants LEFT JOIN contestants ON special_award_contestants.contestant_id = contestants.id WHERE special_award_contestants.sac_id = ".$special_award['id']);
		$overall_contestants = $contestants;

		// Each criteria must have the same set of judges for overall to be accurate
		$portion_judges = [];
		if (count($criteria)) $portion_judges = $con->getData("SELECT users.id, CONCAT(users.first_name, ' ', users.last_name) fullname FROM portions_judges LEFT JOIN users ON portions_judges.judge_id = users.id WHERE portions_judges.portion_id = ".$criteria[0]['portion_id']." ORDER BY users.id");

		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$overall_contestants[$ii]['judges'] = [];	
			$overall_contestants[$ii]['total_score'] = 0;
			$overall_contestants[$ii]['average'] = 0;
			
			foreach ($portion_judges as $pj) {
				
				$overall_contestants[$ii]['judges'][] = array(
					"id"=>$pj['id'],
					"th"=>$pj['fullname'],
					"score"=>0
				);
				
			};
			
		};
		
		$table_header_overall = [];
		$table_header_overall[] = array("id"=>0,"th"=>"No");
		$table_header_overall[] = array("id"=>0,"th"=>"Contestant");
		
		foreach ($portion_judges as $pj) {
		
			$table_header_overall[] = array(
				"id"=>$pj['id'],
				"th"=>$pj['fullname']
			);
			
		};
		
		foreach ($criteria as $ii => $criterion) {

			$table_header = [];
			$table_header[] = array("id"=>0,"th"=>"No");
			$table_header[] = array("id"=>0,"th"=>"Contestant");
			
			foreach ($portion_judges as $pj) {
				
				$table_header[] = array("id"=>$pj['id'],"th"=>$pj['fullname']);		
				
			};
			
			$table_header[] = array("id"=>0,"th"=>"Score");
			$table_header[] = array("id"=>0,"th"=>"Average");
			$table_header[] = array("id"=>0,"th"=>"Percentage Score");
			
			$criteria[$ii]['table_header'] = $table_header;
			
			foreach ($contestants as $iii => $contestant) {
				
				// get portion_contestant_id
				$get_portion_contestant_id = $con->getData("SELECT id FROM portions_contestants WHERE contestant_id = ".$contestant['contestant_id']." AND portion_id = ".$criterion['portion_id']);					
				$portion_contestant_id = $get_portion_contestant_id[0]['id'];			
				
				$contestants[$iii]['judges'] = [];
				
				foreach ($portion_judges as $iiii => $pj) {
					
					$pj_score = 0;
					
					$get_pj_score = $con->getData("SELECT SUM(score) total_score FROM scores WHERE portion_contestant_id = $portion_contestant_id AND score_criterion = ".$criterion['criteria_id']." AND judge_id = ".$pj['id']);
					if ((count($get_pj_score)) && ($get_pj_score[0]['total_score']!=null)) {
						$pj_score = $get_pj_score[0]['total_score'];
					};

					$contestants[$iii]['judges'][] = array(
						"id"=>$pj['id'],
						"score"=>$pj_score
					);

					$overall_contestants[$iii]['judges'][$iiii]['score'] += $pj_score;		
					
				};
				
				$contestants[$iii]['score'] = 0;
				$contestants[$iii]['average'] = 0;					

				// portion judges
				$no_of_judges = (count($portion_judges)>0)?count($portion_judges):1;
				
				$score = $con->getData("SELECT SUM(score) total_score FROM scores WHERE portion_contestant_id = $portion_contestant_id AND score_criterion = ".$criterion['criteria_id']);								

				$total_score = 0;
				$percentage_score = 0;
				if (count($score)) {
					
					$total_score = $score[0]['total_score'];					
					$average = $total_score/$no_of_judges;					
					$contestants[$iii]['score'] = round($total_score,2);
					$contestants[$iii]['average'] = round($average,2);
				
					$percentage_score = $average*($criterion['percentage']/100);
					$contestants[$iii]['percentage_score'] = round($percentage_score,2);
				
				};
				
				$overall_contestants[$iii]['total_score'] += $total_score;
				$overall_contestants[$iii]['average'] += round($percentage_score,2);
				
			};
			
			$criteria[$ii]['contestants'] = $contestants;
			
		};
		
		$table_header_overall[] = array("id"=>0,"th"=>"Total Score");
		$table_header_overall[] = array("id"=>0,"th"=>"Average");
		$table_header_overall[] = array("id"=>0,"th"=>"Adj");
		$table_header_overall[] = array("id"=>0,"th"=>"Rank");
		$table_header_overall[] = array("id"=>0,"th"=>"Remarks");			
		
		$special_awards[$i]['criteria'] = $criteria;
		
		$ranks = [];
		
		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$adj = $con->getData("SELECT points FROM scores_adjustments_special_awards WHERE sac_id = ".$special_award['id']." AND contestant_id = ".$overall_contestant['contestant_id']);			
			
			$adj_points = (count($adj))?$adj[0]['points']:0;
			
			$overall_contestants[$ii]['adj'] = $adj_points;
			
			$overall_total_score = $overall_contestants[$ii]['total_score']+$adj_points;
			$overall_total_score = round($overall_total_score,2);
			$overall_contestants[$ii]['total_score'] = $overall_total_score;
			
			$ranks[] = $overall_contestants[$ii]['total_score'];		
			
		};	
		
		array_multisort($ranks, SORT_DESC, $overall_contestants);
		
		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$overall_contestants[$ii]['rank'] = $ii+1;
			
		};
		
		# rank / ties
		foreach ($overall_contestants as $ii => $overall_contestant) {
			
			$overall_contestants[$ii]['tied'] = checkForSATies($overall_contestants,$overall_contestant);						
			
		};
		
		# compute ties
		foreach ($overall_contestants as $ii => $overall_contestant) {
				
			$ties = $overall_contestant['tied']['ties'];
			
			$add_ranks = 0;
			foreach ($ties as $t) {
				$add_ranks += $t;
			};
			$no_ties = (count($ties))?count($ties):1;
			$rank = $add_ranks/$no_ties;
			
			$overall_contestants[$ii]['rank'] = $rank;

		};
		#		
		
		$special_awards[$i]['overall'] = array(
			"table_header"=>$table_header_overall,
			"contestants"=>$overall_contestants
		);
		
		$places = $con->getData("SELECT rank, description FROM special_award_places WHERE sac_id = ".$special_award['id']);
		
		$special_awards[$i]['places'] = [];
		foreach ($places as $place) {
			$special_awards[$i]['places'][$place['rank']] = $place['description'];
		};			
		
	};
	
};

function checkForSATies($contestants,$contestant_overall) {

	$tied = false;
	$ties = [];		
	$remarks = "";

	foreach($contestants as $contestant) {
		
		if ((string)$contestant['total_score'] === (string)$contestant_overall['total_score']) {
			$ties[] = $contestant['rank'];			
			if ($contestant['contestant_no'] === $contestant_overall['contestant_no']) continue;
			$tied = true;
			$remarks .= $contestant['description'].", ";
		};
		
	};

	if ($remarks != "") {
		$remarks = substr($remarks,0,strlen($remarks)-2);
		$remarks = "Tied with ".$remarks;
	};
	
	return array(
		"isTied"=>$tied,
		"ties"=>$ties,
		"remarks"=>$remarks
	);

};

echo json_encode($special_awards);

?>