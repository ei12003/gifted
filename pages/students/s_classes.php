<?php

	include_once('../../config/init.php');
	include_once('../../database/classes.php');
	include_once('../../database/members.php');
	include_once('../../database/exercises.php');

	if(isset($_SESSION['username'])){
	   
		$CURRENT_PAGE = 's_classes';
		
		$rows=getUserClasses($_SESSION['userid']);

		$classes = array();
		foreach($rows as $row){
			$teacher=getTeacherFromClass($row['id']);
			$students=getStudentsFromClass($row['id']);
			$score_total = getClassTotalScore($row['id']);
			$size=count($students);
			$class_events = getStudentsEventsClass($row['id']);
			$exercises = getSetsIDFromClass($row['id']);
			$class = array("sets"=>$exercises, "name"=>$row['name'],"id"=>$row['id'],"score"=>$score_total,"numStd"=>$size,"students"=>$students, "teacher"=>$teacher[1], "classEvents"=>$class_events);
			$classes[] = $class;
		}

		//  print_r($classes);
		$smarty->assign("CLASSES",$classes);


		$smarty->display('common/header.tpl');
		$smarty->display('students/s_classes.tpl');
		$smarty->display('common/footer.tpl');
    
	}
	else
		header('Location: ../../index.php');

?>