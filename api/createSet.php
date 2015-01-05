<?php

  /* The logged teacher creates a set giving its name and his userid */

  include_once('../config/init.php');
  include_once('../database/exercises.php');

  if(isset($_SESSION['username'])
     && ($_SESSION['usertype'] == "teacher")
     && isset($_GET['name'])){
	$setid = createSet($_GET['name'],$_SESSION['userid']);

	if($setid<1)
		echo json_encode(array(false, "Error creating set."));
	else
		echo json_encode(array(true, $setid));
	

  }
  else
	echo json_encode(array(false, "Unauthorized"));
 
?>