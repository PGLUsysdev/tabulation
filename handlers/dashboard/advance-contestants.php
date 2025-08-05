<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);
$active_event = $event[0]['id'];

$users = $con->getData("SELECT users.id FROM users WHERE users.tabulation_event = $active_event AND users.id IN (SELECT portions_judges.judge_id FROM portions_judges WHERE portions_judges.portion_id = ".$_POST['advance']['portion']['id'].")");

$portions_contestants = [];
$notifications = [];

$con->table="portions_contestants";

foreach ($_POST['advance']['contestants'] as $key => $contestant) {

	$pc = $con->getData("SELECT * FROM portions_contestants WHERE contestant_id = ".$contestant['contestant_id']." AND portion_id = ".$_POST['advance']['portion']['id']);
	if (count($pc)) continue;
	
	$portions_contestants[] = array(
		"portion_id"=>$_POST['advance']['portion']['id'],
		"contestant_id"=>$contestant['contestant_id'],
		"contestant_rank"=>$key+1,
		"date_created"=>"CURRENT_TIMESTAMP"
	);
	
};

if (count($portions_contestants)) {

	$con->insertDataMulti($portions_contestants);

	# notification
	/* foreach ($users as $user) {	
		$notifications[] = array(
			"event_id"=>$active_event,		
			"user_id"=>$user['id'],		
			"icon"=>"fa-users",
			"message"=>"<strong>".$_POST['advance']['winners']." contestant(s) have advanced to ".$_POST['advance']['description']."<hr>Please click refresh icon to update.<hr>Click this notification to dismiss",
			"date_created"=>"CURRENT_TIMESTAMP"
		);
	};

	$con->table = "notifications";	
	$notify = $con->insertDataMulti($notifications); */
	
};

?>