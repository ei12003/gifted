<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid'])
	&& isset($_GET['amount'])	
  	&& isset($_GET['userid'])){

	$row = givePointsToUser($_GET['amount'],$_GET['classid'],$_GET['userid']);
	if($row==0)
		header('HTTP/1.1 404');
	else{
		header('HTTP/1.1 200');
	}

  }
  else
	header('HTTP/1.1 404');
 
?>