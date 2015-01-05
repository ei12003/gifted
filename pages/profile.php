<?php

 /* Checks a logged user profile. */

	include_once('../config/init.php');
	include_once('../database/members.php');
	include_once('../database/classes.php');
	include_once('../database/avatar.php');

if(isset($_SESSION['username'])){
	$CURRENT_PAGE = 'profile';
	$user = getUser($_SESSION['userid']);
	$events = getStudentEvents($_SESSION['userid']);
	
	// If it's a student, get his avatar.
	if($_SESSION['usertype']=='student'){
		$avatar_choices = getAvatarSelection($_SESSION['userid']);
    	for($i=0;$i<3;$i++){
    		if($avatar_choices['part'.$i]!=null){
    			$item = getItem($avatar_choices['part'.$i]);
    			$avatar_choices['ipart'.$i] = $item['img_location'];
    		}
    	} 
    	$smarty->assign("AVATARCHOICES",$avatar_choices);  	
	}

	$smarty->assign("SHOWPROFILE","true");
	$smarty->assign("USERINFO",$user);
	$smarty->assign("EVENTS",$events);

	$smarty->display('common/header.tpl');

	if($_SESSION['usertype']=='student')
		$smarty->display('common/avatar.tpl');

	$smarty->display('common/profile.tpl');
	$smarty->display('common/footer.tpl');
}
else
	header('Location: ../index.php');
?>