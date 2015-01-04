<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:43:58
         compiled from "C:\Xampp\htdocs\gifted\templates\common\avatar.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2300154a83e039b93b7-75638611%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4c114c63402c22b7f3630eb5e039c1f1a8fbf759' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\avatar.tpl',
      1 => 1420389451,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2300154a83e039b93b7-75638611',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83e03a05ef4_34591657',
  'variables' => 
  array (
    'AVATARCHOICES' => 0,
    'SHOWPROFILE' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83e03a05ef4_34591657')) {function content_54a83e03a05ef4_34591657($_smarty_tpl) {?><?php if (isset($_smarty_tpl->tpl_vars['AVATARCHOICES']->value)) {?>
<script>
$(document).ready(function () {

                    
$('.popoverOption').popover({ trigger: "hover",html:"true"});

var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

var default_img = new Image();
default_img.src = "<?php if (!isset($_smarty_tpl->tpl_vars['SHOWPROFILE']->value)) {?>../<?php }?>../img/default.png";
default_img.onload = function() {
    ctx.drawImage(default_img, 0, 0);
	<?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part0']!=null) {?>
	var part0 = new Image();
	part0.src = "<?php if (!isset($_smarty_tpl->tpl_vars['SHOWPROFILE']->value)) {?>../<?php }?>../img/<?php echo $_smarty_tpl->tpl_vars['AVATARCHOICES']->value['ipart0'];?>
";
	part0.onload = function() {
	    ctx.drawImage(part0, 0, 0);
	};
	<?php }?>
	<?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part1']!=null) {?>
	var part1 = new Image();
	part1.src = "<?php if (!isset($_smarty_tpl->tpl_vars['SHOWPROFILE']->value)) {?>../<?php }?>../img/<?php echo $_smarty_tpl->tpl_vars['AVATARCHOICES']->value['ipart1'];?>
";
	part1.onload = function() {
	    ctx.drawImage(part1,  50, 110);
	};
	<?php }?>
	<?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part2']!=null) {?>
	var part2 = new Image();
	part2.src = "<?php if (!isset($_smarty_tpl->tpl_vars['SHOWPROFILE']->value)) {?>../<?php }?>../img/<?php echo $_smarty_tpl->tpl_vars['AVATARCHOICES']->value['ipart2'];?>
";
	part2.onload = function() {
	    ctx.drawImage(part2,  50, 25);
	};

	<?php }?>

};






});
</script>
<canvas style="padding-left: 0;    padding-right: 0;    margin-left: auto;    margin-right: auto;    display: block;" width="200" height="300" id="canvas"></canvas>
<?php }?><?php }} ?>
