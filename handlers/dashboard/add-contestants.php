<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator"]);
$active_event = $event[0]['id'];

$users = $con->getData("SELECT users.id FROM users WHERE users.tabulation_event = $active_event AND users.id IN (SELECT portions_judges.judge_id FROM portions_judges WHERE portions_judges.portion_id = ".$_POST['portion_id'].")");

$portions_contestants = [];
$notifications = [];

$con->table="portions_contestants";

foreach ($_POST['contestants'] as $key => $contestant) {

	if (!$contestant['participant']) {
		$pc = $con->getData("SELECT * FROM portions_contestants WHERE contestant_id = $contestant[id] AND portion_id = $_POST[portion_id]");
		if (count($pc)) {
			$delete = $con->deleteData(array("id"=>$pc[0]['id']));
		};
		continue;
	};

	$pc = $con->getData("SELECT * FROM portions_contestants WHERE contestant_id = $contestant[id] AND portion_id = $_POST[portion_id]");
	if (count($pc)) continue;
	
	$portions_contestants[] = array(
		"portion_id"=>$_POST['portion_id'],
		"contestant_id"=>$contestant['id'],
		"date_created"=>"CURRENT_TIMESTAMP"
	);
	
};

if (count($portions_contestants)) {
	
	$con->insertDataMulti($portions_contestants);

	/* # portion info
	$portion_info = $con->getData("SELECT description FROM portions WHERE id = $_POST[portion_id]");

	# notification
	foreach ($users as $user) {
		$notifications[] = array(
			"event_id"=>$active_event,
			"user_id"=>$user['id'],
			"icon"=>"fa-users",
			"message"=>"<strong>".$portion_info[0]['description']."</strong> is now ready for scoring.<hr>Please click refresh icon to update.<hr>Click this notification to dismiss",
			"date_created"=>"CURRENT_TIMESTAMP"
		);
	};
	
	$con->table = "notifications";	
	$notify = $con->insertDataMulti($notifications); */
	
};

?>