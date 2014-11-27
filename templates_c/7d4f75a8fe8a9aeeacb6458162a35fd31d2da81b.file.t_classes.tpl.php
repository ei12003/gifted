<?php /* Smarty version Smarty-3.1.15, created on 2014-11-27 17:45:09
         compiled from "C:\xampp\htdocs\\gifted\templates\teachers\t_classes.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14395547755155b4546-71281971%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7d4f75a8fe8a9aeeacb6458162a35fd31d2da81b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\teachers\\t_classes.tpl',
      1 => 1416946678,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14395547755155b4546-71281971',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CLASSES' => 0,
    'class' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_547755156df043_14662732',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_547755156df043_14662732')) {function content_547755156df043_14662732($_smarty_tpl) {?> <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">My Classes</div>
      
      <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Classes</th>
            <th>N. Of Students</th>
          </tr>
        </thead>
 
        <tbody>
          <?php  $_smarty_tpl->tpl_vars['class'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['class']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['CLASSES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['class']->key => $_smarty_tpl->tpl_vars['class']->value) {
$_smarty_tpl->tpl_vars['class']->_loop = true;
?>
          <tr>
            <td class="classid"><?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
</td>
            <td class="classid"><?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>
</td>
            <td class="classid"><?php echo $_smarty_tpl->tpl_vars['class']->value['numStd'];?>
</td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
 
  </div>
<?php }} ?>
