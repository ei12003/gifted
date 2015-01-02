<?php
  include_once('../config/init.php');
  include_once('../database/avatar.php');

  if(isset($_SESSION['userid']) 
  	&& $_SESSION['usertype'] == "student"
  	&& isset($_POST['skincolor'])
    && isset($_POST['shirt'])
    && isset($_POST['eyecolor']))
  {

  $memberId = $_SESSION['userid'];
  $part0 = $_POST['skincolor'];
  $part1 = $_POST['shirt'];
  $part2 = $_POST['eyecolor'];

  avatarselection($memberId,$part0,$part1,$part2);


  }

    else
	echo json_encode(array(false, "Unauthorized."));

?>