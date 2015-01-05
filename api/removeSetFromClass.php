<?php

  /* A logged teacher removes the association of a set to a class. */

  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid']) 
  	&& isset($_GET['setid'])){

	$row = removeSetFromClass($_GET['setid'],$_GET['classid']);
	if($row==0)
		echo false;
	else{
		echo true;
	}

  }
  else
	echo false;
 
?>