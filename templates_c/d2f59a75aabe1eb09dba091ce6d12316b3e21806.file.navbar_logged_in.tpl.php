<?php /* Smarty version Smarty-3.1.15, created on 2014-11-19 04:31:20
         compiled from "C:\Bitnami\wappstack-5.4.34-0\apps\demo\htdocs\templates\common\navbar_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19681546bc3c6087c38-93579302%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd2f59a75aabe1eb09dba091ce6d12316b3e21806' => 
    array (
      0 => 'C:\\Bitnami\\wappstack-5.4.34-0\\apps\\demo\\htdocs\\templates\\common\\navbar_logged_in.tpl',
      1 => 1416400232,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19681546bc3c6087c38-93579302',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_546bc3c608c461_35964848',
  'variables' => 
  array (
    'USERTYPE' => 0,
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_546bc3c608c461_35964848')) {function content_546bc3c608c461_35964848($_smarty_tpl) {?><?php if ($_smarty_tpl->tpl_vars['USERTYPE']->value=='teacher') {?>
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
pages/logout.php">
			<button class="btn btn-primary btn-block" id="logout">Logout</button>
		</form>
	</div>
</li><?php }} ?>
