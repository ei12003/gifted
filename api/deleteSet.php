<?php
  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['setid'])){

	$row = deleteSet($_GET['setid']);
	if($row==0)
		echo false;
	else{
		echo true;
	}

  }
  else
	echo false;
 
?>