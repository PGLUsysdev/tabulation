<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);

$portions = [];

$rounds = [];

if (count($event)) {
	
	$judges = [];
	
	$judges = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) fullname FROM users WHERE user_group = 2 AND tabulation_event = ".$event[0]['id']);	
	$no_of_judges = (count($judges))?count($judges):1;
	
	$sql = "SELECT portions.id, portions.description, portions.winners, '".$event[0]['description']."' tabulation_event, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_chairman'].") event_chairman, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_tabulator'].") event_tabulator FROM portions WHERE portions.event_id = ".$event[0]['id']." AND portions.is_shown = 1";
	$portions = $con->getData($sql);	
	
	foreach ($portions as $ip => $portion) { # per portion
		
		$portion_judges = $con->getData("SELECT users.id, CONCAT(users.first_name, ' ', users.last_name) fullname FROM portions_judges LEFT JOIN users ON portions_judges.judge_id = users.id WHERE users.user_group = 2 AND portions_judges.portion_id = ".$portion['id']." AND users.tabulation_event = ".$event[0]['id']);
		$portion_no_of_judges = (count($portion_judges))?count($portion_judges):1;
		
		$contestants = [];
		
		$contestants = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = $portion[id]");
		
		$table_header = [];
		$table_header_overall = [];
		$criteria = $con->getData("SELECT id, description, percentage FROM criteria WHERE portion_id = $portion[id] ORDER BY id");
		if (count($criteria)) {
			$table_header[] = array("th"=>"No");
			$table_header[] = array("th"=>"Contestant");
			foreach ($criteria as $i => $criterion) {
				$table_header[] = array("th"=>$criterion['description']." (".$criterion['percentage']."%)");
				$table_header_overall[] = array("id"=>$criterion['id'],"th"=>$criterion['description']." (".$criterion['percentage']."%)");
			};
			$table_header[] = array("th"=>"Total");		
		}
		
		# for Overall
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

				$scores = $con->getData("SELECT scores.id, scores.score_criterion, (CONCAT(criteria.description, ' (',criteria.percentage,'%)')) description, scores.score FROM scores LEFT JOIN criteria ON scores.score_criterion = criteria.id WHERE judge_id = $judge[id] AND portion_contestant_id = $contestant[id] ORDER BY scores.score_criterion"); # contestant scores

				$total_scores = 0;
				foreach ($scores as $score) {
					
					$total_scores += $score['score'];
					
					# for overall per criterion
					foreach ($contestants_all_judges[$ic]['scores'] as $iopc => $opc) {
						
						if ($score['score_criterion'] == $opc['id']) {
							
							$contestants_all_judges[$ic]['scores'][$iopc]['score'] += $score['score'];
							
						};
						
					};
					
				};
				$scores[] = array("id"=>0,"description"=>"Total","score"=>$total_scores);
				$rank_per_judge[] = $total_scores;
					
				$contestants_all_judges[$ic]['all_judges'] += $total_scores;
				
				$portions[$ip]['judges'][$ij]['contestants'][$ic]['scores'] = $scores;

			};
			
			# rank per judge			
			array_multisort($rank_per_judge, SORT_DESC, $portions[$ip]['judges'][$ij]['contestants']);			
			
		};
		
		# process average
		foreach ($contestants_all_judges as $icaj => $contestant_all_judge) {
			$adj = $con->getData("SELECT points FROM scores_adjustments WHERE portion_contestant_id = ".$contestant_all_judge['id']);
			// $average = ($contestant_all_judge['all_judges']/$no_of_judges)+((count($adj))?$adj[0]['points']:0);
			$average = ($contestant_all_judge['all_judges']/$portion_no_of_judges)+((count($adj))?$adj[0]['points']:0);
			$contestants_all_judges[$icaj]['average'] = $average;
			$contestants_all_judges[$icaj]['adj'] = (count($adj))?$adj[0]['points']:0;
			$rank_overall[] = $average;
		};
		#
		
		$portions[$ip]['overall'] = array(
			"contestants"=>$contestants_all_judges,
			"table_header"=>$table_header_overall,
		);

		# check for ties
		foreach ($portions[$ip]['overall']['contestants'] as $oc => $contestant_overall) {

			$portions[$ip]['overall']['contestants'][$oc]['tied'] = checkForPortionTies($portions[$ip]['overall']['contestants'],$contestant_overall);
		
		};

		# rank overall		
		array_multisort($rank_overall, SORT_DESC, $portions[$ip]['overall']['contestants']);
		#
		
	};
	
	# for rounds
	$sql = "SELECT rounds.id, rounds.description, '".$event[0]['description']."' tabulation_event, rounds.winners, rounds.method, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_chairman'].") event_chairman, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = ".$event[0]['event_tabulator'].") event_tabulator FROM rounds WHERE rounds.event_id = ".$event[0]['id']." AND rounds.is_shown = 1";
	$rounds = $con->getData($sql);		
	
	foreach ($rounds as $r => $round) {
		
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
		
		$contestants_round = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = $at_least_portion");
		
		/*
		** sort $contestants_round
		*/
		array_multisort(sortByNo($contestants_round), SORT_ASC, $contestants_round);		
		
		$rounds[$r]['overall'] = array("contestants"=>$contestants_round);		
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {
			
			$rounds[$r]['overall']['contestants'][$iroc]['portions_total_average'] = 0;
			$rounds[$r]['overall']['contestants'][$iroc]['portions_total_percentage'] = 0;
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
				$rounds[$r]['overall']['contestants'][$iuc]['portions_total_percentage'] += $uc['average']*$round_portion_percentage;
				
			};
			
		};

		$round_portions_rank = [];	
		
		# average || percentage
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {

			$adj_round = $con->getData("SELECT points FROM scores_adjustments_rounds WHERE round_id = ".$round['id']." AND contestant_id = ".$roc['contestant_id']);
		
			if ($round_method == "Average") {
				$rounds[$r]['overall']['contestants'][$iroc]['round_total'] = ($roc['portions_total_average']/$round_portions_total)+((count($adj_round))?$adj_round[0]['points']:0);
			} else {
				$rounds[$r]['overall']['contestants'][$iroc]['round_total'] = $roc['portions_total_percentage']+((count($adj_round))?$adj_round[0]['points']:0);
			};
			
			$round_portions_rank[] = $rounds[$r]['overall']['contestants'][$iroc]['round_total'];
			$rounds[$r]['overall']['contestants'][$iroc]['adj'] = (count($adj_round))?$adj_round[0]['points']:0;
		
		};
		#		

		# check for ties
		foreach ($rounds[$r]['overall']['contestants'] as $iroc => $roc) {

			$rounds[$r]['overall']['contestants'][$iroc]['tied'] = checkForRoundTies($rounds[$r]['overall']['contestants'],$roc);

		};

		array_multisort($round_portions_rank, SORT_DESC, $rounds[$r]['overall']['contestants']);		
		
		$rounds[$r]['portions'] = $round_portions;
		
	};
	#

};

function checkForPortionTies($contestants,$contestant_overall) {

	$tied = false;
	$remarks = "";
	
	foreach($contestants as $contestant) {
		
		if ((string)$contestant['average'] === (string)$contestant_overall['average']) {
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
	
function checkForRoundTies($contestants,$contestant_overall) {
	
	$tied = false;
	$remarks = "";
	
	foreach($contestants as $contestant) {
		
		if ((string)$contestant['round_total'] === (string)$contestant_overall['round_total']) {
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

header("Content-type: application/json");
echo json_encode(array("portions"=>$portions,"rounds"=>$rounds));

?>