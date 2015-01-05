<?php /* Smarty version Smarty-3.1.15, created on 2015-01-05 15:19:42
         compiled from "C:\Xampp\htdocs\gifted\templates\students\s_exercise.tpl" */ ?>
<?php /*%%SmartyHeaderCode:368554aa9d7e8af978-49080290%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4720263145af7ac0b06ca346ca888f5cf8d248d2' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\students\\s_exercise.tpl',
      1 => 1420242276,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '368554aa9d7e8af978-49080290',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'ANSWERED' => 0,
    'fa' => 0,
    'CLASSID' => 0,
    'SET' => 0,
    'ex' => 0,
    'c' => 0,
    'opt' => 0,
    'STUDENT_ANSWERS' => 0,
    'answer' => 0,
    'check' => 0,
    'useropt' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54aa9d7ea2ed70_18570024',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54aa9d7ea2ed70_18570024')) {function content_54aa9d7ea2ed70_18570024($_smarty_tpl) {?><div class="container">

	<?php $_smarty_tpl->tpl_vars["fa"] = new Smarty_variable("false", null, 0);?>
          	
   
  <h1>
    Exercise - <?php if ($_smarty_tpl->tpl_vars['ANSWERED']->value==$_smarty_tpl->tpl_vars['fa']->value) {?>Not done<?php } else { ?>Done<?php }?>
  </h1>
  <br>
  <h2>Class: <?php echo $_smarty_tpl->tpl_vars['CLASSID']->value;?>
</h2>
  
  <div id="setPanelGroup" class="panel-group">
    
    <div id="<?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
" class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a  data-toggle="collapse" href="#content_<?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
">
            <?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
. <?php echo $_smarty_tpl->tpl_vars['SET']->value['name'];?>

            <i style="font-size:80%;">
              <br>
              <span id="setCount_<?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
">
                <?php echo $_smarty_tpl->tpl_vars['SET']->value['numEx'];?>

              </span>
              Exercise(s)
            </i>
          </a>
        </h4>
      </div>
      <div id="content_<?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
" class="panel-collapse collapse">
        <div class="panel-body">
          <div id="exercisePanelGroup<?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
" class="panel-group">
          	
          	
          	<!-- IF NOT ANSWERED -->
          	<?php if ($_smarty_tpl->tpl_vars['ANSWERED']->value==$_smarty_tpl->tpl_vars['fa']->value) {?>

          		 <form class="form-horizontal" action="../../actions/answerSet.php" method="GET" role="form" id="answer_form" onsubmit = "">
          		 <input type="hidden" value="<?php echo $_smarty_tpl->tpl_vars['SET']->value['id'];?>
" name="setid" />
          		 <input type="hidden" value="<?php echo $_smarty_tpl->tpl_vars['CLASSID']->value;?>
" name="classid" />


	            <?php  $_smarty_tpl->tpl_vars['ex'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ex']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['SET']->value['exercises']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ex']->key => $_smarty_tpl->tpl_vars['ex']->value) {
$_smarty_tpl->tpl_vars['ex']->_loop = true;
?>
	            <div id="ex<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" class="panel panel-default">
	              <div class="panel-heading">
	                <h4 class="panel-title">
	                  <a data-toggle="collapse" href="#ex_content_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
">
	                    <?php echo $_smarty_tpl->tpl_vars['ex']->value['name'];?>

	                  </a>
	                </h4>
	              </div>
	              <div id="ex_content_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" class="panel-collapse collapse">
	                <div class="panel-body">
	                  
	                  <?php $_smarty_tpl->tpl_vars['c'] = new Smarty_variable(0, null, 0);?>
	                  <div class="form-group">
	                  	<input required  type="radio" name="exid_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" value="-1" style="display:none;" checked="true">
	                  <?php  $_smarty_tpl->tpl_vars['opt'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['opt']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ex']->value['ops']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['opt']->key => $_smarty_tpl->tpl_vars['opt']->value) {
$_smarty_tpl->tpl_vars['opt']->_loop = true;
?>
	                   <?php if ($_smarty_tpl->tpl_vars['c']->value>0) {?><br><?php }?>
	                  <?php $_smarty_tpl->tpl_vars['c'] = new Smarty_variable($_smarty_tpl->tpl_vars['c']->value+1, null, 0);?>
	                  <span style="color:black;">
	                  	<label style="margin-left:1em;">
              			<input required  type="radio" name="exid_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" value="<?php echo $_smarty_tpl->tpl_vars['opt']->value['optid'];?>
">  <?php echo $_smarty_tpl->tpl_vars['opt']->value['description'];?>
 
            			</label>
	                      <?php } ?>
	                  </div>
	                    </div>
	                  </div>
	                </div>
	                <?php } ?>
	               <br>
	         <input type="submit" class="btn btn-lg btn-default" value="Submit">
	        <!-- IF ANSWERED -->
          	<?php } else { ?>
	            <?php  $_smarty_tpl->tpl_vars['ex'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ex']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['SET']->value['exercises']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ex']->key => $_smarty_tpl->tpl_vars['ex']->value) {
$_smarty_tpl->tpl_vars['ex']->_loop = true;
?>
		            <?php  $_smarty_tpl->tpl_vars['answer'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['answer']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['STUDENT_ANSWERS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['answer']->key => $_smarty_tpl->tpl_vars['answer']->value) {
$_smarty_tpl->tpl_vars['answer']->_loop = true;
?>
		                    	<?php if ($_smarty_tpl->tpl_vars['answer']->value['exerciseId']==$_smarty_tpl->tpl_vars['ex']->value['id']) {?>
		                    		<?php $_smarty_tpl->tpl_vars["useropt"] = new Smarty_variable($_smarty_tpl->tpl_vars['answer']->value['optionId'], null, 0);?>
		                    		<?php if ($_smarty_tpl->tpl_vars['answer']->value['optionId']==$_smarty_tpl->tpl_vars['ex']->value['correct']) {?>
		                    		<?php $_smarty_tpl->tpl_vars["check"] = new Smarty_variable(1, null, 0);?>
		                    		<?php } else { ?>
		                    		<?php $_smarty_tpl->tpl_vars["check"] = new Smarty_variable(0, null, 0);?>
		                    		<?php }?>
		                    	<?php }?>
		               <?php } ?>
	            <div id="ex<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" class="panel panel-default">
	              <div class="panel-heading">
	                <h4 class="panel-title">
	                  <a data-toggle="collapse"<?php if ($_smarty_tpl->tpl_vars['check']->value==0) {?> style="background-color:#CD5555;"<?php } else { ?>style="background-color:#AADD00;"<?php }?>href="#ex_content_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
">
	                    <?php echo $_smarty_tpl->tpl_vars['ex']->value['name'];?>

	                  </a>
	                </h4>
	              </div>
	              <div id="ex_content_<?php echo $_smarty_tpl->tpl_vars['ex']->value['id'];?>
" class="panel-collapse collapse">
	                <div class="panel-body">
	                  
	                  <?php $_smarty_tpl->tpl_vars['c'] = new Smarty_variable(0, null, 0);?>
	                  <?php  $_smarty_tpl->tpl_vars['opt'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['opt']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ex']->value['ops']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['opt']->key => $_smarty_tpl->tpl_vars['opt']->value) {
$_smarty_tpl->tpl_vars['opt']->_loop = true;
?>
	                  <?php $_smarty_tpl->tpl_vars['c'] = new Smarty_variable($_smarty_tpl->tpl_vars['c']->value+1, null, 0);?>
	                  <span style="color:black;">
	                    <?php echo $_smarty_tpl->tpl_vars['c']->value;?>
.  <?php echo $_smarty_tpl->tpl_vars['opt']->value['description'];?>


	                    <span>
						
						<?php if ($_smarty_tpl->tpl_vars['opt']->value['optid']==$_smarty_tpl->tpl_vars['useropt']->value) {?> 
						<span class="glyphicon glyphicon-user"></span>
						<?php }?>
	                      <?php if ($_smarty_tpl->tpl_vars['opt']->value['optid']==$_smarty_tpl->tpl_vars['ex']->value['correct']) {?> 
	                      <span class="glyphicon glyphicon-ok">
	                      </span>
	                      <?php }?>
	                      <br>
	                      <?php } ?>
	                    </div>
	                  </div>
	                </div>
	                <?php } ?>
                <?php }?>



              </div>
              
            </div>
          </div>
          
        </div>
		
              </div>
              
              
              
              
          </div>

  
  
  <script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/s_exercise.js">
  </script>
  <?php }} ?>
