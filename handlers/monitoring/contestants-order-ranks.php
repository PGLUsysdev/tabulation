<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("portions_contestants");

$portion_contestants = $con->getData("SELECT portions_contestants.contestant_id, portions_contestants.id, contestants.contestant_no, contestants.contestant_name, contestants.description, portions_contestants.contestant_rank FROM portions_contestants LEFT JOIN contestants ON portions_contestants.contestant_id = contestants.id WHERE portions_contestants.portion_id = ".$_POST['portion_id']);

foreach ($portion_contestants as $i => $pc) {
	
	$portion_contestants[$i]['contestant_rank'] = ($pc['contestant_rank']==null)?0:$pc['contestant_rank'];
	
};

echo json_encode($portion_contestants);

?>