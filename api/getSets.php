<?php
  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"){

     
		$teacherSets = getSetsFromTeacher($_SESSION['userid']);
	   echo json_encode($teacherSets);
	
  }
  else
	//header('HTTP/1.1 404');
	echo false;
 
?>