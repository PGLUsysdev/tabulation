<?php

require_once '../../db.php';

$con = new pdo_db("portions");

require_once '../active-event.php';

$portions = [];

if (count($active_event)) $_portions = $con->get(array("event_id"=>$active_event['id']),["id","description"]);

$portions[] = array(
	"id"=>0,
	"description"=>""
);

foreach ($_portions as $i => $portion) {
	
	$portions[] = $portion;
	
};

echo json_encode($portions);

?>