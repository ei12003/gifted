<?php
  include_once('../config/init.php');
  include_once('../database/members.php');
	
	$user = getUserByUsername($_GET['username']);
	if(empty($user)){
		echo false;
	}
	else
		echo true;
 
?>