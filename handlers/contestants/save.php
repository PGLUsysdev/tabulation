<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../folder-files.php';

$con = new pdo_db("contestants");

require_once '../active-event.php';

$_POST['event_id'] = $_POST['event_id']['id'];
if (isset($_POST['is_active'])) $_POST['is_active'] = ($_POST['is_active'])?1:0;

unset($_POST['pictures']);

if ($_POST['id']) {

	if (isset($_POST['date_created'])) unset($_POST['date_created']);
	if (isset($_POST['last_modified'])) $_POST['last_modified'] = "CURRENT_TIMESTAMP";
	$update = $con->updateData($_POST,'id');
	
	$id = $_POST['id'];

} else {

	unset($_POST['id']);
	$_POST['date_created'] = "CURRENT_TIMESTAMP";

	$insert = $con->insertData($_POST);
	$id = $con->insertId;

	# create directory
	$dir = "../../pictures";
	$path = "$dir/$active_event[id]";
	if (!folder_exist($path)) mkdir($path);
	$path_picture = "$path/$id";
	if (!folder_exist($path_picture)) mkdir($path_picture);

}

echo $id;

?>