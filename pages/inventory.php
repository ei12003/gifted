<?php

	include_once('../config/init.php');
	include_once('../database/inventory.php');

	if (isset($_SESSION['username'])){
	   
    	$itens = getUserInventory($_SESSION['userid']);
    	print_r($itens);
		//$smarty->assign("CLASS",$abc);
		//$smarty->display('../templates/class.tpl');
    }
    else
       header('Location: '.$BASE_URL);

?>