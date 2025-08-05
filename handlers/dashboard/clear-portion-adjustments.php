<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments");

$ids = "";

foreach ($_POST as $i => $portion_contestant) {
	
	if ($i == (count($_POST)-1)) $ids .= $portion_contestant['id'];
	else $ids .= $portion_contestant['id'].",";
	
};

$scores_adjustments = array("id"=>$ids);

$delete = $con->deleteData($scores_adjustments);

?>