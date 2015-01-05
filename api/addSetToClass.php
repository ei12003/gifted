<?php

  /* Adds a set of exercises, made by the logged teacher, to a class. */

  include_once('../config/init.php');
  
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid']) 
  	&& isset($_GET['setid'])){
	
	//Checks if the setid given corresponds to an existing set attributed to the classid.
	$result = getSetsClassTeach($_GET['setid'],$_GET['classid'],$_SESSION['userid']);
	if(count($result)==0){
		$row = addSetToClass($_GET['setid'],$_GET['classid']);
		
		if ($row == 1) {
			$name = getSetName($_GET['setid']);
			echo json_encode(array(true, $name));
		} else {
			echo json_encode(array(false, "Fail."));
		}
	}
	else
		echo json_encode(array(false,"Set already added in this class."));
  }
  else
	echo json_encode(array(false,"Unauthorized."));
 
?>