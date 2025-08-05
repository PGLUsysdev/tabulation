<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores");

foreach ($_POST as $score) {
	
	unset($score['score_criterion']);
	$update_score = $con->updateData(array("id"=>$score['id'],"score"=>$score['score']),'id');
	
};

echo json_encode(array(true));

?>