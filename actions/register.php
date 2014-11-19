<?php
include_once('../config/init.php');
include_once('../database/members.php');

if (!isset($_SESSION['login'])){
	if (isset($_POST['username']) && strlen($_POST['username'])>0) {
		createMember();
	}		
}
	header("Location: ".$BASE_URL);
?>