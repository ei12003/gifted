<?php /* Smarty version Smarty-3.1.15, created on 2015-01-03 22:42:47
         compiled from "C:\Xampp\htdocs\gifted\templates\teachers\t_classes.tpl" */ ?>
<?php /*%%SmartyHeaderCode:823754a86257e25f85-75595582%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6fb23be7bcc6bcf02f8e1180519c8ccf9a55ad45' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\teachers\\t_classes.tpl',
      1 => 1420242276,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '823754a86257e25f85-75595582',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CLASSES' => 0,
    'class' => 0,
    'student' => 0,
    'set' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a86258008723_33103684',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a86258008723_33103684')) {function content_54a86258008723_33103684($_smarty_tpl) {?><div class="container">
    <h1>My Classes</h1>
	
		<button id="createClass" type="button" class="btn btn-lg btn-success" style="margin-bottom:20px;">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Class
		</button>
		
		<div id="classPanelGroup" class="panel-group">
		<?php  $_smarty_tpl->tpl_vars['class'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['class']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['CLASSES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['class']->key => $_smarty_tpl->tpl_vars['class']->value) {
$_smarty_tpl->tpl_vars['class']->_loop = true;
?>
			<div id="<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<span style="padding:10px;pointer-events: none;" class="pull-right"><i style="font-size:80%;">Score:</i> <span id="classscore_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['class']->value['score'];?>
</span></span>
						<a  data-toggle="collapse" href="#content_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
. <?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>
<i style="font-size:80%;"><br><span id="classCount_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['class']->value['numStd'];?>
</span> Student(s)</i> </a>
					</h4>
				</div>
				<div id="content_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="panel-collapse collapse">
					<div class="panel-body">	
		
						<select id= "searchStudents_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="select2 searchStudents" style="width:250px">
							<option value=""></option>

						</select>
	
						<button id="add_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default addStudentButton">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Student
						</button>
						
						<button id="rmv_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-danger pull-right rmvClassButton">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Class
						</button>
						
						
						
						<br><br>
						



						<table id="table_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="table table-striped table-condensed table-bordered studentTable">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Score</th>
								</tr>
							</thead>
							<tbody>
							
								<?php  $_smarty_tpl->tpl_vars['student'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['student']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['class']->value['students']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['student']->key => $_smarty_tpl->tpl_vars['student']->value) {
$_smarty_tpl->tpl_vars['student']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['student']->value['id'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['student']->value['first_name'];?>
 <?php echo $_smarty_tpl->tpl_vars['student']->value['last_name'];?>
</td>
									<td id="score_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
_<?php echo $_smarty_tpl->tpl_vars['student']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['student']->value['score'];?>
</td>
								</tr>
								
								<?php } ?>
							  
							</tbody>
						</table>
						
						
						
						<select id= "searchSets_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="select2Sets searchSets pull-right" style="width:250px">
							<option value=""></option>
<!-- 							<option value="18">18. Richard Riley</option>
							<option value="19">19. Jason Coleman</option>
							<option value="20">20. Kathryn Frazier</option>
							<option value="21">21. Arthur Lewis</option>
							<option value="23">23. Sandra Perez</option> -->
						</select>


						<button id="addset_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default addSetButton pull-right">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Set
						</button>
				

						<button id="set_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default pull-left setButton setButton_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="margin-bottom:20px">
							<span id="set_glyph_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <span id="set_text_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">Show Sets</span>
						</button>
						<button id="set_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default pull-left setButton setButton_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="display:none;margin-bottom:20px">
							<span id="set_glyph_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="glyphicon glyphicon-zoom-out" aria-hidden="true"></span> <span id="set_text_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">Hide Sets</span>
						</button>

						

						<?php if (count($_smarty_tpl->tpl_vars['class']->value['sets'])>0) {?>
						<table id="table_set_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="display:none;" class="table table-striped table-condensed table-bordered setsTable">
							<tbody>
							
								<?php  $_smarty_tpl->tpl_vars['set'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['set']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['class']->value['sets']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['set']->key => $_smarty_tpl->tpl_vars['set']->value) {
$_smarty_tpl->tpl_vars['set']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['set']->value['setId'];?>
.<?php echo $_smarty_tpl->tpl_vars['set']->value['name'];?>
</td>
								</tr>
								<?php } ?>							
							</tbody>
						</table>
						<?php } else { ?>
						<table id="table_set_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="display:none;" class="table table-striped table-condensed table-bordered setsTable">
							<tbody>
													
							</tbody>
						</table>
						<?php }?>



					</div>
				</div>
			</div>
		<?php } ?>
		</div>
</div>


<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/t_classes.js"></script>
<?php }} ?>
