<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments_competitions");

$ids = "";

foreach ($_POST as $i => $contestant) {
	
	if ($i == (count($_POST)-1)) $ids .= $contestant['id'];
	else $ids .= $contestant['id'].",";
	
};

$scores_adjustments_competitions = array("id"=>$ids);

$delete = $con->deleteData($scores_adjustments_competitions);

?>