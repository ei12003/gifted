<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username']) && isset($_GET['class_name'])
     && $_SESSION['usertype'] == "teacher"){

	$classid = createClass($_SESSION['userid'],$_GET['class_name']);
	if($classid<1)
		header('HTTP/1.1 404');
	else{
		header('HTTP/1.1 200');
	}

  }
  else
	header('HTTP/1.1 404');
 
?>