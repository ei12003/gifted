<?php

/* Page where a teacher can see and manage his sets of exercises. */

include_once('../../config/init.php');
include_once('../../database/exercises.php');

if(isset($_SESSION['username']) && isset($_SESSION['usertype']) && $_SESSION['usertype'] == "teacher"){
    
	$CURRENT_PAGE = 't_exercises';
	$list_sets = getSetsFromTeacher($_SESSION['userid']);
	$sets = array();

	foreach($list_sets as $set){
		
		$setID = $set['id'];

		$list_ex = getSet($setID);
		$set_name = getSetName($setID);
		$list = array();
		foreach($list_ex as $exe){
			$exe_id = $exe['exid'];
			$exe_opts = getExercise($exe_id);
			$exe_name = getExerciseName($exe_id);
			$exe_correct = getRightAnswer($exe_id);

			$exe = array("id"=>$exe_id,"name"=>$exe_name, "correct" => $exe_correct, "ops" =>$exe_opts);
			array_push($list,$exe);
		}
		
		if(hasStudentAnsweredSet($setID))
			$set['lock'] = 1;
		else
			$set['lock'] = 0;

		$set['exercises'] = $list;
		$set['numEx'] = count($list_ex);
		array_push($sets,$set);
	}

	$smarty->assign("SETS", $sets);
	$smarty->display('common/header.tpl');
	$smarty->display('teachers/t_exercises.tpl');
	$smarty->display('common/footer.tpl'); 
 }
 else
	header('Location: ../../index.php');

?>