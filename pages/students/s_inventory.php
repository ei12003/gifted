<?php

	include_once('../../config/init.php');
	include_once('../../database/inventory.php');

	if (isset($_SESSION['username']) && isset($_SESSION['usertype']) && $_SESSION['usertype'] == 'student'){
	   
    	$itens = getUserInventory($_SESSION['userid']);
    	//print_r($itens);
		$smarty->assign("INVENTORY",$itens);
		print_r($itens);

		$smarty->display('common/header.tpl');
		$smarty->display('students/s_inventory.tpl');
		$smarty->display('common/footer.tpl');
    }
    else
      // header('Location: '.$BASE_URL);

?>