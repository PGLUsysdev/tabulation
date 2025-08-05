<?php

$status = null;

set_error_handler('no_connectivity');

function no_connectivity($errno, $errstr, $errfile, $errline) {

	
};

$status = fsockopen("10.10.26.4", 80, $errno, $errstr, 1);

?>