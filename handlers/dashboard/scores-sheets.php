<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../criterion-portion.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);

$portions = [];

$rounds = [];

if (count($event)) {
	
	$judges = [];
	
	$judges = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) fullname FROM users WHERE user_group = 2 AND tabulation_event = ".$event[0]['id']);	
	$no_of_judges = (count($judges))?count($judges):1;
	
	$get_event_tabulator = $con->getData("SELECT CONCAT(first_name, ' ', last_name) event_tabulator FROM users WHERE id = ".$event[0]['event_tabulator']);
	$get_event_chairman = $con->getData("SELECT CONCAT(first_name, ' ', last_name) event_chairman FROM users WHERE id = ".$event[0]['event_chairman']);
	
	$event_tabulator = $get_event_tabulator[0]['event_tabulator'];
	$event_chairman = $get_event_chairman[0]['event_chairman'];
	
	$sql = "SELECT portions.id, portions.description, portions.winners, '".$event[0]['description']."' tabulation_event, portions.event_chairman, portions.event_tabulator, portions.rank_order, portions.results FROM portions WHERE portions.event_id = ".$event[0]['id']." AND portions.is_shown = 1";
	$portions = $con->getData($sql);	
	
	foreach ($portions as $ip => $portion) { # per portion
	
		$portion_rank_order = ($portion['rank_order'])?true:false;		
	
		// override default tabulator/chairman
		if ($portion['event_tabulator']!=null) {
			$get_portion_tabulator = $con->getData("SELECT CONCAT(first_name, ' ', last_name) event_tabulator FROM users WHERE id = ".$portion['event_tabulator']);
			$portion_tabulator = $get_portion_tabulator[0]['event_tabulator'];
			$portions[$ip]['event_tabulator'] = $portion_tabulator;			
		} else {
			$portions[$ip]['event_tabulator'] = $event_tabulator;			
		};
		
		if ($portion['event_chairman']!=null) {
			$get_portion_chairman = $con->getData("SELECT CONCAT(first_name, ' ', last_name) event_chairman FROM users WHERE id = ".$portion['event_chairman']);
			$portion_chairman = $get_portion_chairman[0]['event_chairman'];
			$portions[$ip]['event_chairman'] = $portion_chairman;
			$portions[$ip]['chairman_id'] = $portion['event_chairman'];	
		} else {
			$portions[$ip]['event_chairman'] = $event_chairman;
			$portions[$ip]['chairman_id'] = $event[0]['event_chairman'];			
		};
		//		
		
		$portion_judges = $con->getData("SELECT users.id, CONCAT(users.first_name, ' ', users.last_name) fullname FROM portions_judges LEFT JOIN users ON portions_judges.judge_id = users.id WHERE users.user_group = 2 AND portions_judges.portion_id = ".$portion['id']." AND users.tabulation_event = ".$event[0]['id']." ORDER BY users.id ASC");
		$portion_no_of_judges = (count($portion_judges))?count($portion_judges):1;
		
		$contestants = [];
		
		$contestants = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = $portion[id]");
		
		$table_header = [];
		$criteria = $con->getData("SELECT id, description, percentage, extract_portion FROM criteria WHERE portion_id = $portion[id] ORDER BY id");
		if (count($criteria)) {
			$table_header[] = array("th"=>"No","has_extract_portion"=>false);
			$table_header[] = array("th"=>"Contestant","has_extract_portion"=>false);
			foreach ($criteria as $i => $criterion) {
				$table_header[] = array(
					"th"=>$criterion['description']." (".$criterion['percentage']."%)",
					"has_extract_portion"=>($criterion['extract_portion']==null)?false:true
				);
			};
			$table_header[] = array("th"=>"Total","has_extract_portion"=>false);		
		}
		
		# for Overall
		$table_header_overall = [];		
		foreach ($portion_judges as $ipj => $pj) {
			
			$table_header_overall[] = array("id"=>$pj['id'],"th"=>$pj['fullname']);			
			
		};
		
		$contestants_all_judges = $contestants;		
		foreach ($contestants_all_judges as $icaj => $contestant_all_judge) {
			$contestants_all_judges[$icaj]['all_judges'] = 0;
			$contestants_all_judges[$icaj]['average'] = 0;
			$contestants_all_judges[$icaj]['adj'] = 0;
			
			$contestants_all_judges[$icaj]['scores'] = [];
			
			foreach ($table_header_overall as $itho => $tho) {
				$contestants_all_judges[$icaj]['scores'][] = array(
					"id"=>$tho['id'],
					"score"=>0,
				);
			};
		
		};
		#
		
		# for ranking overall
		$rank_overall = [];
		#
		
		# for search
		$portions[$ip]['search'] = "";
		
		# judges
		// $portions[$ip]['judges'] = $judges;
		$portions[$ip]['judges'] = $portion_judges;

		# portions places
		$places = $con->getData("SELECT rank, description FROM portions_places WHERE portion_id = $portion[id]");
		$portions[$ip]['places'] = [];
		foreach ($places as $place) {
			$portions[$ip]['places'][$place['rank']] = $place['description'];
		};
		
		foreach ($portions[$ip]['judges'] as $ij => $judge) { # per judge
			
			# table header
			$portions[$ip]['judges'][$ij]['table_header'] = $table_header;
			
			$portions[$ip]['judges'][$ij]['contestants'] = $contestants;
			
			# for ranking per judge
			$rank_per_judge = [];
			
			foreach($portions[$ip]['judges'][$ij]['contestants'] as $ic => $contestant) { # per contestant

				$scores = [];
				$total_scores = 0;			

				foreach ($criteria as $i => $criterion) {

					$q_scores = "SELECT scores.id, scores.score_criterion, (CONCAT(criteria.description, ' (',criteria.percentage,'%)')) description, scores.score FROM scores LEFT JOIN criteria ON scores.score_criterion = criteria.id WHERE scores.score_criterion = ".$criterion['id']." AND scores.judge_id = $judge[id] AND scores.portion_contestant_id = $contestant[id] ORDER BY scores.score_criterion";
					$criterion_score = $con->getData($q_scores); # contestant scores
					
					$has_extract_portion = ($criterion['extract_portion']!=null)?true:false;					
					
					$percentage_portion_score = 0;
					if ($has_extract_portion) {

						$portion_score = criterion_portion($con,$criterion['extract_portion'],$contestant['id']);

						$percentage_portion_score = $portion_score*($criterion['percentage']/100);
						
						$percentage_portion_score = round($percentage_portion_score,2);
					
					};
					
					if (count($criterion_score)) {
					
						foreach ($criterion_score as $ics => $cs) {
							
							// if criterion has extract_portion
							if ($has_extract_portion) {
								// $cs['score'] = $percentage_portion_score;
								$criterion_score[$ics]['score'] = $percentage_portion_score;
							};

							// $total_scores += $cs['score'];
							$total_scores += $criterion_score[$ics]['score'];
							
						};
					
						$scores[] = $criterion_score[0];					
					
					} else {
						
						$criterion_description = $con->getData("SELECT criteria.id, (CONCAT(criteria.description, ' (',criteria.percentage,'%)')) description FROM criteria WHERE criteria.id = ".$criterion['id']);
						
						$criterion_score = array(
							"id"=>0,
							"score_criterion"=>$criterion['id'],
							"description"=>$criterion_description[0]['description'],
							"score"=>0
						);
						
						// if criterion has extract_portion
						if ($has_extract_portion) $criterion_score['score'] = $percentage_portion_score;
						//
						
						$total_scores += $criterion_score['score'];			
						
						$scores[] = $criterion_score;
						
					};				
					
				};
				
				$scores[] = array("id"=>0,"score_criterion"=>0,"description"=>"Total","score"=>$total_scores);
				$rank_per_judge[] = $total_scores;
				
				// judges columns in overall
				foreach ($contestants_all_judges[$ic]['scores'] as $iojt => $ojt) {
				
					if ($ojt['id'] == $judge['id']) {
						
						$contestants_all_judges[$ic]['scores'][$iojt]['score'] = $total_scores;
						
					};
					
				};
				
				//
					
				$contestants_all_judges[$ic]['all_judges'] += $total_scores;
				
				$portions[$ip]['judges'][$ij]['contestants'][$ic]['scores'] = $scores;

			};
			
			# rank per judge			
			if ($portion_rank_order) array_multisort($rank_per_judge, SORT_ASC, $portions[$ip]['judges'][$ij]['contestants']);			
			else array_multisort($rank_per_judge, SORT_DESC, $portions[$ip]['judges'][$ij]['contestants']);			
			
		};
		
		# process average
		foreach ($contestants_all_judges as $icaj => $contestant_all_judge) {
			$adj = $con->getData("SELECT points FROM scores_adjustments WHERE portion_contestant_id = ".$contestant_all_judge['id']);
			// $average = ($contestant_all_judge['all_judges']/$no_of_judges)+((count($adj))?$adj[0]['points']:0);
			$average = ($contestant_all_judge['all_judges']/$portion_no_of_judges)+((count($adj))?$adj[0]['points']:0);
			
			// round/ceil
			$average = round($average,2,PHP_ROUND_HALF_UP);
			
			$contestants_all_judges[$icaj]['average'] = $average;
			$contestants_all_judges[$icaj]['adj'] = (count($adj))?$adj[0]['points']:0;
			$rank_overall[] = $average;
		};
		#
		
		$portions[$ip]['overall'] = array(
			"contestants"=>$contestants_all_judges,
			"table_header"=>$table_header_overall,
		);

		# rank overall		
		if ($portion_rank_order) array_multisort($rank_overall, SORT_ASC, $portions[$ip]['overall']['contestants']);
		else array_multisort($rank_overall, SORT_DESC, $portions[$ip]['overall']['contestants']);
		#
		
		foreach ($portions[$ip]['overall']['contestants'] as $oc => $contestant_overall) {
			
			$portions[$ip]['overall']['contestants'][$oc]['rank'] = $oc+1;
			
		};
		
		# check for ties
		foreach ($portions[$ip]['overall']['contestants'] as $oc => $contestant_overall) {

			$portions[$ip]['overall']['contestants'][$oc]['tied'] = checkForPortionTies($portions[$ip]['overall']['contestants'],$contestant_overall);
		
		};
		
		# compute ties
		foreach ($portions[$ip]['overall']['contestants'] as $oc => $contestant_overall) {
				
			$ties = $contestant_overall['tied']['ties'];
			
			$add_ranks = 0;
			foreach ($ties as $t) {
				$add_ranks += $t;
			};
			$no_ties = (count($ties))?count($ties):1;
			$rank = $add_ranks/$no_ties;
			
			$portions[$ip]['overall']['contestants'][$oc]['rank'] = $rank;

		};
		#
		
	};
	
	# for rounds
	$sql = "SELECT rounds.id, rounds.description, '".$event[0]['description']."' tabulation_event, rounds.winners, rounds.method, rounds.event_chairman, rounds.event_tabulator, rounds.rank_order, rounds.results FROM rounds WHERE rounds.event_id = ".$event[0]['id']." AND rounds.is_shown = 1";
	$rounds = $con->getData($sql);		
	
	foreach ($rounds as $r => $round) {
		
		$rounds[$r]['judges'] = [];
		
		$round_rank_order = ($round['rank_order'])?true:false;		
		
		//
		if ($round['event_tabulator']!=null) {
			$get_round_tabulator = $con->getData("SELECT CONCAT(first_name, ' ', last_name) event_tabulator FROM users WHERE id = ".$round['event_tabulator']);
			$round_tabulator = $get_round_tabulator[0]['event_tabulator'];
			$rounds[$r]['event_tabulator'] = $round_tabulator;			
		} else {
			$rounds[$r]['event_tabulator'] = $event_tabulator;
		};
		
		if ($round['event_chairman']!=null) {
			$get_round_chairman = $con->getData("SELECT CONCAT(first_name, ' ', last_name) event_chairman FROM users WHERE id = ".$round['event_chairman']);
			$round_chairman = $get_round_chairman[0]['event_chairman'];
			$rounds[$r]['event_chairman'] = $round_chairman;
			$rounds[$r]['chairman_id'] = $round['event_chairman'];
		} else {
			$rounds[$r]['event_chairman'] = $event_chairman;	
			$rounds[$r]['chairman_id'] = $event[0]['event_chairman'];
		}		
		//
		
		$round_method = $round['method'];
		
		$rounds[$r]['search'] = "";
		$rounds[$r]['places'] = [];
		$rounds[$r]['method'] = $round['method'];
		
		# portions places
		$round_places = $con->getData("SELECT rank, description FROM rounds_places WHERE round_id = $round[id]");
		$rounds[$r]['places'] = [];
		foreach ($round_places as $round_place) {
			$rounds[$r]['places'][$round_place['rank']] = $round_place['description'];
		};
		
		$round_portions = $con->getData("SELECT rounds_portions.id, rounds_portions.portion_id, (SELECT description FROM portions WHERE portions.id = rounds_portions.portion_id) portion_description, rounds_portions.percentage FROM rounds_portions WHERE rounds_portions.round_id = ".$round['id']);			

		$at_least_portion = (count($round_portions))?$round_portions[0]['portion_id']:0;
		
		$round_judges = $con->getData("SELECT users.id, CONCAT(users.first_name, ' ', users.last_name) fullname FROM users WHERE users.id IN (SELECT portions_judges.judge_id FROM portions_judges WHERE portions_judges.portion_id = $at_least_portion)");
		$rounds[$r]['judges'] = $round_judges;
		
		$contestants_round = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = $at_least_portion");
		
		/*
		** sort $contestants_round
		*/
		array_multisort(sortByNo($contestants_round), SORT_ASC, $contestants_round);		
		
		$table_header_overall = [];

		foreach ($round_portions as $irp => $rp) {

			$table_header_overall[] = array(
				"id"=>$rp['portion_id'],
				"type"=>"total",
				"description"=>$rp['portion_description']
			);		
		
		};
		
		foreach ($round_portions as $irp => $rp) {
			
			$table_header_overall[] = array(
				"id"=>$rp['portion_id'],
				"type"=>"percentage",
				"description"=>$rp['percentage']."%"
			);			
			
		};
		
		foreach ($table_header_overall as $irtho => $rtho) {
			
			$table_header_overall[$irtho]['key'] = $irtho+1;
			
		};

		$rounds[$r]['overall'] = array(
			"contestants"=>$contestants_round,
			"table_header"=>$table_header_overall
		);
		
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {
			
			$rounds[$r]['overall']['contestants'][$iroc]['scores'] = [];
			
			foreach($table_header_overall as $rtho) {
				
				$rounds[$r]['overall']['contestants'][$iroc]['scores'][] = array(
					"key"=>$rtho['key'],
					"id"=>$rtho['id'],
					"type"=>$rtho['type'],
					"score"=>0
				);
				
			};
			
			$rounds[$r]['overall']['contestants'][$iroc]['portions_total_average'] = 0;
			$rounds[$r]['overall']['contestants'][$iroc]['portions_percentage_from_average'] = 0;
			$rounds[$r]['overall']['contestants'][$iroc]['round_total'] = 0;
			$rounds[$r]['overall']['contestants'][$iroc]['adj'] = 0;

		};

		$round_portions_total = (count($round_portions))?count($round_portions):1;		
		
		foreach ($round_portions as $rp => $round_portion) {

			$round_portion_percentage = $round_portion['percentage']/100;
			
			$portionRound = portionRound($portions,$round_portion); // get overall from all judges
			
			$round_portions[$rp]['contestants'] = $portionRound;
			
			foreach ($round_portions[$rp]['contestants']['unranked'] as $iuc => $uc) {
				
				$rounds[$r]['overall']['contestants'][$iuc]['portions_total_average'] += $uc['average'];
				$rounds[$r]['overall']['contestants'][$iuc]['portions_percentage_from_average'] += $uc['average']*$round_portion_percentage;
				
				foreach ($rounds[$r]['overall']['contestants'][$iuc]['scores'] as $irocs => $rocs) {
					
					if ($rocs['type'] == "percentage") continue;
					
					if ($rounds[$r]['overall']['contestants'][$iuc]['scores'][$irocs]['type'] == "total") {
						
						if ($rocs['id'] == $round_portion['portion_id']) $rounds[$r]['overall']['contestants'][$iuc]['scores'][$irocs]['score'] = $uc['average'];
						
					};
					
				};
				
				foreach ($rounds[$r]['overall']['contestants'][$iuc]['scores'] as $irocs => $rocs) {				
				
					if ($rocs['type'] == "total") continue;					
				
					if ($rounds[$r]['overall']['contestants'][$iroc]['scores'][$irocs]['type'] == "percentage") {
						
						if ($rocs['id'] == $round_portion['portion_id']) $rounds[$r]['overall']['contestants'][$iuc]['scores'][$irocs]['score'] = $uc['average']*$round_portion_percentage;					
						
					};				
					
				};				
				
			};
			
		};

		$round_portions_rank = [];	
		
		# average || percentage
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {

			$adj_round = $con->getData("SELECT points FROM scores_adjustments_rounds WHERE round_id = ".$round['id']." AND contestant_id = ".$roc['contestant_id']);
		
			if ($round_method == "Average") {
				
				$round_total = ($roc['portions_total_average']/$round_portions_total)+((count($adj_round))?$adj_round[0]['points']:0);
				$round_total = round($round_total,2,PHP_ROUND_HALF_UP);
				$rounds[$r]['overall']['contestants'][$iroc]['round_total'] = $round_total;
			
			} else {
				
				$round_total = $roc['portions_percentage_from_average']+((count($adj_round))?$adj_round[0]['points']:0);
				$round_total = round($round_total,2,PHP_ROUND_HALF_UP);
				$rounds[$r]['overall']['contestants'][$iroc]['round_total'] = $round_total;
			
			};
			
			$round_portions_rank[] = $rounds[$r]['overall']['contestants'][$iroc]['round_total'];
			$rounds[$r]['overall']['contestants'][$iroc]['adj'] = (count($adj_round))?$adj_round[0]['points']:0;
		
		};
		#

		if ($round_rank_order) array_multisort($round_portions_rank, SORT_ASC, $rounds[$r]['overall']['contestants']);		
		else array_multisort($round_portions_rank, SORT_DESC, $rounds[$r]['overall']['contestants']);		
		
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {
			
			$rounds[$r]['overall']['contestants'][$iroc]['rank'] = $iroc+1;
			
		};
		
		# check for ties
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {

			$rounds[$r]['overall']['contestants'][$iroc]['tied'] = checkForRoundTies($rounds[$r]['overall']['contestants'],$roc);

		};
		
		# compute ties
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {
			
			$ties = $roc['tied']['ties'];
			
			$add_ranks = 0;
			foreach ($ties as $t) {
				$add_ranks += $t;
			};
			$no_ties = (count($ties))?count($ties):1;
			$rank = $add_ranks/$no_ties;
			
			$rounds[$r]['overall']['contestants'][$iroc]['rank'] = $rank;
			
		};
		#
		
		$rounds[$r]['portions'] = $round_portions;
		
	};
	#

};

