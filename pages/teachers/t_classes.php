<?php

	/* Page where a teacher can see and manage his classes. */


	include_once('../../config/init.php');
	include_once('../../database/classes.php');
	include_once('../../database/members.php');
	include_once('../../database/exercises.php');

	if(isset($_SESSION['username']) && isset($_SESSION['usertype']) && $_SESSION['usertype'] == "teacher"){

		$CURRENT_PAGE = 't_classes';

		$rows=getUserClasses($_SESSION['userid']);

		$classes = array();
		foreach($rows as $row){
			$students=getStudentsFromClass($row['id']);
			$score_total = getClassTotalScore($row['id']);
			$size=count($students);
			$exercises = getSetsIDFromClass($row['id']);
			$class = array("name"=>$row['name'],"id"=>$row['id'],"score"=>$score_total,"numStd"=>$size,"students"=>$students,"sets" => $exercises);
			$classes[] = $class;
		}

		
		$smarty->assign("CLASSES",$classes);


		$smarty->display('common/header.tpl');
		$smarty->display('teachers/t_classes.tpl');
		$smarty->display('common/footer.tpl');

	}
	else
	header('Location: ../../index.php');

?>