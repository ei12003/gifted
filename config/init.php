<?php
	
	session_start();
	
	$BASE_DIR = "D:/Xampp/htdocs";
	$BASE_URL = "/gifted/";

	$CURRENT_PAGE = 'home';

	// DB //
	
	$conn = new PDO('sqlite:'.$BASE_DIR.$BASE_URL.'config/db.db');
	$conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	//$conn->exec('SET SCHEMA \'public\'');

	include_once($BASE_DIR.$BASE_URL. 'lib/smarty/Smarty.class.php');

	$smarty = new Smarty;
	$smarty->template_dir = $BASE_DIR.$BASE_URL . 'templates/';
	$smarty->compile_dir = $BASE_DIR.$BASE_URL . 'templates_c/';
	$smarty->assign('BASE_URL', $BASE_URL);
	$smarty->assign('CURRENT_PAGE',$CURRENT_PAGE);
if(isset($_SESSION['error_messages']))
	$smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);  
if(isset($_SESSION['field_errors']))
	$smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
if(isset($_SESSION['success_messages']))
	$smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
if(isset($_SESSION['form_values']))
	$smarty->assign('FORM_VALUES', $_SESSION['form_values']);

if(isset($_SESSION['username']))
	$smarty->assign('USERNAME', $_SESSION['username']);
else
	$smarty->assign('USERNAME', array());

if(isset($_SESSION['usertype']))
	$smarty->assign('USERTYPE', $_SESSION['usertype']);
else
	$smarty->assign('usertype', array());

if(isset($_SESSION['userid']))
	$smarty->assign('USERID', $_SESSION['userid']);
else
	$smarty->assign('USERID', array());
	
	
	//TOREMOVE
	//for testing purposes
 	//$smarty->assign('USERNAME', "BOB");
	//$smarty->assign('USERTYPE', "teacher");
	////

	
	unset($_SESSION['success_messages']);
	unset($_SESSION['error_messages']);  
	unset($_SESSION['field_errors']);
	unset($_SESSION['form_values']);
		
?>
