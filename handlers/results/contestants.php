<?php

require_once '../../db.php';

$con = new pdo_db();

require_once '../active-event.php';

if (count($active_event)) {
	
	$contestants = $con->getData("SELECT contestant_no, CONCAT(description, ' (', contestant_name, ')') description FROM contestants WHERE event_id = ".$active_event['id']);
	
};

echo json_encode($contestants);

?>