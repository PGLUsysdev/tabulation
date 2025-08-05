<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("rounds");

$round = $_POST;
$portions = $_POST['portions'];
$portionsDels = $_POST['portionsDels'];
$places = $_POST['places'];
$placesDels = $_POST['placesDels'];
unset($round['portions']);
unset($round['portionsDels']);
unset($round['places']);
unset($round['placesDels']);

$round['event_id'] = $round['event_id']['id'];
if (isset($round['is_shown'])) $round['is_shown'] = ($round['is_shown'])?1:0;

if (isset($round['event_tabulator'])) {
	
	if ($round['event_tabulator']['id'] == 0) {
		$round['event_tabulator'] = null;
	} else {
		$round['event_tabulator'] = $round['event_tabulator']['id'];
	};

};

if (isset($round['event_chairman'])) {
	
	if ($round['event_chairman']['id'] == 0) {
		$round['event_chairman'] = null;
	} else {
		$round['event_chairman'] = $round['event_chairman']['id'];
	};

};

# round
if ($round['id']) {
	
	$round['rank_order'] = ($round['rank_order'])?1:0;
	
	if (isset($round['date_created'])) unset($round['date_created']);
	if (isset($round['last_modified'])) unset($round['last_modified']);
	$update = $con->updateData($round,'id');
	$round_id = $round['id'];	
	
} else {
	
	$round['rank_order'] = ($round['rank_order'])?1:0;	

	unset($round['id']);
	$round['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($round);
	$round_id = $con->insertId;
	
}

# delete rounds_portions
if (count($portionsDels)) {
	
	$con->table = "rounds_portions";	
	
	$deletePortions = array("id"=>implode(",",$portionsDels));

	$con->deleteData($deletePortions);	
	
};

# rounds_portions
if (count($portions)) {
	
	$con->table = "rounds_portions";
	
	foreach ($portions as $i => $portion) {
		
		$portion['portion_id'] = $portion['portion_id']['id'];
		
		if ($portion['id']) { # update

			unset($portion['disabled']);
			unset($portion['round_id']);
			if (isset($portion['date_created'])) unset($portion['date_created']);
			if (isset($portion['last_modified'])) unset($portion['last_modified']);
			$updatePortion = $con->updateData($portion,'id');		
			
		} else { # insert
			
			unset($portion['id']);
			unset($portion['disabled']);
			$portion['round_id'] = $round_id;
			$portion['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($portion['last_modified'])) unset($portion['last_modified']);		
			$insertPortion = $con->insertData($portion);		
			
		};

	};
	
};


# delete places
if (count($placesDels)) {

	$con->table = "rounds_places";	

	$deletePlaces = array("id"=>implode(",",$placesDels));

	$con->deleteData($deletePlaces);

};

# places
if (count($places)) {
	
	$con->table = "rounds_places";
	
	foreach ($places as $i => $place) {
		
		if ($place['id']) { # update

			unset($place['disabled']);
			unset($place['round_id']);
			if (isset($place['date_created'])) unset($place['date_created']);
			if (isset($place['last_modified'])) unset($place['last_modified']);
			$updatePlace = $con->updateData($place,'id');	
			
		} else { # insert
			
			unset($place['id']);
			unset($place['disabled']);
			$place['round_id'] = $round_id;
			$place['date_created'] = "CURRENT_TIMESTAMP";
			if (isset($criterion['last_modified'])) unset($place['last_modified']);		
			$insertPlace = $con->insertData($place);		
			
		};
		
	};
	
};

?>