<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../folder-files.php';

$con = new pdo_db("tabulation_events");

$_POST['event_date'] = date("Y-m-d",strtotime($_POST['event_date']));
if (isset($_POST['is_active'])) $_POST['is_active'] = ($_POST['is_active'])?1:0;
$_POST['event_chairman'] = $_POST['event_chairman']['id'];
$_POST['event_tabulator'] = $_POST['event_tabulator']['id'];

if (isset($_POST['event_logo'])) unset($_POST['event_logo']);

if ($_POST['id']) {
	
	$id = $_POST['id'];
	
	$events = $con->getData("UPDATE tabulation_events SET is_active = 0");	
	
	if (isset($_POST['date_created'])) unset($_POST['date_created']);
	if (isset($_POST['last_modified'])) $_POST['last_modified'] = "CURRENT_TIMESTAMP";
	$update = $con->updateData($_POST,'id');
	
	# Update users event
	$users_event = $con->getData("UPDATE users SET tabulation_event = ".$_POST['id']);
	
} else {

	unset($_POST['id']);
	$_POST['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($_POST);
	$id = $con->insertId;

	# create directory
	$dir = "../../pictures";
	$path = "$dir/$id";
	if (!folder_exist($path)) mkdir($path);

}

echo $id;

?>