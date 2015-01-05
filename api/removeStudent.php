<?php

  /* A logged teacher removes a student from a class. */

  include_once('../config/init.php');
  include_once('../database/classes.php');


  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid']) 
  	&& isset($_GET['userid'])){

	$row = removeUserFromClass($_GET['userid'],$_GET['classid']);
	if($row==0)
		echo false;
	else{
		echo true;
	}

  }
  else
	echo false;
 
?>