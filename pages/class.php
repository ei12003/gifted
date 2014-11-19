<?php

	include_once('../config/init.php');
	include_once('../database/classes.php');

	if ($_SESSION['login'] && $_GET['username']){
	   
       $class = getClass($_GET['id']);
	   
	   foreach ($class as $abc) {
		$pagetitle = "Turma ".$abc['name'];
		$smarty->assign("PAGETITLE",$pagetitle);
		$smarty->assign("class",$abc);
		$smarty->display('../templates/class.tpl');
	   }
     
    }

    else
       header('Location: '.$BASE_URL);

?>