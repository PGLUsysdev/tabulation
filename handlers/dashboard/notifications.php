<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$id = (isset($_SESSION['id']))?$_SESSION['id']:0;

$con = new pdo_db("notifications");

$notifications = array(
	"count"=>0,
	"contents"=>[]
);

$get_notifications = $con->get(array("dismiss"=>0,"user_id"=>$id),["id","icon","message"]);

$notifications['count'] = count($get_notifications);

foreach ($get_notifications as $gn) {
	
	$notifications['contents'][] = $gn;
	
};

echo json_encode($notifications);

?>