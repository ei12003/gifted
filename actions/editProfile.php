<?php
  include_once('../config/init.php');
  include_once('../database/members.php');

  if(isset($_SESSION['username']) && isset($_GET['username']) 
  						   && isset($_GET['first_name'])
  						   && isset($_GET['last_name'])
  						   && isset($_GET['userid'])
  						   && isset($_GET['password'])
  						   && isset($_GET['email'])){

	$row = editProfile($_GET['username'],
						$_GET['first_name'],
						$_GET['last_name'],
						$_GET['email'],
						$_GET['password'],
						$_GET['userid']);

	if($row==0)
		header('Location: ../index.php');
	else{
		$_SESSION['username']=$_GET['username'];
		if (!empty($_SERVER['HTTP_REFERER']))
        	header("Location: ".$_SERVER['HTTP_REFERER']);
        else
        	header('Location: ../index.php');
	}

  }
  else
	header('Location: ../index.php');
 
?>