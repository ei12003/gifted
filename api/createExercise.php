<?php
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

  	/*http://localhost/gifted/api/createSet.php?question=question1&op1=option1&op2=option2&op3=option3&op4=option4&correct=op2&setid=52

  	*/

	$exeid = createExercise($_GET['question']);	

	if($exeid<1)
		//header('HTTP/1.1 404');
		echo json_encode(array(false, "Error creating exercise."));
	else{
		//header('HTTP/1.1 200');
		//question / op1 / op2 / op3 / op4 / correct / setid

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
  else
	//header('HTTP/1.1 404');
	echo json_encode(array(false, "Unauthorized"));
 
?>