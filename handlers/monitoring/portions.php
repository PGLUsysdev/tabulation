<?php

require_once '../../db.php';

$con = new pdo_db("portions");

require_once '../active-event.php';

$portions = [];

if (count($active_event)) $portions = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = portions.event_id) event_id","description","is_shown","toggle"]);

foreach ($portions as $i => $portion) {

	$portion_contestants = $con->getData("SELECT * FROM portions_contestants WHERE portion_id = ".$portion['id']);
	$portions[$i]['no_of_contestants'] = count($portion_contestants);

	$portion_judges = $con->getData("SELECT * FROM portions_judges WHERE portion_id = ".$portion['id']);

	$portions[$i]['no_of_judges'] = count($portion_judges);

	$portions[$i]['is_shown'] = ($portion['is_shown'])?true:false;
	$portions[$i]['toggle'] = ($portion['toggle'])?true:false;

};

echo json_encode($portions);

?>