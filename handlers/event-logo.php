<?php

require_once '../db.php';

$con = new pdo_db();

require_once 'active-event.php';

$get_logo = getLogo($active_event);

$image = $get_logo['file'];

$image = "../event-logo/".$image;

$imageData = base64_encode(file_get_contents($image));

$logo = 'data:'.mime_content_type($image).';base64,'.$imageData;

$response = array("file"=>addslashes($logo),"type"=>$get_logo['type']);

echo json_encode($response);

function getLogo($active_event) {

	$logo = array("file"=>null,"type"=>null);

	$files = scandir("../event-logo/");

	foreach ($files as $i => $file) {

		if (preg_match("/".(string)$active_event['id']."./",$file)) {

			$logo['file'] = $file;
			$file_type = explode(".",$file);
			
			switch ($file_type[1]) {
				
				case "png":
					
					$logo['type'] = "PNG";
					
				break;
				
				case "jpg":
				
					$logo['type'] = "JPEG";				
				
				break;
				
			};
			
			break;
			
		} else {

			$logo['file'] = "logo.png";
			$logo['type'] = "PNG";
			
		}

	};

	return $logo;

};

?>