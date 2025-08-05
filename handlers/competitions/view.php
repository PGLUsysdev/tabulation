<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$competition = $con->getData("SELECT id, event_id, description, winners, remarks, is_shown FROM competitions WHERE id = $id");

if (count($competition)) {
	
	$competition = $competition[0];
	$competition['is_shown'] = ($competition['is_shown'])?true:false;
	
	$event = $con->getData("SELECT tabulation_events.id, tabulation_events.description, tabulation_events.venue, DATE_FORMAT(tabulation_events.event_date, '%b %e, %Y') event_date, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_chairman) event_chairman, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_tabulator) event_tabulator, is_active FROM tabulation_events WHERE id = ".$competition['event_id']);
	
	$competition['event_id'] = (count($event))?$event[0]:[];
	
	$competition['rounds'] = [];
	$competition['roundsDels'] = [];
	
	$competition_rounds = $con->getData("SELECT id, c_id, round_id, percentage FROM competition_rounds WHERE c_id = ".$competition['id']);
	
	foreach ($competition_rounds as $i => $cr) {
		
		$round = $con->getData("SELECT id, description FROM rounds WHERE id = ".$cr['round_id']);	
		
		$competition_rounds[$i]['round_id'] = $round[0];		
		
		$competition_rounds[$i]['disabled'] = true;
		
	};
	
	$competition['rounds'] = $competition_rounds;
	
	$competition['places'] = [];
	$competition['placesDels'] = [];
	
	$places = $con->getData("SELECT id, c_id, rank, description FROM competition_places WHERE c_id = ".$competition['id']);
	
	foreach ($places as $i => $place) {
		
		$places[$i]['disabled'] = true; 
		
	};
	
	$competition['places'] = $places;
	
	
};

echo json_encode($competition);

?>