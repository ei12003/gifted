<?php

  /* A logged teacher deletes an exercise. */

  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['exid'])){

	$row = deleteExercise($_GET['exid']);
	if($row==0)
		echo false;
	else{
		echo true;
	}

  }
  else
	echo false;
 
?>