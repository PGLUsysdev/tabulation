<?php

function criterion_portion($con,$extract_portion,$ongoing_portion_contestant_id) {

	$score = 0;

	$sql = "SELECT SUM(scores.score) total_score FROM scores WHERE portion_contestant_id = (SELECT portions_contestants.id FROM portions_contestants WHERE portions_contestants.portion_id = $extract_portion AND portions_contestants.contestant_id = (SELECT portions_contestants.contestant_id FROM portions_contestants WHERE portions_contestants.id = $ongoing_portion_contestant_id)) AND scores.score_criterion IN (SELECT criteria.id FROM criteria WHERE criteria.portion_id = $extract_portion)";

	$get_score = $con->getData($sql);

	if (count($get_score)) {

		$portion_score = ($get_score[0]['total_score']==null)?0:$get_score[0]['total_score'];
		
		// get no of judges for average
		$portion_judges = $con->getData("SELECT * FROM portions_judges WHERE portion_id = $extract_portion");
		
		$no_of_judges = (count($portion_judges ))?count($portion_judges ):1;
		$score = $portion_score/$no_of_judges;
		
		$score = round($score,2);

	};

	return $score;

};

?>