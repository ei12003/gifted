<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username']) && isset($_GET['class_name'])
     && $_SESSION['usertype'] == "teacher"){

	$classid = createClass($_SESSION['userid'],$_GET['class_name']);
	if($classid<1)
		//header('HTTP/1.1 404');
		echo json_encode(array(false, ""));
	else{
		//header('HTTP/1.1 200');
		echo json_encode(array(true, $classid));
	}

  }
  else
	//header('HTTP/1.1 404');
	echo json_encode(array(false, ""));
 
?>