<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$event = $con->get(["is_active"=>1],["id","description","event_chairman","event_tabulator","fb_token"]);

$token = (count($event))?$event[0]['fb_token']:"";

echo $token;

?>