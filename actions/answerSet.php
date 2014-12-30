<?php
  include_once('../config/init.php');
  include_once('../database/members.php');
  include_once('../database/exercises.php');

if(isset($_SESSION['username']) 
  	&& $_SESSION['usertype'] == "student"
  	&& isset($_GET['setid'])
    && isset($_GET['classid'])){

$row =1;


  $setid = $_GET['setid'];
  $classid = $_GET['classid'];
  
  if(isSetFromClass($classid,$setid)==0)
    header('Location: ../index.php');


  $count_points = 0;
  $list_ex = getSet($setid);

  if(count($list_ex) != (count($_GET)-2))
    header('Location: ../index.php');

  $answers = array();
  $corrects = array();
  foreach($list_ex as $ex){
    $answer = array();
    $exe_id=$ex['exid'];
    if(!isset($_GET['exid_'.$exe_id]))
      header('Location: ../index.php');

    $user_opt = $_GET['exid_'.$exe_id];
    if(isOptionFromExercise($exe_id,$user_opt)==0)
      header('Location: ../index.php');


    $correct = getRightAnswer($exe_id);

    if($correct == $user_opt)
      $count_points += getExPoints($exe_id);

    $answer['exeid'] = $exe_id;
    $answer['optid'] = $user_opt;

    array_push($answers,$answer);
    array_push($corrects,array($exe_id,$correct));
  }

  print_r($answers);
  echo '<br>';
  print_r($corrects);
  echo '<br>'.$count_points.'<br>';


  addPointsToStudent($count_points,$_SESSION['userid'],$classid);

  $id = addMemberAnswer($setid,$classid,$_SESSION['userid'],$count_points);
  $_SESSION['userpoints'] = getUserPoints($_SESSION['userid']);

  foreach($answers as $answer)
    addMemberAnswersOption($id,$answer['exeid'],$answer['optid']);
  if (!empty($_SERVER['HTTP_REFERER']))
        header("Location: ".$_SERVER['HTTP_REFERER']);
	//$row = givePointsToUser($_GET['amount'],$_GET['classid'],$_GET['userid']);


  }
  else
	echo json_encode(array(false, "Unauthorized."));
 
?>