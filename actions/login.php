<?php
include_once('../config/init.php');
include_once('../database/members.php');
  
if (!isset($_SESSION['username'])){
	
	if (isset($_POST['username']) && isset($_POST['password'])) {
		// Check if user exists.
		$row=getUserWithPass($_POST['username'],$_POST['password']);
		
		// If he does not:
		if(!$row){

			$_SESSION['username'] = null;
			$_SESSION['error_messages']= 'Login failed';
			header("Location: ../index.php");
		}
		// If he does:
		else{
			$_SESSION['usertype'] = $row['usertype'];
			$_SESSION['userpoints'] = $row['points'];
			$_SESSION['userid'] = $row['id'];
			$_SESSION['username'] = $_POST['username'];
		
			if (!empty($_SERVER['HTTP_REFERER']))
				header("Location: ".$_SERVER['HTTP_REFERER']);
			else
				header("Location: ../index.php");
		
		}
				
	}
}


?>
 
