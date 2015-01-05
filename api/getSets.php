<?php

  /* A logged teacher gets all the sets he made. */

  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"){

     
		$teacherSets = getSetsFromTeacher($_SESSION['userid']);
	   echo json_encode($teacherSets);
	
  }
  else
	 echo false;
 
?>