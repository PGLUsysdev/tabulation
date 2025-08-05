<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

require_once '../active-event.php';

$contestant_id = $_POST['id'];

$dir = "../../pictures/".$active_event['id']."/$contestant_id/";

$dels = $_POST['dels'];

foreach ($dels as $d) {
	
	if (file_exists($dir.$d)) unlink($dir.$d);
	
};

?>