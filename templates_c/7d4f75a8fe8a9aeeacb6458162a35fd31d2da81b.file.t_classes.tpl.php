<?php /* Smarty version Smarty-3.1.15, created on 2014-12-03 14:21:48
         compiled from "C:\xampp\htdocs\\gifted\templates\teachers\t_classes.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14395547755155b4546-71281971%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7d4f75a8fe8a9aeeacb6458162a35fd31d2da81b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\teachers\\t_classes.tpl',
      1 => 1417612907,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14395547755155b4546-71281971',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_547755156df043_14662732',
  'variables' => 
  array (
    'CLASSES' => 0,
    'class' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_547755156df043_14662732')) {function content_547755156df043_14662732($_smarty_tpl) {?> <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading" >My Classes</div>
      
     <div id="OrderPackages">
    <table id="tableSearchResults" class="table table-hover  table-striped table-condensed">
        <thead>
            <tr>
                <th>Class ID</th>
                <th>Class Name</th>
				<th>N. of Students</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
			<?php  $_smarty_tpl->tpl_vars['class'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['class']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['CLASSES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['class']->key => $_smarty_tpl->tpl_vars['class']->value) {
$_smarty_tpl->tpl_vars['class']->_loop = true;
?>
				<tr class="accordion-toggle" data-toggle="collapse" data-parent="#OrderPackages" data-target=".<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
					<td><?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
</td>
					<td><?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>
</td>
					<td><i class="indicator glyphicon glyphicon-chevron-up pull-right"></i>

					</td>
				</tr>
				<tr>
					<td colspan="<?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>
" class="hiddenRow">
						<div class="accordion-body collapse <?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" id="accordion1">
							<table>
								<tr>
									<td>Ze Manel</td>
								</tr>
								<tr>
									<td>Rui</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			<?php } ?>
        </tbody>
    </table>
</div>
 
  </div>
  
<?php }} ?>
