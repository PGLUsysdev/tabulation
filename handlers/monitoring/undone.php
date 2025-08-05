<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$portion_id = $_POST['portion_id'];
$judge_id = $_POST['judge_id'];

$con = new pdo_db("portions_judges_confirmation");

$undone = $con->query("UPDATE portions_judges_confirmation SET confirmation = 0 WHERE judge_id = $judge_id AND portion_id = $portion_id");

?>