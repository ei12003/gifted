<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(!isset($_SESSION['username'])
		&& isset($_GET['classid'])){

		$events = getStudentsEventsClass($_GET['classid']);
		
		
		echo json_encode($events);
	
  }
  else
	//header('HTTP/1.1 404');
	echo false;
 
?>