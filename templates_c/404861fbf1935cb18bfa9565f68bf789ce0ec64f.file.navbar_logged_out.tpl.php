<?php /* Smarty version Smarty-3.1.15, created on 2014-11-18 14:45:34
         compiled from "C:\Bitnami\wappstack-5.4.34-0\apps\demo\htdocs\templates\common\navbar_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19186546bc0ba9ed355-83098412%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '404861fbf1935cb18bfa9565f68bf789ce0ec64f' => 
    array (
      0 => 'C:\\Bitnami\\wappstack-5.4.34-0\\apps\\demo\\htdocs\\templates\\common\\navbar_logged_out.tpl',
      1 => 1416350708,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19186546bc0ba9ed355-83098412',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_546bc0ba9ee291_29961666',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_546bc0ba9ee291_29961666')) {function content_546bc0ba9ee291_29961666($_smarty_tpl) {?><li class="dropdown" >
	<a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown">Log In<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form id="form_login" action="login.php" method="post" accept-charset="UTF-8" onsubmit="return check_empty_field()">
			<input type="text" placeholder="Username" id="login_username" name="username">
			<input type="password" placeholder="Password" id="login_password" name="password">
			<input class="btn btn-primary btn-block" type="submit" id="login" value="Log In">
		</form>
		<form action="register.php">
			<button class="btn btn-primary btn-block" id="register">Register</button>
		</form>
		
	</div>
</li><?php }} ?>
