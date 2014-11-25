<?php /* Smarty version Smarty-3.1.15, created on 2014-11-25 20:40:23
         compiled from "C:\xampp\htdocs\\gifted\templates\common\navbar_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:128055474d4a97fdb98-92114247%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ad36bcbdde4a6cc760f2644a89819e23f62b4a30' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\common\\navbar_logged_in.tpl',
      1 => 1416943372,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '128055474d4a97fdb98-92114247',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5474d4a98253a4_93797698',
  'variables' => 
  array (
    'USERTYPE' => 0,
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5474d4a98253a4_93797698')) {function content_5474d4a98253a4_93797698($_smarty_tpl) {?><?php if ($_smarty_tpl->tpl_vars['USERTYPE']->value=='teacher') {?>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/teachers/t_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/teachers/t_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	
<?php } elseif ($_smarty_tpl->tpl_vars['USERTYPE']->value=='student') {?>
	<li><a id="navbar_color" href=""><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href=""><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	<li><a id="navbar_color" href=""><span class="glyphicon glyphicon-heart-empty"></span> Store</a></li>
<?php }?>

<li class="dropdown" >
	<a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>
<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/profile.php">
			<button class="btn btn-primary btn-block" id="logout">Edit Profile</button>
		</form>
		<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/logout.php">
			<button class="btn btn-primary btn-block" id="logout">Logout</button>
		</form>
	</div>
</li><?php }} ?>
