<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("individual_results");

require_once '../active-event.php';

$reports = $_POST['winners'];

if (isset($_POST['portion_id'])) {

	$portion_id = $_POST['portion_id'];
	$delete = $con->query("DELETE FROM individual_results WHERE portion_id = $portion_id");
	
};

if (isset($_POST['round_id'])) {

	$round_id = $_POST['round_id'];
	$delete = $con->query("DELETE FROM individual_results WHERE round_id = $round_id");
	
};

if (isset($_POST['award_id'])) {

	$award_id = $_POST['award_id'];
	$delete = $con->query("DELETE FROM individual_results WHERE award_id = $award_id");
	
};

if (isset($_POST['competition_id'])) {

	$competition_id = $_POST['competition_id'];
	$delete = $con->query("DELETE FROM individual_results WHERE competition_id = $competition_id");
	
};

foreach ($reports as $report) {

	$report['event_id'] = $active_event['id'];
	$report['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($report);
	
};

?>