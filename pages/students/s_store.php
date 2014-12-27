<?php

	include_once('../../config/init.php');
	include_once('../../database/store.php');
	$ITEM_PER_PAGE = 6;
	if(isset($_SESSION['username'])){
	   
		$CURRENT_PAGE = 's_store';
		
		$items = getStore();
		$total_items = getStoreSize();
		$num_pag = ceil(($total_items/$ITEM_PER_PAGE));


		$smarty->assign("ITEMS", $items);
		$smarty->assign("TOTALITEMS", $total_items);
		$smarty->assign("NUM_PAG", $num_pag);
		$smarty->assign("ITEM_PER_PAGE", $ITEM_PER_PAGE);
		

		$smarty->display('common/header.tpl');
		$smarty->display('students/s_store.tpl');
		$smarty->display('common/footer.tpl');
    
	}
	else
		header('Location: ../../index.php');

?>