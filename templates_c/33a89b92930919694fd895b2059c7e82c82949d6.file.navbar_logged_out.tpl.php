<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:53:13
         compiled from "C:\Xampp\htdocs\gifted\templates\common\navbar_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:117154a83f24854b32-54722606%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '33a89b92930919694fd895b2059c7e82c82949d6' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\navbar_logged_out.tpl',
      1 => 1420388992,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '117154a83f24854b32-54722606',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83f24a61187_67372104',
  'variables' => 
  array (
    'ERROR_MESSAGES' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83f24a61187_67372104')) {function content_54a83f24a61187_67372104($_smarty_tpl) {?><?php if (isset($_smarty_tpl->tpl_vars['ERROR_MESSAGES']->value)) {?>
<script type="text/javascript">
bootbox.alert("<?php echo $_smarty_tpl->tpl_vars['ERROR_MESSAGES']->value;?>
");
</script>
<?php }?>

<li class="dropdown" >
	<a class="dropdown-toggle" href="#" data-toggle="dropdown">Log In<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form id="form_login" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/login.php" method="post" accept-charset="UTF-8" onsubmit="return check_empty_field()">
			<input class="form-control" type="text" placeholder="Username" id="login_username" name="username" style="min-width:200px;">
			<input class="form-control" type="password" placeholder="Password" id="login_password" name="password">
			<input class="btn btn-log btn-block" type="submit" id="login" value="Log In">
		</form>
		<form action="register.php">
			<button class="btn btn-reg btn-block" id="register">Register</button>
		</form>
		
	</div>
</li><?php }} ?>
