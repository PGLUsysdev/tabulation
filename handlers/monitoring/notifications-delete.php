<?php

require_once '../../db.php';

$con = new pdo_db("notifications");

require_once '../active-event.php';

$delete_notifications = array(
	"event_id"=>$active_event['id']
);

$con->deleteData($delete_notifications);

?>