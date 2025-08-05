<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("individual_results");

$report = $_POST;

$report['event_id'] = $report['event_id']['id'];

if ($report['id']) {

	if (isset($report['last_modified'])) unset($report['last_modified']);
	$update = $con->updateData($report,'id');
	$id = $report['id'];	
	
} else {

	unset($report['id']);
	$report['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($report);
	$id = $con->insertId;
	
};

echo $id;

?>