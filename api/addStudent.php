<?php
  include_once('../config/init.php');
  include_once('../database/classes.php');
  include_once('../database/members.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid']) 
  	&& isset($_GET['userid'])){

	$row = addUserToClass($_GET['userid'],$_GET['classid']);
	
	if($row == 23000) {
		//header('HTTP/1.1 404');
		echo json_encode(array(false, "User is already in the class."));
	} else if ($row == 1) {
		//header('HTTP/1.1 200');
		$user = getUser($_GET['userid']);
		echo json_encode(array(true, $user["first_name"].' '.$user["last_name"]));
	} else {
		echo json_encode(array(false, "User does not exist."));
	}
  }
  else
	//header('HTTP/1.1 404');
	echo json_encode(array(false));
 
?>