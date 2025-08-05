<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$portion_id = $_POST['id'];
$judges = $_POST['judges'];

$con = new pdo_db("portions_judges");

if (count($judges)) {	
	
	foreach ($judges as $i => $judge) {
		
		if ($judge['id'] == 0) { // new
			
			$judge['portion_id'] = $portion_id;
			
			if ($judge['status']) {
				
				unset($judge['judge_fullname']);
				unset($judge['gender']);
				unset($judge['status']);
				
				$judge['date_created'] = "CURRENT_TIMESTAMP";
				
				$new_judge = $con->insertData($judge);
				
			};
			
		} else {
			
			$portion_judge = $con->getData("SELECT * FROM portions_judges WHERE id = ".$judge['id']);
			
			if ($judge['status']) { // add
				
				unset($judge['judge_fullname']);
				unset($judge['gender']);
				unset($judge['status']);
				
				$judge['date_created'] = "CURRENT_TIMESTAMP";
				
				if (count($portion_judge)==0) $add_judge = $con->insertData($judge);				
				
			} else { // delete

				$delete_judge = $con->deleteData(array(
					"id"=>$judge['id']
				));

				// delete scores
				$delete_scores = $con->query("DELETE FROM scores WHERE scores.judge_id = ".$judge['judge_id']." AND scores.score_criterion IN (SELECT criteria.id FROM criteria WHERE criteria.portion_id = $portion_id)");

			};
			
		};
		
	};
	
};

?>