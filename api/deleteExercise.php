<?php
  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['exid'])){

	$row = deleteExercise($_GET['exid']);
	if($row==0)
		header('HTTP/1.1 404');
	else{
		header('HTTP/1.1 200');
	}

  }
  else
	header('HTTP/1.1 404');
 
?>