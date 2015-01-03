<?php
  include_once('../config/init.php');

  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid'])
	&& isset($_GET['amount'])	
  	&& isset($_GET['userid'])){

	$row = addPointsToStudent($_GET['amount'],$_GET['userid'],$_GET['classid']);



	if($row==0)
		echo json_encode(array(false, "Fail."));
	else
		echo json_encode(array(true, "Success."));

  }
  else
	echo json_encode(array(false, "Unauthorized."));
 
?>