<?php
  /*
   * The logged student buys a item for himself or to offer someone else .
   * If either '$_GET['offer_userid']'' or '$_GET['offer_username']' exists, then the item is to be offered.
  */

  include_once('../config/init.php');
  include_once('../database/store.php');
  include_once('../database/members.php');


  $error_str = "Unauthorized.";
  if(isset($_SESSION['username'])
    && isset($_GET['itemid'])){

  if(isset($_GET['offer_userid']))
    $row = buyItem($_SESSION['userid'],$_GET['itemid'],$_GET['offer_userid']);
  else if(isset($_GET['offer_username']))
  {
    $username = $_GET['offer_username'];
    $id = getUserByUsername($username);
    if($id==null){
      $row = -1;
      $error_str = "That username does not exist.";
    }
    else
      $row = buyItem($_SESSION['userid'],$_GET['itemid'],$id);
  }
  else
    $row = buyItem($_SESSION['userid'],$_GET['itemid'],0);

	if($row==-1)
		echo json_encode(array(false, "Not enough points."));
	else{
		echo json_encode(array(true, "Success."));
	}

  }
  else
	echo json_encode(array(false, $error_str));
 
?>