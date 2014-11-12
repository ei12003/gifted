<?php
  //session_set_cookie_params(3600, '/~lbaw1354');
  session_start();

  $BASE_DIR = '/'; //FIXME
  $BASE_URL = '/~lbaw1354/final/'; //FIXME
  $SERVER = 'http://gnomo.fe.up.pt';

  $conn = new PDO('sqlite:db.db'); //FIXME
  $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 // $conn->exec('SET SCHEMA \'proto\''); //FIXME

  include_once($BASE_DIR . 'lib/smarty/Smarty.class.php');
  
  $smarty = new Smarty;
  $smarty->template_dir = $BASE_DIR . 'templates/';
  $smarty->compile_dir = $BASE_DIR . 'templates_c/';
  $smarty->assign('BASE_URL', $BASE_URL);
  
  $smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);  
  $smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
  $smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
  $smarty->assign('FORM_VALUES', $_SESSION['form_values']);
  $smarty->assign('LOGIN', $_SESSION['login']);
  $smarty->assign('AVATAR_URL', $_SESSION['avatar_url']);

if(isset($_SESSION['privileges']))
  if($_SESSION['privileges']=="Administrator")
    $smarty->assign('ADMINISTRATOR', $_SESSION['login']);
  else if($_SESSION['privileges']=="Moderator")
    $smarty->assign('MODERATOR', $_SESSION['login']);
  else if($_SESSION['privileges']=="Member")
    $smarty->assign('MEMBER', $_SESSION['login']);
  
  unset($_SESSION['success_messages']);
  unset($_SESSION['error_messages']);  
  unset($_SESSION['field_errors']);
  unset($_SESSION['form_values']);
?>
