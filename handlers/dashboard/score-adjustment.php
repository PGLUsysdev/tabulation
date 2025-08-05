<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments");

$adj = $con->get(array("portion_contestant_id"=>$_POST['portion_contestant_id']),["id","points"]);

echo json_encode(count($adj)?$adj[0]:array("points"=>0));

?>