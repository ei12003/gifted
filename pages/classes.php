<?php

	include_once('../config/init.php');
	include_once('../database/classes.php');

	if ($_SESSION['login'] && $_GET['username']){
	   
       $classes = getClassesByUser($_GET['username']);
	   $pagetitle = "Turmas";
	   $smarty->assign("PAGETITLE",$pagetitle);
	   $smarty->assign("class",$classes);
	   $smarty->display('../templates/classes.tpl');     
    }

    else
       header('Location: '.$BASE_URL);

?>