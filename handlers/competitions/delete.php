<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("competitions");

$delete_competition = array("id"=>$_POST['id']);

$con->deleteData($delete_competition);

?>