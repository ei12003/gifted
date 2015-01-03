<?php
  include_once('../config/init.php');
  include_once('../database/members.php');

  if(isset($_SESSION['username']) && isset($_POST['username']) 
  						   && isset($_POST['first_name'])
  						   && isset($_POST['last_name'])
  						   && isset($_POST['userid'])
  						   && isset($_POST['password'])
  						   && isset($_POST['email'])){

	$row = editProfile($_POST['username'],
						$_POST['first_name'],
						$_POST['last_name'],
						$_POST['email'],
						$_POST['password'],
						$_POST['userid']);

	if($row==0)
		header('Location: ../index.php');
	else{
		$_SESSION['username']=$_POST['username'];
		if (!empty($_SERVER['HTTP_REFERER']))
        	header("Location: ".$_SERVER['HTTP_REFERER']);
        else
        	header('Location: ../index.php');
	}

  }
  else
	header('Location: ../index.php');
 
?>