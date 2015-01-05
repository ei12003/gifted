<?php /* Smarty version Smarty-3.1.15, created on 2015-01-05 15:18:23
         compiled from "C:\Xampp\htdocs\gifted\templates\teachers\t_exercises.tpl" */ ?>
<?php /*%%SmartyHeaderCode:426554a970e1c202a3-75086273%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6a1527204809ffbdc8d502a79ef68022c7a84a7d' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\teachers\\t_exercises.tpl',
      1 => 1420467493,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '426554a970e1c202a3-75086273',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a970e1e8c938_55090133',
  'variables' => 
  array (
    'SETS' => 0,
    'set' => 0,
    'num' => 0,
    'ex' => 0,
    'c' => 0,
    'opt' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a970e1e8c938_55090133')) {function content_54a970e1e8c938_55090133($_smarty_tpl) {?><div class="container">
	<h1>My Exercises</h1>

	<button id="createSet" type="button" class="btn btn-lg btn-success" style="margin-bottom:20px;">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Exercise Set
	</button>
	
	<?php if (count($_smarty_tpl->tpl_vars['SETS']->value)==0) {?>
		<h3 class="noexerc" style="padding-top:50px;">
			You currently have no exercise sets created.
		</h3>
	<?php }?>

	<div id="setPanelGroup" class="panel-group">
		<?php  $_smarty_tpl->tpl_vars['set'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['set']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['SETS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['set']->key => $_smarty_tpl->tpl_vars['set']->value) {
$_smarty_tpl->tpl_vars['set']->_loop = true;
?>
			<div id="<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a  data-toggle="collapse" href="#content_<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
. <?php echo $_smarty_tpl->tpl_vars['set']->value['name'];?>
<?php if ($_smarty_tpl->tpl_vars['set']->value['lock']==1) {?><span class="glyphicon glyphicon-lock pull-right" title="You can't add/edit exercises because a student has already answered this set."></span><?php }?><i style="font-size:80%;"><br><span id="setCount_<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['set']->value['numEx'];?>
</span> Exercise(s)</i></a>
					</h4>
				</div>
				<div id="content_<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
" class="panel-collapse collapse">
					<div class="panel-body">

					<?php if ($_smarty_tpl->tpl_vars['set']->value['lock']==0) {?>
					<button id="add_button_<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
" type="button" class="btn btn-default addExerciseButton" data-toggle="modal" data-target="#createEx">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Exercise
					</button>
					<?php }?>
					
					<button id="rmv_button_<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
" type="button" class="btn btn-danger pull-right rmvSetButton">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Set
					</button>
					<br><br>
					
					<div id="exercisePanelGroup<?php echo $_smarty_tpl->tpl_vars['set']->value['id'];?>
" class="panel-group">
					<?php $_smarty_tpl->tpl_vars['num'] = new Smarty_variable(0, null, 0);?>
					<?php  $_smarty_tpl->tpl_vars['ex'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ex']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['set']->value['exercises']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ex']->key => $_smarty_tpl->tpl_vars['ex']->value) {
$_smarty_tpl->tpl_vars['ex']->_loop = true;
?>
					<?php $_smarty_tpl->tpl_vars['num'] = new Smarty_variable($_smarty_tpl->tpl_vars['num']->value+1, null, 0);?>
						<div id="ex<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" href="#ex_content_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['ex']->value['name'];?>
</a>
								</h4>
							</div>
							<div id="ex_content_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" class="panel-collapse collapse">
								<div class="panel-body">
								
									<?php if ($_smarty_tpl->tpl_vars['set']->value['lock']==0) {?>
									<button id="edit_ex_button_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" type="button" class="btn btn-sm btn-default editExerciseButton" data-toggle="modal" data-target="#editEx">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
									</button>
									
									
									<button id="delete_ex_button_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" type="button" class="btn btn-sm btn-danger pull-right deleteExerciseButton">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete
									</button>
									
									<br><br>
									<?php }?>
								
									<?php $_smarty_tpl->tpl_vars['c'] = new Smarty_variable(0, null, 0);?>
									<?php  $_smarty_tpl->tpl_vars['opt'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['opt']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ex']->value['ops']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['opt']->key => $_smarty_tpl->tpl_vars['opt']->value) {
$_smarty_tpl->tpl_vars['opt']->_loop = true;
?>
										<?php $_smarty_tpl->tpl_vars['c'] = new Smarty_variable($_smarty_tpl->tpl_vars['c']->value+1, null, 0);?>
										<span style="color:black;"><?php echo $_smarty_tpl->tpl_vars['c']->value;?>
.  <?php echo $_smarty_tpl->tpl_vars['opt']->value['description'];?>
<?php if ($_smarty_tpl->tpl_vars['opt']->value['optid']==$_smarty_tpl->tpl_vars['ex']->value['correct']) {?><span class="glyphicon glyphicon-ok"></span><?php }?></span><br>
									<?php } ?>
								</div>
							</div>
						</div>
					<?php } ?>
					</div>
					
					</div>
				</div>
		
			</div>
		<?php } ?>
	</div> 
	
	
	<div id="createEx" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Create Exercise</h4>
			</div>
			<div class="modal-body">
					
					<div class="input-group">
						<span class="input-group-addon label-warning" style="color:white;" aria-describedby="basic-addon2">Question</span>
						<input id="question" type="text" class="form-control" placeholder="Question" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 1
							<input id="op1" style="margin-left:20px;" type="checkbox" class="radioStyle radio1">
						</span>
						<input id="opt1" type="text" class="form-control" placeholder="Option 1" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 2
							<input id="op2" style="margin-left:20px;" type="checkbox" class="radioStyle radio1">
						</span>
						<input id="opt2" type="text" class="form-control" placeholder="Option 2" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 3
							<input id="op3" style="margin-left:20px;" type="checkbox" class="radioStyle radio1">
						</span>
						<input id="opt3" type="text" class="form-control" placeholder="Option 3" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 4
							<input id="op4" style="margin-left:20px;" type="checkbox" class="radioStyle radio1">
						</span>
						<input id="opt4" type="text" class="form-control" placeholder="Option 4" aria-describedby="basic-addon2">
						
					</div><br>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button id="createExerciseButton" type="button" class="btn btn-primary">Create</button>
			</div>
		</div>
	  </div>
	</div>
	
	<div id="editEx" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Edit Exercise</h4>
			</div>
			<div class="modal-body">
					
					<div class="input-group">
						<span class="input-group-addon label-warning" style="color:white;" aria-describedby="basic-addon2">Question</span>
						<input id="e_question" type="text" class="form-control" placeholder="Question" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 1
							<input id="e_op1" style="margin-left:20px;" type="checkbox" class="radioStyle radio2">
						</span>
						<input id="e_opt1" type="text" class="form-control" placeholder="Option 1" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 2
							<input id="e_op2" style="margin-left:20px;" type="checkbox" class="radioStyle radio2">
						</span>
						<input id="e_opt2" type="text" class="form-control" placeholder="Option 2" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 3
							<input id="e_op3" style="margin-left:20px;" type="checkbox" class="radioStyle radio2">
						</span>
						<input id="e_opt3" type="text" class="form-control" placeholder="Option 3" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 4
							<input id="e_op4" style="margin-left:20px;" type="checkbox" class="radioStyle radio2">
						</span>
						<input id="e_opt4" type="text" class="form-control" placeholder="Option 4" aria-describedby="basic-addon2">
						
					</div><br>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button id="saveExerciseButton" type="button" class="btn btn-primary">Save</button>
			</div>
		</div>
	  </div>
	</div>
	
	

	

</div>

<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/t_exercises.js"></script><?php }} ?>
