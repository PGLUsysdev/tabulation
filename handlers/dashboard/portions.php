<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id"]);

session_start();

$judge_id = $_SESSION['id'];

$portions = [];

if (count($event)) {
	
	$con->table = "portions";
	$sql = "SELECT id, description, toggle FROM portions WHERE event_id = ".$event[0]['id']." AND is_shown = 1";
	$_portions = $con->getData($sql);

	$con->table = "portions_contestants";
	foreach ($_portions as $key => $portion) {
		
		$ranked = false;
		
		if ($portion['toggle'] == 0) continue;						
						
		# check if judge is judge in this portion
		$q_portion_judge = $con->getData("SELECT * FROM portions_judges WHERE portion_id = ".$portion['id']." AND judge_id = ".$judge_id);
		if (count($q_portion_judge)==0) continue;
		
		$sql = "SELECT id, (SELECT contestants.contestant_no FROM contestants WHERE contestants.id = portions_contestants.contestant_id) contestant_no, (SELECT contestants.contestant_name FROM contestants WHERE contestants.id = portions_contestants.contestant_id) contestant_name, (SELECT description FROM contestants WHERE contestants.id = portions_contestants.contestant_id) description, portions_contestants.contestant_rank FROM portions_contestants WHERE portion_id = $portion[id] ORDER BY contestant_no";
		$portions_contestants = $con->getData($sql);
		
		foreach ($portions_contestants as $i => $pc) {
			
			// check if portion contestant has rank, only one contestant is needed to check for this
			if (!$ranked) if ($pc['contestant_rank']!=null) $ranked = true;
			
			if ( (isset($_POST['activeButtons'])) && (count($_POST['activeButtons'])) ) {
			
				if (isset($_POST['activeButtons'][$key])) {
					if ($i == $_POST['activeButtons'][$key]) $portions_contestants[$i]['selected'] = true;
					else $portions_contestants[$i]['selected'] = false;
				} else {
					$portions_contestants[$i]['selected'] = false;
				};
			
			} else {
				
				if ($i == 0) {
					$portions_contestants[$i]['selected'] = true;
				} else {
					$portions_contestants[$i]['selected'] = false;
				};				
				
			};
			
			$portions_contestants[$i]['score_ok'] = false;
			
		};
		
		if ($ranked) {
			
			$portions_contestants = sortByRank($portions_contestants);
			
		};
		
		$_portions[$key]['contestants'] = $portions_contestants;
		
		if (count($portions_contestants)) $portions[] = $_portions[$key];
		
	};
	
};



function sortByRank($portions_contestants) {
	
	$ranks = [];
	
	foreach ($portions_contestants as $pc) {
		
		$ranks[] = $pc['contestant_rank'];
		
	};
	
	array_multisort($ranks, SORT_ASC, $portions_contestants);

	return $portions_contestants;
	
};

echo json_encode($portions);

?>