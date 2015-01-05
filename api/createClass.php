<?php

  /* The logged teacher creates a class giving its name and his userid */
  
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username']) && isset($_GET['class_name'])
     && $_SESSION['usertype'] == "teacher"){

	$classid = createClass($_SESSION['userid'],$_GET['class_name']);
	if($classid<1)
		echo json_encode(array(false, ""));
	else{
		echo json_encode(array(true, $classid));
	}

  }
  else
	echo json_encode(array(false, ""));
 
?>