<?php /* Smarty version Smarty-3.1.15, created on 2014-12-09 17:57:37
         compiled from "D:\xampp\htdocs\\gifted\templates\common\navbar_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:211555485e6d7248d69-11644388%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '491097021c3c1b62b61706403c4c73f05a9ee9fa' => 
    array (
      0 => 'D:\\xampp\\htdocs\\\\gifted\\templates\\common\\navbar_logged_in.tpl',
      1 => 1418144255,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '211555485e6d7248d69-11644388',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5485e6d727aa25_58739039',
  'variables' => 
  array (
    'USERTYPE' => 0,
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5485e6d727aa25_58739039')) {function content_5485e6d727aa25_58739039($_smarty_tpl) {?><?php if ($_smarty_tpl->tpl_vars['USERTYPE']->value=='teacher') {?>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/teachers/t_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/teachers/t_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	
<?php } elseif ($_smarty_tpl->tpl_vars['USERTYPE']->value=='student') {?>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/students/s_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/students/s_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	<li><a id="navbar_color" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/students/s_store.php"><span class="glyphicon glyphicon-heart-empty"></span> Store</a></li>
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
