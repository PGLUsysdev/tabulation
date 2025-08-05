<?php

session_start();

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions_judges_confirmation");

$portion_id = $_POST['portion_id'];

$check = $con->getData("SELECT * FROM portions_judges_confirmation WHERE judge_id = ".$_SESSION['id']." AND portion_id = ".$portion_id);

if (count($check)==0) {

	$confirm = array(
		"judge_id"=>$_SESSION['id'],
		"portion_id"=>$portion_id,
		"confirmation"=>1,
		"date_created"=>"CURRENT_TIMESTAMP"
	);

	$insert_confirmation = $con->insertData($confirm);

} else {
	
	$id = $check[0]['id'];
	
	$confirm = array(
		"id"=>$id,
		"confirmation"=>1,
		"last_modified"=>"CURRENT_TIMESTAMP"
	);	
	
	$update_confirmation = $con->updateData($confirm,'id');
	
};

?>