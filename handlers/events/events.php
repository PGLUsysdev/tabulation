<?php

require_once '../../db.php';

$con = new pdo_db("tabulation_events");

$events = $con->all(["tabulation_events.id","tabulation_events.description","tabulation_events.venue","DATE_FORMAT(tabulation_events.event_date, '%b %e, %Y') event_date","(SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_chairman) event_chairman","(SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_tabulator) event_tabulator","is_active"]);

echo json_encode($events);

?>