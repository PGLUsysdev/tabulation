<?php

require_once '../../db.php';

$con = new pdo_db("special_awards");

require_once '../active-event.php';

$special_awards = [];

if (count($active_event)) $special_awards = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = special_awards.event_id) event_id","description","winners","is_shown"]);

foreach ($special_awards as $i => $special_award) {
	
	$criteria = $con->getData("SELECT id, (SELECT description FROM criteria WHERE criteria.id = special_award_criteria.criteria_id) criteria_description, (SELECT description FROM portions WHERE portions.id = special_award_criteria.portion_id) portion_description FROM special_award_criteria WHERE sac_id = ".$special_award['id']);
	
	$special_awards[$i]['criteria'] = "<ul>";
	
	foreach ($criteria as $criterion) {
	
		$special_awards[$i]['criteria'] .= "<li><strong>".$criterion['criteria_description']."</strong> (".$criterion['portion_description'].")</li>";
		
	};
	
	$special_awards[$i]['criteria'] .= "</ul>";
	
}

echo json_encode($special_awards);

?>