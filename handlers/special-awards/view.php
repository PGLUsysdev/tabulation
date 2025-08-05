<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$special_award = $con->getData("SELECT id, event_id, description, winners, remarks, is_shown FROM special_awards WHERE id = $id");

if (count($special_award)) {
	
	$special_award = $special_award[0];
	$special_award['is_shown'] = ($special_award['is_shown'])?true:false;
	
	$event = $con->getData("SELECT tabulation_events.id, tabulation_events.description, tabulation_events.venue, DATE_FORMAT(tabulation_events.event_date, '%b %e, %Y') event_date, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_chairman) event_chairman, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_tabulator) event_tabulator, is_active FROM tabulation_events WHERE id = ".$special_award['event_id']);
	
	$special_award['event_id'] = (count($event))?$event[0]:[];
	
	$special_award['criteria'] = [];
	$special_award['criteriaDels'] = [];
	
	$criteria = $con->getData("SELECT id, sac_id, portion_id, criteria_id, percentage FROM special_award_criteria WHERE sac_id = ".$special_award['id']);
	
	foreach ($criteria as $i => $criterion) {
		
		$portion = $con->getData("SELECT id, description FROM portions WHERE id = ".$criterion['portion_id']);
		
		$portion_criteria = $con->getData("SELECT id, description FROM criteria WHERE portion_id = ".$criterion['portion_id']);
		$portion[0]['criteria'] = $portion_criteria;
		
		$criteria[$i]['portion_id'] = $portion[0];
		
		$_criterion = $con->getData("SELECT id, description FROM criteria WHERE id = ".$criterion['criteria_id']);
		$criteria[$i]['criteria_id'] = (count($_criterion))?$_criterion[0]:array("id"=>"","description"=>"");
		
		$criteria[$i]['disabled'] = true;
		
	};
	
	$special_award['criteria'] = $criteria;
	
	$special_award['places'] = [];
	$special_award['placesDels'] = [];
	
	$places = $con->getData("SELECT id, sac_id, rank, description FROM special_award_places WHERE sac_id = ".$special_award['id']);
	
	foreach ($places as $i => $place) {
		
		$places[$i]['disabled'] = true; 
		
	};
	
	$special_award['places'] = $places;
	
	
};

echo json_encode($special_award);

?>