<?php

	include_once('../../config/init.php');
	include_once('../../database/store.php');

	if(isset($_SESSION['username'])){
	   
		$CURRENT_PAGE = 's_store';
		
		$items = getStore();
		$smarty->assign("ITEMS", $items);

		$smarty->display('common/header.tpl');
		$smarty->display('students/s_store.tpl');
		$smarty->display('common/footer.tpl');
    
	}
	else
		header('Location: ../../index.php');

?>