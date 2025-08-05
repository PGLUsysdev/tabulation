<?php

require_once '../../db.php';

$con = new pdo_db("individual_results");

require_once '../active-event.php';

$results = [];

if (count($active_event)) $results = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = individual_results.event_id) tabulation_event","round_id","portion_id","award_id","competition_id","description","contestant_no","contestant","score","last_modified"]);

foreach ($results as $i => $result) {

	$remarks = "Manual Entry";
	
	if ($result['round_id']!=null) {
		
		$round = $con->getData("SELECT description FROM rounds WHERE id = ".$result['round_id']);
		
		$remarks = (count($round))?$round[0]['description']:"";
		
	};
	
	if ($result['portion_id']!=null) {

		$portion = $con->getData("SELECT description FROM portions WHERE id = ".$result['portion_id']);
		
		$remarks = (count($portion))?$portion[0]['description']:"";	

	};
	
	if ($result['award_id']!=null) {

		$award = $con->getData("SELECT description FROM special_awards WHERE id = ".$result['award_id']);
		
		$remarks = (count($award))?$award[0]['description']:"";	

	};
	
	if ($result['competition_id']!=null) {

		$competition = $con->getData("SELECT description FROM competitions WHERE id = ".$result['competition_id']);
		
		$remarks = (count($competition))?$competition[0]['description']:"";	

	};	
	
	$results[$i]['remarks'] = $remarks;
	$results[$i]['last_modified'] = date("M j, Y",strtotime($result['last_modified']));
	
	$results[$i]['event_tabulator'] = $active_event['event_tabulator'];
	$results[$i]['event_chairman'] = $active_event['event_chairman'];
	
}

echo json_encode($results);

?>