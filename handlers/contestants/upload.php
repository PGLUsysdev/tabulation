<?php

require_once '../../db.php';

$con = new pdo_db();

require_once '../active-event.php';

$contestant_id = $_POST['contestant_id'];

$dir = "../../pictures/".$active_event['id']."/$contestant_id/";

if (!empty($_FILES)) {
     
    $tempFile = $_FILES['file']['tmp_name'];            
     
    $targetFile =  $dir.$_FILES['file']['name'];
 
    move_uploaded_file($tempFile,$targetFile);
     
}

?>