<?php

	include_once('../config/init.php');
	include_once('../database/members.php');

	if ($_SESSION['login'] && $_GET['username']){
	   
       $user = getMemberInfo($_GET['username']);
	   
	   foreach ($user as $abc) {
		$pagetitle = "Profile - ".$abc['username']." Perfil";
		$smarty->assign("PAGETITLE",$pagetitle);
		$smarty->assign("INFO",$abc);
		$smarty->display('../templates/profile.tpl');
	   }
     
    }

    else
       header('Location: '.$BASE_URL);

?>