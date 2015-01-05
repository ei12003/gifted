<?php

  /* Checks if there is already someone with that username. */
  
  include_once('../config/init.php');
  include_once('../database/members.php');
	
	$user = getUserByUsername($_GET['username']);
	if(empty($user))
		echo true;
	else
		echo false;
 
?>