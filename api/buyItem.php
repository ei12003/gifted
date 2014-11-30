<?php
  include_once('../config/init.php');
  include_once('../database/store.php');

  if(isset($_SESSION['username'])
    && isset($_GET['itemid'])){

  if(isset($_GET['offer_userid']))
    $row = buyItem($_SESSION['userid'],$_GET['itemid'],$_GET['offer_userid']);
  else
    $row = buyItem($_SESSION['userid'],$_GET['itemid'],0);

	if($row==-1)
		header('HTTP/1.1 404');
	else{
		header('HTTP/1.1 200');
	}

  }
  else
	header('HTTP/1.1 404');
 
?>