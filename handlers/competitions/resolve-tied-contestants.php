<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments_competitions");

foreach ($_POST as $adj) {
	
	$check = $con->get(array("c_id"=>$adj['competition_id'],"contestant_id"=>$adj['contestant_id']));
	
	if ((isset($adj['id']))&&($adj['id'])) {

		$data = array(
			"id"=>$adj['id'],
			"points"=>$adj['adj'],
			"last_modified"=>"CURRENT_TIMESTAMP"
		);
		$update = $con->updateData($data,'id');
	
	} else {

		$data = array(
			"c_id"=>$adj['competition_id'],
			"contestant_id"=>$adj['contestant_id'],
			"points"=>$adj['adj'],
			"date_created"=>"CURRENT_TIMESTAMP"
		);
		
		if (count($check)==0) $insert = $con->insertData($data);
		
	};
	
};

?>