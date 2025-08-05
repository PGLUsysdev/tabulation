<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("special_awards");

$delete_special_award = array("id"=>$_POST['id']);

$con->deleteData($delete_special_award);

?>