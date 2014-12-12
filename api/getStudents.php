<?php
  include_once('../config/init.php');
  include_once('../database/members.php');

  if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "teacher"){

			
	echo json_encode(getStudents());
	
  }
  else
	//header('HTTP/1.1 404');
	echo false;
 
?>