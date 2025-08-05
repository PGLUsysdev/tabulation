<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("scores_adjustments_special_awards");

foreach ($_POST as $adj) {
	
	$check = $con->get(array("sac_id"=>$adj['sac_id'],"portion_contestant_id"=>$adj['portion_contestant_id']));

	if ((isset($adj['id']))&&($adj['id'])) {

		$data = array("id"=>$adj['id'],"points"=>$adj['adj'],"last_modified"=>"CURRENT_TIMESTAMP");
		$update = $con->updateData($data,'id');
	
	} else {

		$data = array(
			"sac_id"=>$adj['sac_id'],
			"portion_contestant_id"=>$adj['portion_contestant_id'],
			"points"=>$adj['adj'],
			"date_created"=>"CURRENT_TIMESTAMP"
		);

		if (count($check)==0) $insert = $con->insertData($data);

	};
	
};

?>