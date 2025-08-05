<?php

$event_id = $_POST['event_id'];

$dir = "../../event-logo/";

# delete old logo(s)
$old_logos = array("$event_id.jpg","$event_id.png");

foreach ($old_logos as $ol) {
	
	if (file_exists($dir.$ol)) unlink($dir.$ol);
	
};

if (!empty($_FILES)) {

    $tempFile = $_FILES['file']['tmp_name'];            

	$file = $_FILES['file']['name'];

	$exp_file = explode(".",$file);
	$ext = $exp_file[1];

    $targetFile =  $dir.$event_id.".".$ext;

    move_uploaded_file($tempFile,$targetFile);

}

?>