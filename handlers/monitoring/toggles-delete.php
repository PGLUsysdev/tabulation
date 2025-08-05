<?php

require_once '../../db.php';

$con = new pdo_db("portions_toggles");

require_once '../active-event.php';

$delete_toggles = array(
	"event_id"=>$active_event['id']
);

$con->deleteData($delete_toggles);

?>