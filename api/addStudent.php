<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid']) 
  	&& isset($_GET['userid'])){

	$row = addUserToClass($_GET['userid'],$_GET['classid']);
	if($row==0)
		header('HTTP/1.1 404');
	else{
		header('HTTP/1.1 200');
	}

  }
  else
	header('HTTP/1.1 404');
 
?>