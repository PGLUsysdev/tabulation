<?php

require_once '../../db.php';

$con = new pdo_db("rounds");

require_once '../active-event.php';

$rounds = [];

if (count($active_event)) $rounds = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = rounds.event_id) event_id","description","remarks","is_shown"]);

foreach ($rounds as $i => $round) {

	$rounds[$i]['is_shown'] = ($round['is_shown'])?true:false;

	$portions = $con->getData("SELECT portions.id, portions.description FROM portions WHERE id IN (SELECT rounds_portions.portion_id FROM rounds_portions WHERE rounds_portions.round_id = ".$round['id'].")");
	
	$rounds[$i]['portions'] = $portions;

};

echo json_encode($rounds);

?>