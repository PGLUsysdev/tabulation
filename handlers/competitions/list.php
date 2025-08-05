<?php

require_once '../../db.php';

$con = new pdo_db("competitions");

require_once '../active-event.php';

$competitions = [];

if (count($active_event)) $competitions = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = competitions.event_id) event_id","description","winners","is_shown"]);

foreach ($competitions as $i => $competition) {
	
	$rounds = $con->getData("SELECT id, (SELECT rounds.description FROM rounds WHERE rounds.id = competition_rounds.round_id) round_description, percentage FROM competition_rounds WHERE c_id = ".$competition['id']);
	
	$competitions[$i]['rounds'] = "<ul>";
	
	foreach ($rounds as $round) {
	
		$competitions[$i]['rounds'] .= "<li>".$round['round_description']." (".$round['percentage']."%)</li>";
		
	};
	
	$competitions[$i]['rounds'] .= "</ul>";
	
}

echo json_encode($competitions);

?>