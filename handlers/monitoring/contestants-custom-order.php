<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions_contestants");

$portion_contestants = $_POST;

foreach ($portion_contestants as $pc) {
	
	$custom_order = array(
		"id"=>$pc['id'],
		"contestant_rank"=>($pc['contestant_rank']==0)?null:$pc['contestant_rank']
	);
	
	$update_order = $con->updateData($custom_order,'id');
	
};

?>