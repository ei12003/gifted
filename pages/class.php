<?php

	include_once('../config/init.php');
	include_once('../database/classes.php');

	if (isset($_SESSION['username']) && isset($_GET['classid'])){
	   
    	$class = getStudentsFromClass($_GET['classid']);
    	print_r($class);
		//$smarty->assign("CLASS",$abc);
		//$smarty->display('../templates/class.tpl');
    }
    else
       header('Location: '.$BASE_URL);

?>