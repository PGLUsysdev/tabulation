<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$data = array("fb_token"=>$_POST['token'],"is_active"=>1);

$update_token = $con->updateData($data,'is_active');

echo $_POST['token'];

?>