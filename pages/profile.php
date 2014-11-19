<?php
	include_once('../config/init.php');
	
	$CURRENT_PAGE = 'profile';

	$smarty->display('common/header.tpl');
	$smarty->display('common/profile.tpl');
	$smarty->display('common/footer.tpl');

?>