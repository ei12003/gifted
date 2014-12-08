<?php /* Smarty version Smarty-3.1.15, created on 2014-12-08 18:58:08
         compiled from "D:\xampp\htdocs\\gifted\templates\common\navbar_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:121845485e6b07b7812-45366113%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3d1935ae4a55231d1c78452d42c4160c8c0fe005' => 
    array (
      0 => 'D:\\xampp\\htdocs\\\\gifted\\templates\\common\\navbar_logged_out.tpl',
      1 => 1418061178,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '121845485e6b07b7812-45366113',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5485e6b07bba60_90946410',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5485e6b07bba60_90946410')) {function content_5485e6b07bba60_90946410($_smarty_tpl) {?><li class="dropdown" >
	<a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown">Log In<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form id="form_login" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/login.php" method="post" accept-charset="UTF-8" onsubmit="return check_empty_field()">
			<input type="text" placeholder="Username" id="login_username" name="username">
			<input type="password" placeholder="Password" id="login_password" name="password">
			<input class="btn btn-primary btn-block" type="submit" id="login" value="Log In">
		</form>
		<form action="register.php">
			<button class="btn btn-primary btn-block" id="register">Register</button>
		</form>
		
	</div>
</li><?php }} ?>
