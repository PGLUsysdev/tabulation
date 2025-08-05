<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("individual_results");

$delete_result = array("id"=>$_POST['id']);

$con->deleteData($delete_result);

?>