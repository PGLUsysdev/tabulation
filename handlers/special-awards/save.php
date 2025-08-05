<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("special_awards");

$special_award = $_POST;
$criteria = $_POST['criteria'];
$criteriaDels = $_POST['criteriaDels'];
$contestants = $_POST['contestants'];
$places = $_POST['places'];
$placesDels = $_POST['placesDels'];

unset($special_award['criteria']);
unset($special_award['criteriaDels']);
unset($special_award['contestants']);
unset($special_award['places']);
unset($special_award['placesDels']);

$special_award['event_id'] = $special_award['event_id']['id'];
if (isset($special_award['is_shown'])) $special_award['is_shown'] = ($special_award['is_shown'])?1:0;

# special_award
if ($special_award['id']) {
	
	if (isset($special_award['date_created'])) unset($special_award['date_created']);
	if (isset($special_award['last_modified'])) unset($special_award['last_modified']);
	$update = $con->updateData($special_award,'id');
	$special_award_id = $special_award['id'];	
	
} else {

	unset($special_award['id']);
	$special_award['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($special_award);
	$special_award_id = $con->insertId;
	
}

# delete special_award_criteria
if (count($criteriaDels)) {
	
	$con->table = "special_award_criteria";	
	
	$deleteCriteria = array("id"=>implode(",",$criteriaDels));

	$con->deleteData($deleteCriteria);	
	
};

# special_award_criteria
if (count($criteria)) {
	
	$con->table = "special_award_criteria";
	
	foreach ($criteria as $i => $criterion) {	
		
		$criterion['portion_id'] = $criterion['portion_id']['id'];
		$criterion['criteria_id'] = $criterion['criteria_id']['id'];
		
		if ($criterion['id']) { # update

			unset($criterion['disabled']);
			unset($criterion['sac_id']);
			if (isset($criterion['date_created'])) unset($criterion['date_created']);
			if (isset($criterion['last_modified'])) unset($criterion['last_modified']);
			$updateCriterion = $con->updateData($criterion,'id');		
			
		} else { # insert
			
			unset($criterion['id']);
			unset($criterion['disabled']);
			$criterion['sac_id'] = $special_award_id;
			$criterion['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($criterion['last_modified'])) unset($criterion['last_modified']);		
			$insertCriterion = $con->insertData($criterion);		
			
		};

	};
	
};

# special_award_contestants
if (count($contestants)) {
	
	$con->table = "special_award_contestants";	
	
	foreach ($contestants as $contestant) {

		$check = $con->getData("SELECT * FROM special_award_contestants WHERE sac_id = $special_award_id AND contestant_id = ".$contestant['id']);

		$is_participant = $contestant['participant'];

		if ($is_participant) {

			if (count($check)==0) {

				$participant_contestant = array(
					"sac_id"=>$special_award_id,
					"contestant_id"=>$contestant['id'],
					"date_created"=>"CURRENT_TIMESTAMP"
				);

				$insert_participant_contestant = $con->insertData($participant_contestant);

			};
			
		} else {
			
			if (count($check)) $delete_participant_contestant = $con->query("DELETE FROM special_award_contestants WHERE sac_id = $special_award_id AND contestant_id = ".$contestant['id']);
			
		};

	};
	
};

# delete special_award_places
if (count($placesDels)) {

	$con->table = "special_award_places";	

	$deletePlaces = array("id"=>implode(",",$placesDels));

	$con->deleteData($deletePlaces);

};

# special_award_places
if (count($places)) {
	
	$con->table = "special_award_places";
	
	foreach ($places as $i => $place) {
		
		if ($place['id']) { # update

			unset($place['disabled']);
			unset($place['sac_id']);
			if (isset($place['date_created'])) unset($place['date_created']);
			if (isset($place['last_modified'])) unset($place['last_modified']);
			$updatePlace = $con->updateData($place,'id');	
			
		} else { # insert
			
			unset($place['id']);
			unset($place['disabled']);
			$place['sac_id'] = $special_award_id;
			$place['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($criterion['last_modified'])) unset($place['last_modified']);		
			$insertPlace = $con->insertData($place);		
			
		};
		
	};
	
};

echo $special_award_id;

?>