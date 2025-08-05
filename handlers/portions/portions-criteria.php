<?php

require_once '../../db.php';

$con = new pdo_db("portions");

require_once '../active-event.php';

$portions = [];

if (count($active_event)) $portions = $con->get(array("event_id"=>$active_event['id']),["id","description"]);

foreach ($portions as $i => $portion) {
	
	$criteria = $con->getData("SELECT id, description FROM criteria WHERE portion_id = ".$portion['id']);
	
	$portions[$i]['criteria'] = $criteria;
	
};

echo json_encode($portions);

?>