function checkForPortionTies($contestants,$contestant_overall) {

	$tied = false;
	$ties = [];	
	$remarks = "";
	
	foreach($contestants as $contestant) {
		
		if ((string)$contestant['average'] === (string)$contestant_overall['average']) {
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
	
function checkForRoundTies($contestants,$contestant_overall) {
	
	$tied = false;
	$ties = [];		
	$remarks = "";
	
	foreach($contestants as $contestant) {
		
		if ((string)$contestant['round_total'] === (string)$contestant_overall['round_total']) {
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

function portionRound($portions,$round_portion) {
	
	$ranked = [];
	$unranked = [];
	
	$contestant_nos = [];
	
	foreach ($portions as $portion) {
		
		if ($round_portion['portion_id'] === $portion['id']) {

			foreach ($portion['overall']['contestants'] as $poc) {
				
				$contestant_nos[] = $poc['contestant_no'];
				
			};

			$unranked = $portion['overall']['contestants'];
			$ranked = $portion['overall']['contestants'];

			array_multisort($contestant_nos, SORT_ASC, $unranked);

		};
		
	};
	
	return array("ranked"=>$ranked,"unranked"=>$unranked);

};

function sortByNo($contestants) {
	
	$contestant_nos = [];
	
	foreach ($contestants as $contestant) {
		
		$contestant_nos[] = $contestant['contestant_no'];
		
	};
	
	return $contestant_nos;
	
};

// header("Content-type: application/json");
echo json_encode(array("portions"=>$portions,"rounds"=>$rounds));

?>