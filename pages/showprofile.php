<?php
	include_once('../config/init.php');
	include_once('../database/members.php');
	include_once('../database/classes.php');
	include_once('../database/avatar.php');
if(isset($_GET['id'])){
	$user = getUser($_GET['id']);
	$events = getStudentEvents($_GET['id']);

	$avatar_choices = getAvatarSelection($_GET['id']);
    	

    	for($i=0;$i<3;$i++){
    		if($avatar_choices['part'.$i]!=null){
    			$item = getItem($avatar_choices['part'.$i]);
    			$avatar_choices['ipart'.$i] = $item['img_location'];
    		}
    	}
	
	$smarty->assign("SHOWPROFILE","true");
	$smarty->assign("USERINFO",$user);
	$smarty->assign("EVENTS",$events);
	$smarty->assign("AVATARCHOICES",$avatar_choices);

	$smarty->display('common/header.tpl');
	$smarty->display('common/avatar.tpl');
	$smarty->display('common/showprofile.tpl');
	$smarty->display('common/footer.tpl');
}
else
	header('Location: ../index.php');
?>