<?php
include_once('../config/init.php');
include_once('../database/members.php');

if (!isset($_SESSION['username'])){
	
	if (isset($_POST['first_name'])
		&& isset($_POST['last_name'])
		&& isset($_POST['email'])
		&& isset($_POST['birth_date'])
		&& isset($_POST['gender'])
		&& isset($_POST['usertype'])
		&& isset($_POST['password'])
		&& isset($_POST['username'])) {
			
		$result=insertUser($_POST['first_name'], $_POST['last_name'],
						$_POST['email'], $_POST['birth_date'],
						$_POST['gender'], $_POST['usertype'],
						$_POST['password'], $_POST['username']);
		
		if($result<0){
			header("Location: ../index.php");
		}
		else{
			$_SESSION['usertype'] = $_POST['usertype'];
			$_SESSION['userid'] = $result;
			$_SESSION['username'] = $_POST['username'];
			$_SESSION['userpoints'] = 100;
			
			if (!empty($_SERVER['HTTP_REFERER']))
				header("Location: ".$_SERVER['HTTP_REFERER']);
				
			else
				
				header("Location: ../index.php");
		
		}
				
	}
}


?>