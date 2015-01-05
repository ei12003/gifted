<?php

    /*
     * Page where a student can see his items bought, as well his avatar.
     * He can choose which items he wishes to equip his avatar.
     */

	include_once('../../config/init.php');
	include_once('../../database/inventory.php');
	include_once('../../database/avatar.php');

	if (isset($_SESSION['username']) && isset($_SESSION['usertype']) && $_SESSION['usertype'] == 'student'){
	   
    	$itens = getUserInventory($_SESSION['userid']);
    	$avatar_choices = getAvatarSelection($_SESSION['userid']);
    	

    	for($i=0;$i<3;$i++){
    		if($avatar_choices['part'.$i]!=null){
    			$item = getItem($avatar_choices['part'.$i]);
    			$avatar_choices['ipart'.$i] = $item['img_location'];
    		}
    	}
    
    	
		$smarty->assign("INVENTORY",$itens);
		$smarty->assign("AVATARCHOICES",$avatar_choices);

		$smarty->display('common/header.tpl');
        $smarty->display('common/avatar.tpl');
		$smarty->display('students/s_inventory.tpl');
		$smarty->display('common/footer.tpl');
    }
    else
       header('Location: '.$BASE_URL);

?>