<?php

  /* The logged teacher associates to an existing set, an exercise with a question, four options and the correct one. */

  include_once('../config/init.php');
  include_once('../database/exercises.php');
  $error = "";
  
  if(isset($_SESSION['username'])
     && $_SESSION['usertype'] == "teacher"
     && isset($_GET['question'])
     && isset($_GET['op1'])
     && isset($_GET['op2'])
     && isset($_GET['op3'])
     && isset($_GET['op4'])
     && isset($_GET['correct'])
     && isset($_GET['setid']) ){

  	
  	if(hasStudentAnsweredSet($_GET['setid'])==1)
  		echo json_encode(array(false, "You can't add more exercises because a student has already answered this set."));

	else{
		$exeid = createExercise($_GET['question']);	

		if($exeid<1)
			echo json_encode(array(false, "Error creating exercise."));
		else{
			$ops = array();	

			for($i=1;$i<5;$i++){
				$op = createOption($exeid,$_GET['op'.$i]);
				if($op<1){
					$error = "Error creating option ".$id;
					break;
				}
				$ops['op'.$i] = $op;
			}

			$row = setRightAnswer($exeid,$ops[$_GET['correct']]);

			if( $row < 1 )
				$error = "Error setting right answer.";

			$row = addExerciseToSet($exeid,$_GET['setid']);

			if($row<1)
				$error = "Error setting right answer.";
			

			if(strlen($error)>0)
				echo json_encode(array(false, $error));		
			else
				echo json_encode(array(true, $exeid));	
		}
	}
	
  }
  else
	echo json_encode(array(false, "Unauthorized"));
 
?>