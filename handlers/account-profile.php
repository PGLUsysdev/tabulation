<?php

require_once '../db.php';

session_start();

$con = new pdo_db("users");

$user = $con->get(["id"=>$_SESSION['id']],["users.id, CONCAT(users.first_name, ' ', users.last_name) user", "users.user_group", "(SELECT groups.group_description FROM groups WHERE groups.id = users.user_group) description"]);

$dir = "pictures/";
$avatar = $dir."avatar-48.png";

$picture = $dir.$user[0]['id'].".jpg";
if (!file_exists("../".$picture)) $picture = $avatar;

$profile = array(
	"user"=>$user[0]['user'],
	"picture"=>$picture,
	"description"=>$user[0]['description'],
	"group"=>$user[0]['user_group']
);

echo json_encode($profile);

?>