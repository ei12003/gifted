<?php /* Smarty version Smarty-3.1.15, created on 2014-12-03 17:49:22
         compiled from "C:\xampp\htdocs\\gifted\templates\teachers\t_classes.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14395547755155b4546-71281971%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7d4f75a8fe8a9aeeacb6458162a35fd31d2da81b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\teachers\\t_classes.tpl',
      1 => 1417625361,
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
<?php if ($_valid && !is_callable('content_547755156df043_14662732')) {function content_547755156df043_14662732($_smarty_tpl) {?><div class="container">
    <h1>My Classes</h1>
	<?php  $_smarty_tpl->tpl_vars['class'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['class']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['CLASSES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['class']->key => $_smarty_tpl->tpl_vars['class']->value) {
$_smarty_tpl->tpl_vars['class']->_loop = true;
?>
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a  data-toggle="collapse" data-parent="#accordion" href="#<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
. <?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>
 (30 Students)</a>
					</h4>
				</div>
				<div id="<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="panel-collapse collapse">
					<div class="panel-body">					
						 <table class="table table-striped">
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
		</div>
	<?php } ?>
</div>

<?php }} ?>
