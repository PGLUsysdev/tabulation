<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$report = $con->getData("SELECT id, description, contestant_no, contestant, score FROM individual_results WHERE id = $id");

echo json_encode($report[0]);

?>