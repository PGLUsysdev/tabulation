<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("competitions");

$competition = $_POST;
$rounds = $_POST['rounds'];
$roundsDels = $_POST['roundsDels'];
$contestants = $_POST['contestants'];
$places = $_POST['places'];
$placesDels = $_POST['placesDels'];

unset($competition['rounds']);
unset($competition['roundsDels']);
unset($competition['contestants']);
unset($competition['places']);
unset($competition['placesDels']);

$competition['event_id'] = $competition['event_id']['id'];
if (isset($competition['is_shown'])) $competition['is_shown'] = ($competition['is_shown'])?1:0;

# competition
if ($competition['id']) {
	
	if (isset($competition['date_created'])) unset($competition['date_created']);
	if (isset($competition['last_modified'])) unset($competition['last_modified']);
	$update = $con->updateData($competition,'id');
	$competition_id = $competition['id'];	
	
} else {

	unset($competition['id']);
	$competition['date_created'] = "CURRENT_TIMESTAMP";

	$insert = $con->insertData($competition);
	$competition_id = $con->insertId;

};

# delete competition_rounds
if (count($roundsDels)) {
	
	$con->table = "competition_rounds";	
	
	$deleteRound = array("id"=>implode(",",$roundsDels));

	$con->deleteData($deleteRound);	
	
};

# competition_rounds
if (count($rounds)) {
	
	$con->table = "competition_rounds";
	
	foreach ($rounds as $i => $round) {	
		
		$round['round_id'] = $round['round_id']['id'];
		
		if ($round['id']) { # update

			unset($round['disabled']);
			unset($round['c_id']);
			if (isset($round['date_created'])) unset($round['date_created']);
			if (isset($round['last_modified'])) unset($round['last_modified']);
			$updateRound = $con->updateData($round,'id');		
			
		} else { # insert
			unset($round['id']);
			unset($round['disabled']);
			$round['c_id'] = $competition_id;
			$round['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($round['last_modified'])) unset($round['last_modified']);		
			$insertRound = $con->insertData($round);
		};

	};
	
};

# competition_contestants
if (count($contestants)) {
	
	$con->table = "competition_contestants";	
	
	foreach ($contestants as $contestant) {

		$check = $con->getData("SELECT * FROM competition_contestants WHERE c_id = $competition_id AND contestant_id = ".$contestant['id']);

		$is_participant = $contestant['participant'];

		if ($is_participant) {

			if (count($check)==0) {

				$participant_contestant = array(
					"c_id"=>$competition_id,
					"contestant_id"=>$contestant['id'],
					"date_created"=>"CURRENT_TIMESTAMP"
				);

				$insert_participant_contestant = $con->insertData($participant_contestant);

			};
			
		} else {
			
			if (count($check)) $delete_participant_contestant = $con->query("DELETE FROM competition_contestants WHERE c_id = $competition_id AND contestant_id = ".$contestant['id']);
			
		};

	};
	
};

# delete competition_places
if (count($placesDels)) {

	$con->table = "competition_places";	

	$deletePlaces = array("id"=>implode(",",$placesDels));

	$con->deleteData($deletePlaces);

};

# competition_places
if (count($places)) {
	
	$con->table = "competition_places";
	
	foreach ($places as $i => $place) {
		
		if ($place['id']) { # update

			unset($place['disabled']);
			unset($place['c_id']);
			if (isset($place['date_created'])) unset($place['date_created']);
			if (isset($place['last_modified'])) unset($place['last_modified']);
			$updatePlace = $con->updateData($place,'id');	
			
		} else { # insert
			
			unset($place['id']);
			unset($place['disabled']);
			$place['c_id'] = $competition_id;
			$place['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($criterion['last_modified'])) unset($place['last_modified']);		
			$insertPlace = $con->insertData($place);		
			
		};
		
	};
	
};

echo $competition_id;

?>