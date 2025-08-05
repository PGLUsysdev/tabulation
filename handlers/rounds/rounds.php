<?php

require_once '../../db.php';

$con = new pdo_db("rounds");

require_once '../active-event.php';

$rounds = [];

if (count($active_event)) $rounds = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = rounds.event_id) event_id","description","winners","method","remarks","rank_order","is_shown"]);

echo json_encode($rounds);

?>