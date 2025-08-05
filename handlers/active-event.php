<?php

$event = $con->getData("SELECT id, description, venue, DATE_FORMAT(tabulation_events.event_date, '%b %e, %Y') event_date, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_chairman) event_chairman, (SELECT CONCAT(users.first_name, ' ', users.last_name) FROM users WHERE users.id = tabulation_events.event_tabulator) event_tabulator, is_active FROM tabulation_events WHERE is_active = 1");

$active_event = (count($event))?$event[0]:$event;

?>