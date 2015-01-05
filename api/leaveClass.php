<?php

  /* A logged student leaves one of his classes. */

  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username'])
	&& isset($_SESSION['userid'])
  	&& $_SESSION['usertype'] == "student"
  	&& isset($_GET['classid']) ){

	$row = removeUserFromClass($_SESSION['userid'],$_GET['classid']);
	if($row==0)
		echo false;
	else{
		echo true;
	}

  }
  else
	echo false;
 
?>