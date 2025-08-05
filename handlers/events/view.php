<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(array("id"=>$_POST['id']),["*", "IF(is_active=1,'true','false') is_active"]);

$con->table = "users";
$event_chairman = $con->get(array("id"=>$event[0]['event_chairman']),["id","CONCAT(first_name, ' ', last_name) full_name"]);
$event_tabulator = $con->get(array("id"=>$event[0]['event_tabulator']),["id","CONCAT(first_name, ' ', last_name) full_name"]);

$event[0]['event_chairman'] = $event_chairman[0];
$event[0]['event_tabulator'] = $event_tabulator[0];

$dir = "../../event-logo/";
$url = "event-logo/";

$logo = null;
$default_logo_path = $dir."logo.png";
$event_logo_jpg_path = $dir.$_POST['id'].".jpg";
$event_logo_png_path = $dir.$_POST['id'].".png";

if (file_exists($default_logo_path)) {
	$default_logo = $url."logo.png";
	$logo = $default_logo;
};

if (file_exists($event_logo_jpg_path)) {
	$event_logo = $url.$_POST['id'].".jpg";
	$logo = $event_logo;	
};

if (file_exists($event_logo_png_path)) {
	$event_logo = $url.$_POST['id'].".png";
	$logo = $event_logo;	
};

$event[0]['event_logo'] = $logo;

echo json_encode($event[0]);

?>