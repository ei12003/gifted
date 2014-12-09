<?php /* Smarty version Smarty-3.1.15, created on 2014-12-09 19:34:16
         compiled from "D:\xampp\htdocs\\gifted\templates\teachers\t_classes.tpl" */ ?>
<?php /*%%SmartyHeaderCode:112235485e6dcb620f5-66281093%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4a8ac3764dc07df01023794992ac9a12674038d6' => 
    array (
      0 => 'D:\\xampp\\htdocs\\\\gifted\\templates\\teachers\\t_classes.tpl',
      1 => 1418149923,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '112235485e6dcb620f5-66281093',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5485e6dcb9d300_06246515',
  'variables' => 
  array (
    'CLASSES' => 0,
    'class' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5485e6dcb9d300_06246515')) {function content_5485e6dcb9d300_06246515($_smarty_tpl) {?><div class="container">
    <h1>My Classes</h1>
		<div class="panel-group">
		<?php  $_smarty_tpl->tpl_vars['class'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['class']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['CLASSES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['class']->key => $_smarty_tpl->tpl_vars['class']->value) {
$_smarty_tpl->tpl_vars['class']->_loop = true;
?>
			<div id="<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a  data-toggle="collapse" href="#content_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
. <?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>
 (30 Students) </a>
					</h4>
				</div>
				<div id="content_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="panel-collapse collapse">
					<div class="panel-body">	
		
						<input id= "searchStudents_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="searchStudents" type="text" style="height:33px;color:black;padding-left:10px;">
		
						<button id="add_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default addStundetnButton">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Student
						</button>
						
						<button id="rmv_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-danger pull-right rmvClassButton">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Class
						</button>
						
						<br><br>
					
						<table id="table_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="table table-striped table-condensed">
							<thead>
							  <tr>
								<th>#</th>
								<th>Name</th>
								<th>Score</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
								<td>1</td>
								<td>Anna</td>
								<td>111</td>
							  </tr>
							  <tr>
								<td>2</td>
								<td>Debbie</td>
								<td>111</td>
							  </tr>
							  <tr>
								<td>3</td>
								<td>John</td>
								<td>111</td>
							  </tr>
							</tbody>
						  </table>
						
					</div>
				</div>
			</div>
		<?php } ?>
		</div>
</div>



<?php }} ?>
