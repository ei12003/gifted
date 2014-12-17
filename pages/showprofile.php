<?php
	include_once('../config/init.php');
	include_once('../database/members.php');
	include_once('../database/classes.php');
if(isset($_GET['id'])){
	$user = getUser($_GET['id']);
	$events = getStudentEvents($_GET['id']);
	
	$smarty->assign("USERINFO",$user);
	$smarty->assign("EVENTS",$events);

	$smarty->display('common/header.tpl');
	$smarty->display('common/showprofile.tpl');
	$smarty->display('common/footer.tpl');
}
else
	header('Location: ../index.php');
?>