<?php
include_once('../config/init.php');
include_once('../database/members.php');
  
 // echo $_POST['username']; echo $_POST['password'];
// echo 'session:'.$_SESSION['username'];

if (!isset($_SESSION['username'])){
	
	if (isset($_POST['username']) && isset($_POST['password'])) {
			
		$row=getUserWithPass($_POST['username'],$_POST['password']);
		
		if(!$row){

			$_SESSION['username'] = null;
			//echo "failed";
			header("Location: ../index.php");
		}
		else{
			$_SESSION['usertype'] = $row['usertype'];
			$_SESSION['userid'] = $row['id'];
			$_SESSION['username'] = $_POST['username'];
		
			if (!empty($_SERVER['HTTP_REFERER']))
				header("Location: ".$_SERVER['HTTP_REFERER']);
				//echo "back";
			else
				//echo "home";
				header("Location: ../index.php");
		
		}
				
	}
}


?>
 
