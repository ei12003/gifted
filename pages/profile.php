<?php
	include_once('../config/init.php');
	include_once('../database/members.php');
if(isset($_SESSION['username'])){
	$CURRENT_PAGE = 'profile';
	$user = getUser($_SESSION['userid']);
	
	$smarty->assign("USERINFO",$user);
	$smarty->display('common/header.tpl');
	$smarty->display('common/profile.tpl');
	$smarty->display('common/footer.tpl');
}
else
	header('Location: ../index.php');
?>