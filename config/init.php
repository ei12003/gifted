<?php
	session_set_cookie_params(3600, '/~ldso');
	session_start();

	$BASE_DIR = 'C:/Bitnami/wappstack-5.4.34-0/apps/demo/htdocs/';
	$BASE_URL = '/demo/';
	$CURRENT_PAGE = 'home';

	// DB //
	
	$conn = new PDO('sqlite:'.$BASE_DIR.$BASE_URL.'config/db.db');
	$conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	//$conn->exec('SET SCHEMA \'public\'');

	include_once($BASE_DIR . 'lib/smarty/Smarty.class.php');

	$smarty = new Smarty;
	$smarty->template_dir = $BASE_DIR . 'templates/';
	$smarty->compile_dir = $BASE_DIR . 'templates_c/';
	$smarty->assign('BASE_URL', $BASE_URL);
	$smarty->assign('CURRENT_PAGE',$CURRENT_PAGE);

	$smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);  
	$smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
	$smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
	$smarty->assign('FORM_VALUES', $_SESSION['form_values']);
	$smarty->assign('USERNAME', $_SESSION['username']);
	$smarty->assign('USERTYPE', $_SESSION['usertype']);
	$smarty->assign('USERID', $_SESSION['userid']);
	
	
	//TOREMOVE
	//for testing purposes
 	$smarty->assign('USERNAME', "BOB");
	$smarty->assign('USERTYPE', "teacher");
	////
	
	
	unset($_SESSION['success_messages']);
	unset($_SESSION['error_messages']);  
	unset($_SESSION['field_errors']);
	unset($_SESSION['form_values']);
?>
