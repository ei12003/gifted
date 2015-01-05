<?php
	
	/*
	 * Page where a student can see classes.
     * A student can check all class sets of exercises, as well its events.
	 */
	
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
			$set_list = getSetsIDFromClass($row['id']);
			$exercises = array();
			foreach($set_list as $exercise){
				if(hasAnsweredSet($exercise['setId'],$_SESSION['userid'])){
					array_push($exercises,array('done'=> 1,'setId'=>$exercise['setId'],'name'=>$exercise['name'],'classId'=>$exercise['classId']));
				}
				else
					array_push($exercises,array('done'=> 0,'setId'=>$exercise['setId'],'name'=>$exercise['name'],'classId'=>$exercise['classId']));
			}	
			$class = array("sets"=>$exercises, "name"=>$row['name'],"id"=>$row['id'],"score"=>$score_total,"numStd"=>$size,"students"=>$students, "teacher"=>$teacher[0], "classEvents"=>$class_events);
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