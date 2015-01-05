<?php

 /* Page to register a new user. */

	include_once('../config/init.php');
	include_once('../database/members.php');
	include_once('../database/classes.php');
	
if(!isset($_SESSION['username'])){
	$CURRENT_PAGE = 'register';
	
	$smarty->display('common/header.tpl');
	$smarty->display('common/register.tpl');
	$smarty->display('common/footer.tpl');
}
else
	header('Location: ../index.php');
?>