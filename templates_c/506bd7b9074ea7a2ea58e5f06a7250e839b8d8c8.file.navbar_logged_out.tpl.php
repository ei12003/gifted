<?php /* Smarty version Smarty-3.1.15, created on 2014-12-03 13:19:56
         compiled from "C:\xampp\htdocs\\gifted\templates\common\navbar_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:171275474dbc6acedc6-49907336%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '506bd7b9074ea7a2ea58e5f06a7250e839b8d8c8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\common\\navbar_logged_out.tpl',
      1 => 1417603533,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '171275474dbc6acedc6-49907336',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5474dbc6b2fc01_72324460',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5474dbc6b2fc01_72324460')) {function content_5474dbc6b2fc01_72324460($_smarty_tpl) {?><li class="dropdown" >
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
