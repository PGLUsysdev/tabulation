<?php

session_start();

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../criterion-portion.php';

$con = new pdo_db("scores");

$portion = $con->getData("SELECT use_base_score, base_score FROM portions WHERE id = $_POST[portion_id]");

$criteria = $con->getData("SELECT id, description, percentage, minimum FROM criteria WHERE portion_id = $_POST[portion_id]");

foreach ($criteria as $i => $criterion) {
	
	$check = $con->getData("SELECT * FROM scores WHERE judge_id = $_SESSION[id] AND portion_contestant_id = $_POST[portion_contestant_id] AND score_criterion = $criterion[id]");

	if (count($check)==0) {

		$score = array(
			"judge_id"=>$_SESSION['id'],
			"portion_contestant_id"=>$_POST['portion_contestant_id'],
			"score_criterion"=>$criterion['id'],
			"score"=>0,
			"date_created"=>"CURRENT_TIMESTAMP"
		);

		$insert_score = $con->insertData($score);
		
	};

};

$sql = "SELECT scores.id, scores.score_criterion, (SELECT criteria.description FROM criteria WHERE criteria.id = scores.score_criterion) description, scores.score, (SELECT criteria.percentage FROM criteria WHERE criteria.id = scores.score_criterion) percentage, (SELECT criteria.minimum FROM criteria WHERE criteria.id = scores.score_criterion) minimum, false invalid, '' error_message, (SELECT criteria.extract_portion FROM criteria WHERE criteria.id = scores.score_criterion) extract_portion FROM scores WHERE scores.judge_id = $_SESSION[id] AND scores.portion_contestant_id = $_POST[portion_contestant_id]";
$scores = $con->getData($sql);

foreach ($scores as $i => $s) {

	$scores[$i]['invalid'] = false;
	
	$use_base_score = $portion[0]['use_base_score'];
	$base_score = $portion[0]['base_score'];
	$percentage = $s['percentage'];
	$minimum = $percentage*($base_score/100);	
	
	$scores[$i]['valid'] = ($scores[$i]['score']==0)?false:true;
	if ($scores[$i]['score']==0) {
		$scores[$i]['score'] = ($use_base_score)?$minimum:0;
	};

	if ($use_base_score) $scores[$i]['minimum'] = $minimum;
	
	// check if has extract_portion
	$has_extract_portion = ($s['extract_portion']!=null)?true:false;

	if ($has_extract_portion) {
		$portion_score = criterion_portion($con,$s['extract_portion'],$_POST['portion_contestant_id']);
		$percentage_portion_score = $portion_score*($percentage/100);
		
		$percentage_portion_score = round($percentage_portion_score,2);
		
		$scores[$i]['score'] = $percentage_portion_score;
		$scores[$i]['valid'] = true;
	};
	
	$scores[$i]['has_extract_portion'] = $has_extract_portion;
	
};

echo json_encode($scores);

?>