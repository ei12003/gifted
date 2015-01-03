<?php
  include_once('../config/init.php');
  include_once('../database/avatar.php');
  include_once('../database/members.php');


  if(isset($_SESSION['userid']) 
  	&& $_SESSION['usertype'] == "student"
  	&& isset($_POST['skincolor'])
    && isset($_POST['shirt'])
    && isset($_POST['eyecolor']))
  {

  print_r($_POST) ;
  print_r($_SESSION) ;

  $memberId = $_SESSION['userid'];
  
  if($_POST['skincolor'] != 0)
    $part0 = $_POST['skincolor'];
  else
    $part0 = NULL;

  if($_POST['shirt'] != 0)
    $part1 = $_POST['shirt'];
  else
    $part1 = NULL;

  if($_POST['eyecolor'] != 0)
    $part2 = $_POST['eyecolor'];
  else
    $part2 = NULL;


  avatarSelection($memberId,$part0,$part1,$part2);

 if (!empty($_SERVER['HTTP_REFERER']))
        header("Location: ".$_SERVER['HTTP_REFERER']);
        //echo "back";
      else
        //echo "home";
        header("Location: ../index.php"); 
    

  }

    else
	header("Location: ../index.php");

?>