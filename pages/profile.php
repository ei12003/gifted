<?php
	include_once('../config/init.php');
	include_once('../database/members.php');
	include_once('../database/classes.php');
if(isset($_SESSION['username'])){
	$CURRENT_PAGE = 'profile';
	$user = getUser($_SESSION['userid']);
	$events = getStudentEvents($_SESSION['userid']);
	
	$smarty->assign("USERINFO",$user);
	$smarty->assign("EVENTS",$events);

	$smarty->display('common/header.tpl');
	$smarty->display('common/profile.tpl');
	$smarty->display('common/footer.tpl');
}
else
	header('Location: ../index.php');
?>