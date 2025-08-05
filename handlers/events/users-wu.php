<?php

require_once '../../db.php';

$con = new pdo_db("users");

$_users = $con->all(["id","CONCAT(first_name, ' ', last_name) full_name"]);

$users = [];
$users[] = array("id"=>0,"full_name"=>"");
foreach ($_users as $i => $user) {
	
	$users[] = $user;
	
};

echo json_encode($users);

?>