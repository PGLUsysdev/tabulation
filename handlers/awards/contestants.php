<?php

require_once '../../db.php';

$con = new pdo_db("contestants");

require_once '../active-event.php';

$contestants = [];

if (count($active_event)) $contestants = $con->getData("SELECT id, contestant_no, (SELECT tabulation_events.description FROM tabulation_events WHERE tabulation_events.id = contestants.event_id) event_id, contestant_name, description, fb_photo_id, 0 hearts, is_active FROM contestants WHERE event_id = ".$active_event['id']." ORDER BY contestant_no");

echo json_encode($contestants);

?>