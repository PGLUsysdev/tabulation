<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions");

$portion = $con->get(array("id"=>$_POST['id']),["*", "IF(is_shown=1,'true','false') is_shown", "IF(rank_order=1,'true','false') rank_order", "IF(use_base_score=1,'true','false') use_base_score", "IF(score_by_rate=1,'true','false') score_by_rate", "event_tabulator", "event_chairman"]);

$wu = array("id"=>0,"full_name"=>"");

if ($portion[0]['event_tabulator']!=null) {

	$tabulator = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) full_name FROM users WHERE id = ".$portion[0]['event_tabulator']);
	$portion[0]['event_tabulator'] = (count($tabulator))?$tabulator[0]:$wu;

} else {
	
	$portion[0]['event_tabulator'] = $wu;
	
}

if ($portion[0]['event_chairman']!=null) {

	$chairman = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) full_name FROM users WHERE id = ".$portion[0]['event_chairman']);
	$portion[0]['event_chairman'] = (count($chairman))?$chairman[0]:$wu;

} else {
	
	$portion[0]['event_chairman'] = $wu;	
	
}

$con->table = "tabulation_events";
$event = $con->get(array("id"=>($portion[0]['event_id']==null)?0:$portion[0]['event_id']),["id","description","venue","DATE_FORMAT(event_date, '%b %e, %Y') event_date","is_active"]);

$con->table = "criteria";
$criteria = $con->get(array("portion_id"=>$portion[0]['id']),["*","'true' disabled"]);

foreach ($criteria as $i => $criterion) {
	
	if ($criterion['extract_portion']==null) {
		
		$criteria[$i]['extract_portion'] = array("id"=>0,"description"=>"");
		
	} else {
		
		$get_extract_portion = $con->getData("SELECT id, description FROM portions WHERE id = ".$criterion['extract_portion']);
		
		$extract_portion = $get_extract_portion[0];
		
		$criteria[$i]['extract_portion'] = $extract_portion;

	};

};

$con->table = "portions_places";
$places = $con->get(array("portion_id"=>$portion[0]['id']),["*","'true' disabled"]);

$portion[0]['event_id'] = $event[0];
$portion[0]['criteria'] = $criteria;
$portion[0]['criteriaDels'] = [];
$portion[0]['places'] = $places;
$portion[0]['placesDels'] = [];

echo json_encode($portion[0]);

?>