<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments_rounds");

$id = $_POST['id'];

$scores_adjustments_rounds = array("round_id"=>$id);

$delete = $con->deleteData($scores_adjustments_rounds);

?>