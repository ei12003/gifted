<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');

  if(isset($_SESSION['username'])
  	&& isset($_GET['classid'])
  	&& $_SESSION['usertype'] == "teacher"
  	//AND TEACHER OF THIS CLASS
  	){

	$row = deleteClass($_GET['classid']);
	if($row<1)
		//header('HTTP/1.1 404');
		echo false;
	else{
		//header('HTTP/1.1 200');
		echo true;
	}

  }
  else
	//header('HTTP/1.1 404');
	echo false;
 
?>