<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

session_start();

$judge_id = $_SESSION['id'];
$portion_id = $_POST['portion_id'];

$criteria = $con->getData("SELECT id, description, percentage, minimum, extract_portion FROM criteria WHERE portion_id = $portion_id ORDER BY id");

$contestants_wo_scores = [];

$for_result = "true";
foreach ($_POST['contestants'] as $contestant) {

	$verify = [];
	$completed = count($criteria);
	
	foreach ($criteria as $criterion) {
		
		$has_extract_portion = ($criterion['extract_portion']==null)?false:true;
		
		$sql = "SELECT * FROM scores WHERE portion_contestant_id = ".$contestant['id']." AND judge_id = $judge_id AND score_criterion = ".$criterion['id'];
		$score = $con->getData($sql);

		$criterion_score = (count($score))?$score[0]['score']:0;

		if ($has_extract_portion) {
			
			$verify[] = "true";
			$completed--;
			continue;
			
		};

		if ($criterion_score == 0) {
			$verify[] = "false";
		} else {
			$verify[] = "true";
			$completed--;
		};

	};
	
	$eval = implode("&&",$verify);
	if ($eval == "") $eval = "false";
	$score_ok = eval("return $eval;");
	
	if ($score_ok) $for_result.="&&true";
	else $for_result.="&&false";

	$wo_score = array(
		"id"=>$contestant['id'],
		"score_ok"=>$score_ok,
		"completed"=>$completed
	);

	$contestants_wo_scores[] = $wo_score;
	
};

$result = eval("return $for_result;");

echo json_encode(array("tables"=>$contestants_wo_scores,"result"=>$result));

?>