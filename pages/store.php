<?php

	include_once('../config/init.php');
	include_once('../database/store.php');

	if (isset($_SESSION['username'])){
	   
    	$itens = getStore();
    	print_r($itens);
		//$smarty->assign("CLASS",$abc);
		//$smarty->display('../templates/class.tpl');
    }
    else
       header('Location: '.$BASE_URL);

?>