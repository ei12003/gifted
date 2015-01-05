<?php

  /* The logged teacher deletes a class. */

  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username'])
  	&& isset($_GET['classid'])
  	&& $_SESSION['usertype'] == "teacher"
  	){

	$row = deleteClass($_GET['classid']);
	if($row<1)
		echo false;
	else{
		echo true;
	}

  }
  else
	echo false;
 
?>