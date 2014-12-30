<?php

	include_once('../../config/init.php');
	include_once('../../database/classes.php');
	include_once('../../database/members.php');
	include_once('../../database/exercises.php');

	if(isset($_SESSION['username'])
		&& isset($_GET['classid'])
		&& isset($_GET['setid'])){
	   	
		$CURRENT_PAGE = 's_exercise';

		$classid = $_GET['classid'];
		$setid = $_GET['setid'];
		$userid = $_SESSION['userid'];

		if(isSetFromClass($classid,$setid)){

			$list_ex = getSet($setid);
			$set_name = getSetName($setid);

			$list = array();
			foreach($list_ex as $exe){
				$exe_id = $exe['exid'];
				$exe_opts = getExercise($exe_id);
				$exe_name = getExerciseName($exe_id);
				$exe_correct = getRightAnswer($exe_id);
				$exe = array("id"=>$exe_id,"name"=>$exe_name, "correct" => $exe_correct, "ops" =>$exe_opts);
				array_push($list,$exe);
			}
			$set['exercises'] = $list;
			$set['numEx'] = count($list_ex);
			$set['name'] = $set_name;
			$set['id'] = $setid;
			$smarty->assign("SET",$set);			

			$answer = getMemberAnswer($setid,$classid,$userid);
			if(count($answer) == 0)// User still hasn't answered this set of exercises.
				$smarty->assign("ANSWERED","false");			
			else{
				$smarty->assign("ANSWERED","true");
				echo $answer[0]['memberId'];			
			}

			$smarty->assign("CLASSID",$_GET['classid']);			
			$smarty->display('common/header.tpl');
			$smarty->display('students/s_exercise.tpl');
			$smarty->display('common/footer.tpl');
		}
		else
			header('Location: ./s_classes.php');
    
	}
	else
		header('Location: ../../index.php');

?>