<?php

require_once '../../db.php';

$con = new pdo_db("users");

$users = $con->all(["id","CONCAT(first_name, ' ', last_name) full_name"]);

echo json_encode($users);

?>