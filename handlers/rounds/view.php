<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("rounds");

$round = $con->get(array("id"=>$_POST['id']),["*", "IF(is_shown=1,'true','false') is_shown", "IF(rank_order=1,'true','false') rank_order"]);

$wu = array("id"=>0,"full_name"=>"");

if ($round[0]['event_tabulator']!=null) {

	$tabulator = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) full_name FROM users WHERE id = ".$round[0]['event_tabulator']);
	$round[0]['event_tabulator'] = (count($tabulator))?$tabulator[0]:$wu;

} else {
	
	$round[0]['event_tabulator'] = $wu;
	
}

if ($round[0]['event_chairman']!=null) {

	$chairman = $con->getData("SELECT id, CONCAT(first_name, ' ', last_name) full_name FROM users WHERE id = ".$round[0]['event_chairman']);
	$round[0]['event_chairman'] = (count($chairman))?$chairman[0]:$wu;

} else {
	
	$round[0]['event_chairman'] = $wu;	
	
}

$con->table = "tabulation_events";
$event = $con->get(array("id"=>($round[0]['event_id']==null)?0:$round[0]['event_id']),["id","description","venue","DATE_FORMAT(event_date, '%b %e, %Y') event_date","is_active"]);

$con->table = "rounds_portions";
$portions = $con->get(array("round_id"=>$round[0]['id']),["*","'true' disabled"]);

if (count($portions)) {
	$con->table = "portions";
	foreach ($portions as $key => $portion) {
		
		$portion_id = $con->get(array("id"=>$portion['portion_id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = portions.event_id) event_id","description","winners","is_shown"]);	
		$portions[$key]['portion_id'] = $portion_id[0];
		
	};
};

$con->table = "rounds_places";
$places = $con->get(array("round_id"=>$round[0]['id']),["*","'true' disabled"]);

$round[0]['event_id'] = $event[0];
$round[0]['portions'] = $portions;
$round[0]['portionsDels'] = [];
$round[0]['places'] = $places;
$round[0]['placesDels'] = [];

echo json_encode($round[0]);

?>