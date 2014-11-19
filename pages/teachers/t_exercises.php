<?php

	include_once('../../config/init.php');
	//include_once('../database/classes.php');

	//if ($_SESSION['username']){
	   
		$CURRENT_PAGE = 't_exercises';
	
		$smarty->display('common/header.tpl');
		$smarty->display('teachers/t_exercises.tpl');
		$smarty->display('common/footer.tpl');
    
	//}

?>