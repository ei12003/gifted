<?php

	include_once('../../config/init.php');
	//include_once('../database/classes.php');

	//if ($_SESSION['username']){
	   
		$CURRENT_PAGE = 't_classes';
	
		$smarty->display('common/header.tpl');
		$smarty->display('teachers/t_classes.tpl');
		$smarty->display('common/footer.tpl');
    
	//}

?>