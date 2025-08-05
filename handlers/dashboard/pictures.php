<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';
require_once '../folder-files.php';

$con = new pdo_db("portions_contestants");

require_once '../active-event.php';

$contestant = $con->get(array("id"=>$_POST['id']),['contestant_id']);
$id = $contestant[0]['contestant_id'];

$dir = "../../pictures";

$path = "$dir/$active_event[id]";
if (!folder_exist($path)) mkdir($path);
$path_picture = "$path/$id";
if (!folder_exist($path_picture)) mkdir($path_picture);

$files = scandir("../../pictures/$active_event[id]/$id");
$pictures = [];

foreach ($files as $file) {

	if (($file == ".") || ($file == "..")) continue;
	
	$pictures[] = array("src"=>"pictures/$active_event[id]/$id/$file");
	
};

if (count($pictures)==0) $pictures[] = array("src"=>"pictures/contestant.jpg");

echo json_encode($pictures);

?>