<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions");

$delete_scores = $con->query("DELETE FROM scores WHERE score_criterion IN (SELECT id FROM criteria WHERE portion_id = $_POST[id])");

$con->table = "portions";
$delete_portion = array("id"=>$_POST['id']);

$con->deleteData($delete_portion);

?>