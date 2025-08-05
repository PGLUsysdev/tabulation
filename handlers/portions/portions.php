<?php

require_once '../../db.php';

$con = new pdo_db("portions");

require_once '../active-event.php';

$portions = [];

if (count($active_event)) $portions = $con->get(array("event_id"=>$active_event['id']),["id","(SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = portions.event_id) event_id","description","winners","remarks","use_base_score","base_score","rank_order","is_shown"]);

foreach ($portions as $i => $portion) {
	
	$portions[$i]['bs'] = ($portion['use_base_score'])?$portion['base_score']."%":"N/A";
	
	$portions[$i]['event_tabulator'] = $active_event['event_tabulator'];
	$portions[$i]['event_chairman'] = $active_event['event_chairman'];
	
	# criteria for header
	$table_header = [];
	$criteria = $con->getData("SELECT id, description, percentage FROM criteria WHERE portion_id = $portion[id] ORDER BY id");
	if (count($criteria)) {
		$table_header[] = "No";
		$table_header[] = "Contestant";
		foreach ($criteria as $ii => $criterion) {
			$table_header[] = $criterion['description']." (".$criterion['percentage']."%)";
		};
		$table_header[] = "Total";		
	}
	
	$portions[$i]['table_header'] = $table_header;
	
	# contestants
	$contestants = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = $portion[id]");	
	
	$rows = [];
	foreach ($contestants as $ii => $contestant) {
		$rows[$ii][] = $contestant['contestant_no'];
		$rows[$ii][] = $contestant['description']." (".$contestant['contestant_name'].")";
		foreach ($criteria as $criterion) {
			$rows[$ii][] = "";
		};
		$rows[$ii][] = "";
	};
	
	$portions[$i]['rows'] = $rows;
	
	$columnStyles[0] = array("cellWidth"=>25);
	$columnStyles[count($criteria)+2] = array("cellWidth"=>50);
	$styles = array(
		"margin"=> array("top"=>175,"left"=>25,"bottom"=>20),
		"tableWidth"=>886,
		"columnStyles"=> $columnStyles,				
		"styles"=> array(
			"lineColor"=>[75,75,75],
			"lineWidth"=>0.50,
			"cellPadding"=>5
		),
		"headStyles"=>array(
			"halign"=>"center",		
			"fillColor"=>[191,191,191],
			"textColor"=>50,
			"fontSize"=>10
		),
		"bodyStyles"=>array(
			"halign"=>"left",
			"fillColor"=>[255,255,255],
			"textColor"=>50,
			"fontSize"=>10,
			"cellPadding"=>8
		),
		"alternateRowStyles"=>array(
			"fillColor"=>[240,240,240]
		)
	);
	
	$portions[$i]['styles'] = $styles;

};

echo json_encode($portions);

?>