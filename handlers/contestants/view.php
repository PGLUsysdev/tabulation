<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../folder-files.php';

$con = new pdo_db("contestants");

require_once '../active-event.php';

# create directory
$dir = "../../pictures";
$path = "$dir/$active_event[id]";
if (!folder_exist($path)) mkdir($path);
$path_picture = "$path/$_POST[id]";
if (!folder_exist($path_picture)) mkdir($path_picture);

$contestant = $con->get(array("id"=>$_POST['id']),["*", "IF(is_active=1,'true','false') is_active"]);

$con->table = "tabulation_events";
$event = $con->get(array("id"=>($contestant[0]['event_id']==null)?0:$contestant[0]['event_id']),["id","description","venue","DATE_FORMAT(event_date, '%b %e, %Y') event_date","is_active"]);

$contestant[0]['event_id'] = $event[0];

$files = scandir("../../pictures/$active_event[id]/$_POST[id]");
$pictures = [];

foreach ($files as $file) {

	if (($file == ".") || ($file == "..")) continue;
	
	$pictures[] = array("src"=>"pictures/$active_event[id]/$_POST[id]/$file");
	
}

if (count($pictures)==0) $pictures[] = array("src"=>"pictures/contestant.jpg");

$contestant[0]['pictures'] = $pictures;

echo json_encode($contestant[0]);

?>