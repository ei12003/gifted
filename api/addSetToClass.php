<?php
  include_once('../config/init.php');
  
  include_once('../database/exercises.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"
  	&& isset($_GET['classid']) 
  	&& isset($_GET['setid'])){
	
	$result = getSetsClassTeach($_GET['setid'],$_GET['classid'],$_SESSION['userid']);
	if(count($result)==0){
		$row = addSetToClass($_GET['setid'],$_GET['classid']);
		
		if ($row == 1) {
			echo json_encode(array(true, "Sucess."));
		} else {
			echo json_encode(array(false, "Fail."));
		}
	}
	else
		echo json_encode(array(false,"Set already added in this class."));
  }
  else
	//header('HTTP/1.1 404');
	echo json_encode(array(false,"Unauthorized."));
 
?>