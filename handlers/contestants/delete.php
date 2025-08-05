<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../folder-files.php';

$con = new pdo_db("contestants");

require_once '../active-event.php';

$delete = array("id"=>$_POST['id']);

$con->deleteData($delete);

deleteFolderFiles($_POST['id']);

?>