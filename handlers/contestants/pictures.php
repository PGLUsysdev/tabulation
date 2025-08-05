<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

require_once '../active-event.php';

$contestant_id = $_POST['id'];

$dir = "../../pictures/".$active_event['id']."/$contestant_id/";
$url = "pictures/".$active_event['id']."/$contestant_id/";

$_pictures = scandir($dir);

$pictures = [];

foreach ($_pictures as $i => $picture) {
	
	if ($picture==".") continue;
	if ($picture=="..") continue;
	
	$pictures[] = array(
		"filename"=>$picture,
		"thumbnail"=>$url.$picture
	);
	
};

echo json_encode($pictures);

?>