<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("users");

$user = array(
	"id"=>$_POST['id'],
	"ip_address"=>$_POST['ip_address']
);

$update = $con->updateData($user,'id');

?>