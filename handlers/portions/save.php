<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions");

$portion = $_POST;
$criteria = $_POST['criteria'];
$criteriaDels = $_POST['criteriaDels'];
$places = $_POST['places'];
$placesDels = $_POST['placesDels'];
$judges = $_POST['judges'];
unset($portion['criteria']);
unset($portion['criteriaDels']);
unset($portion['places']);
unset($portion['placesDels']);
unset($portion['judges']);

$portion['event_id'] = $portion['event_id']['id'];
if (isset($portion['is_shown'])) $portion['is_shown'] = ($portion['is_shown'])?1:0;
if (isset($portion['use_base_score'])) {
	
	if (!$portion['use_base_score']) $portion['base_score'] = 0;
	
	$portion['use_base_score'] = ($portion['use_base_score'])?1:0;
	
};
if (isset($portion['score_by_rate'])) $portion['score_by_rate'] = ($portion['score_by_rate'])?1:0;

if (isset($portion['rank_order'])) $portion['rank_order'] = ($portion['rank_order'])?1:0;

if (isset($portion['event_tabulator'])) {
	
	if ($portion['event_tabulator']['id'] == 0) {
		$portion['event_tabulator'] = null;
	} else {
		$portion['event_tabulator'] = $portion['event_tabulator']['id'];
	};

};

if (isset($portion['event_chairman'])) {
	
	if ($portion['event_chairman']['id'] == 0) {
		$portion['event_chairman'] = null;
	} else {
		$portion['event_chairman'] = $portion['event_chairman']['id'];
	};

};

# portion
if ($portion['id']) {
	
	if (isset($portion['date_created'])) unset($portion['date_created']);
	if (isset($portion['last_modified'])) unset($portion['last_modified']);
	$update = $con->updateData($portion,'id');
	$portion_id = $portion['id'];	
	
} else {

	unset($portion['id']);
	$portion['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($portion);
	$portion_id = $con->insertId;	
	
}

# delete criteria
if (count($criteriaDels)) {
	
	$con->table = "criteria";	
	
	$deleteCriteria = array("id"=>implode(",",$criteriaDels));

	$con->deleteData($deleteCriteria);	
	
};

# criteria
if (count($criteria)) {
	
	$con->table = "criteria";
	
	foreach ($criteria as $i => $criterion) {
		
		if (isset($criterion['extract_portion']['id'])) {
			
			if ($criterion['extract_portion']['id']==0) {
				$criterion['extract_portion'] = null;
			} else {
				$criterion['extract_portion'] = $criterion['extract_portion']['id'];
			};
			
		} else {
			
			$criterion['extract_portion'] = null;
			
		};
		
		if ($criterion['id']) { # update

			unset($criterion['disabled']);
			unset($criterion['portion_id']);
			if (isset($criterion['date_created'])) unset($criterion['date_created']);
			if (isset($criterion['last_modified'])) unset($criterion['last_modified']);
			$updateCriterion = $con->updateData($criterion,'id');		
			
		} else { # insert
			
			unset($criterion['id']);
			unset($criterion['disabled']);
			$criterion['portion_id'] = $portion_id;
			$criterion['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($criterion['last_modified'])) unset($criterion['last_modified']);		
			$insertCriterion = $con->insertData($criterion);		
			
		};
		
	};
	
};

# delete places
if (count($placesDels)) {
	
	$con->table = "portions_places";	
	
	$deletePlaces = array("id"=>implode(",",$placesDels));

	$con->deleteData($deletePlaces);
	
};

# places
if (count($places)) {
	
	$con->table = "portions_places";
	
	foreach ($places as $i => $place) {
		
		if ($place['id']) { # update

			unset($place['disabled']);
			unset($place['portion_id']);
			if (isset($place['date_created'])) unset($place['date_created']);
			if (isset($place['last_modified'])) unset($place['last_modified']);
			$updatePlace = $con->updateData($place,'id');	
			
		} else { # insert
			
			unset($place['id']);
			unset($place['disabled']);
			$place['portion_id'] = $portion_id;
			$place['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($criterion['last_modified'])) unset($place['last_modified']);		
			$insertPlace = $con->insertData($place);		
			
		};
		
	};
	
};

# judges
if (count($judges)) {
	
	$con->table = "portions_judges";	
	
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