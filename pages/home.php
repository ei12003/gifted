<?php
	include_once('../config/init.php');
	
	$CURRENT_PAGE = 'home';
	
	$smarty->display('common/header.tpl');
	$smarty->display('common/home.tpl');
	$smarty->display('common/footer.tpl');

?>