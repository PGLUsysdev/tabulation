<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("users");

$_POST['user_group'] = $_POST['user_group']['id'];
$_POST['tabulation_event'] = $_POST['tabulation_event']['id'];

$_POST['host_device'] = (isset($_POST['host_device'])&&($_POST['host_device']))?1:0;

if ($_POST['id']) {
	
	if (isset($_POST['date_created'])) unset($_POST['date_created']);
	if (isset($_POST['last_modified'])) unset($_POST['last_modified']);
	$update = $con->updateData($_POST,'id');
	
} else {

	unset($_POST['id']);
	$_POST['date_created'] = "CURRENT_TIMESTAMP";
	
	$insert = $con->insertData($_POST);
	
}

?>