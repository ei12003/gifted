<?php
  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username'])
     && ($_SESSION['usertype'] == "teacher")
     && isset($_GET['name'])){
	$setid = createSet($_GET['name'],$_SESSION['userid']);

	if($setid<1)
		//header('HTTP/1.1 404');
		echo json_encode(array(false, "Error creating set."));
	else
		//header('HTTP/1.1 200');
		echo json_encode(array(true, $setid));
	

  }
  else
	//header('HTTP/1.1 404');
	echo json_encode(array(false, "Unauthorized"));
 
?>