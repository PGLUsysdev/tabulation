<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments_rounds");

$adj = $con->get(array("round_id"=>$_POST['round_id'],"contestant_id"=>$_POST['contestant_id']),["id","points"]);

echo json_encode(count($adj)?$adj[0]:array("id"=>0,"points"=>0));

?>