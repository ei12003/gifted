<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:43:58
         compiled from "C:\Xampp\htdocs\gifted\templates\common\navbar_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1948854a83e0385cca5-13348542%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fe66b305017b410e18807464c533aacb07967614' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\navbar_logged_in.tpl',
      1 => 1420388992,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1948854a83e0385cca5-13348542',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83e038f8ea7_34769636',
  'variables' => 
  array (
    'USERTYPE' => 0,
    'BASE_URL' => 0,
    'USERPOINTS' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83e038f8ea7_34769636')) {function content_54a83e038f8ea7_34769636($_smarty_tpl) {?><style>
.yellow{
	color: #DAA520;
}
</style>

<?php if ($_smarty_tpl->tpl_vars['USERTYPE']->value=='teacher') {?>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/teachers/t_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/teachers/t_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	
<?php } elseif ($_smarty_tpl->tpl_vars['USERTYPE']->value=='student') {?>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/students/s_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/students/s_store.php"><span class="glyphicon glyphicon-heart-empty"></span> Store <span style="color:yellow" class="header_userpts"><?php echo $_smarty_tpl->tpl_vars['USERPOINTS']->value;?>
 pts</span></a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/students/s_inventory.php"><span class="glyphicon glyphicon-star"></span> Inventory</a></li>
<?php }?>

<li class="dropdown" >
	<a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>
<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/profile.php">
			<button class="btn btn-primary btn-block btn-log" id="logout">Edit Profile</button>
		</form>
		<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/logout.php">
			<button class="btn btn-primary btn-block btn-log" id="logout">Logout</button>
		</form>
	</div>
</li><?php }} ?>
