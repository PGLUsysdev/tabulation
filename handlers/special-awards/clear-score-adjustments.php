<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments_special_awards");

$special_award_id = $_POST['id'];

$scores_adjustments_special_awards = array("sac_id"=>$special_award_id);

$delete = $con->deleteData($scores_adjustments_special_awards);

?>