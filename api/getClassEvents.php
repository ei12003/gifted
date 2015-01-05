<?php

  /* Gets all student events related to this class. */

  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username'])
		&& isset($_GET['classid'])){

		$events = getStudentsEventsClass($_GET['classid']);
		
		
		echo json_encode($events);
	
  }
  else
	echo false;
 
?>