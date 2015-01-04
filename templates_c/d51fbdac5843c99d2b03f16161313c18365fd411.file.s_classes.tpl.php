<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:48:27
         compiled from "C:\Xampp\htdocs\gifted\templates\students\s_classes.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2740954a83e9a841503-99435570%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd51fbdac5843c99d2b03f16161313c18365fd411' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\students\\s_classes.tpl',
      1 => 1420388992,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2740954a83e9a841503-99435570',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83e9aa17a55_87691876',
  'variables' => 
  array (
    'CLASSES' => 0,
    'class' => 0,
    'USERID' => 0,
    'student' => 0,
    'set' => 0,
    'event' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83e9aa17a55_87691876')) {function content_54a83e9aa17a55_87691876($_smarty_tpl) {?><div class="container">
  <style>
	/*----- Tabs -----*/
      .tabs {
        width:100%;
        background:;
        display:inline-block;
      }
      
      /*----- Tab Links -----*/
      /* Clearfix */
      .tab-links:after {
        display:block;
        clear:both;
        content:'';
      }
      
      .tab-links li {
        margin:0px 5px;
        float:left;
        list-style:none;
      }
      
      .tab-links a {
        padding:9px 15px;
        display:inline-block;
        border-radius:3px 3px 0px 0px;
        background:#D3D3D3;
        font-size:16px;
        font-weight:600;
        font-style: italic;
        color:#4c4c4c;
        transition:all linear 0.15s;
      }
      
      .tab-links a:hover {
        background:#a7cce5;
        text-decoration:none;
      }
      
      li.active a, li.active a:hover {
        background:#09C;

        color:#ffffff;
      }
      
      /*----- Content of Tabs -----*/
      
      
      .tab {
        display:none;
      }
      
      .tab.active {
        display:block;
      }
  </style>
  <h1>
    My Classes
  </h1>
  
  <?php if (count($_smarty_tpl->tpl_vars['CLASSES']->value)==0) {?>
		<h3>
			You are currently not in any class.
		</h3>
  <?php }?>
  
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
          <span style="padding:10px;pointer-events: none;" class="pull-right">
            <i style="font-size:80%;">
              Score:
            </i>
            <?php echo $_smarty_tpl->tpl_vars['class']->value['score'];?>

          </span>
          <a  data-toggle="collapse" href="#content_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
            <?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
. <?php echo $_smarty_tpl->tpl_vars['class']->value['name'];?>

            <i style="font-size:80%;">
              <br>
              <span id="classCount_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
                <?php echo $_smarty_tpl->tpl_vars['class']->value['numStd'];?>

              </span>
              Student(s)
            </i>
            
          </a>
        </h4>
      </div>
      <div id="content_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="panel-collapse collapse">
        <div class="panel-body">
          
          
          <span style="font-size:150%;color:black">
            <i style="font-size:80%">
              Teacher:
            </i>
            
            <b>
              <?php echo $_smarty_tpl->tpl_vars['class']->value['teacher']['first_name'];?>
 <?php echo $_smarty_tpl->tpl_vars['class']->value['teacher']['last_name'];?>

            </b>
          </span>
          
          <button id="leave_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-danger pull-right leaveClassButton" style="margin-bottom:20px">
            <span class="glyphicon glyphicon-remove" aria-hidden="true">
            </span>
            Leave Class
          </button>
          
          <br>
          <br>
          
          <table id="table_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="table table-striped table-condensed table-bordered studentTable">
            <thead>
              <tr>
                <th>
                  #
                </th>
                <th>
                  Name
                </th>
                <th>
                  Score
                </th>
              </tr>
            </thead>
            <tbody>
              <?php  $_smarty_tpl->tpl_vars['student'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['student']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['class']->value['students']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['student']->key => $_smarty_tpl->tpl_vars['student']->value) {
$_smarty_tpl->tpl_vars['student']->_loop = true;
?>
              
              <?php if ($_smarty_tpl->tpl_vars['USERID']->value==$_smarty_tpl->tpl_vars['student']->value['id']) {?> 
              <tr style="background-color: #66CD00">
                
                <?php } else { ?>
                <tr>
                  
                  <?php }?>
                  <td>
                    <?php echo $_smarty_tpl->tpl_vars['student']->value['id'];?>

                  </td>
                  <td>
                    <?php echo $_smarty_tpl->tpl_vars['student']->value['first_name'];?>
 <?php echo $_smarty_tpl->tpl_vars['student']->value['last_name'];?>

                  </td>
                  <td>
                    <?php echo $_smarty_tpl->tpl_vars['student']->value['score'];?>

                  </td>
              </tr>
              
              <?php } ?>
              
            </tbody>
          </table>
          <!--button id="ev_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default pull-left evButton evButton_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="margin-bottom:20px">
<span id="ev_glyph_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="glyphicon glyphicon-zoom-in" aria-hidden="true">
</span>

<span id="ev_text_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
Show Events
</span>
</button>
<button id="ev_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default pull-left evButton evButton_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="display:none;margin-bottom:20px">
<span id="ev_glyph_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="glyphicon glyphicon-zoom-out" aria-hidden="true">
</span>

<span id="ev_text_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
Hide Events
</span>
</button>

<button id="set_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default pull-left setButton setButton_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="margin-bottom:20px;margin-left:5em">
<span id="set_glyph_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="glyphicon glyphicon-zoom-in" aria-hidden="true">
</span>

<span id="set_text_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
Show Sets
</span>
</button>
<button id="set_button_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" type="button" class="btn btn-default pull-left setButton setButton_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="display:none;margin-bottom:20px;margin-left:5em">
<span id="set_glyph_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" class="glyphicon glyphicon-zoom-out" aria-hidden="true">
</span>

<span id="set_text_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
">
Hide Sets
</span>
</button-->
                      <br>
                      <div class="tabs">
                        <ul class="tab-links">
                          <li class="active">
                            <a title="Show sets of exercises of this class" href="#tab1">
                              Exercises
                            </a>
                          </li>
                          <li>
                            <a title="Show events of this class"  href="#tab2">
                              Events
                            </a>
                          </li>
                        </ul>
                        
                        <div class="tab-content">
                          <div id="tab1" class="tab active">
                            <?php if (count($_smarty_tpl->tpl_vars['class']->value['sets'])>0) {?>
                            <table id="table_set_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="" class="table table-striped table-condensed table-bordered setsTable">
                              <tbody>
                                
								<?php  $_smarty_tpl->tpl_vars['set'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['set']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['class']->value['sets']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['set']->key => $_smarty_tpl->tpl_vars['set']->value) {
$_smarty_tpl->tpl_vars['set']->_loop = true;
?>
                              <tr <?php if ($_smarty_tpl->tpl_vars['set']->value['done']==1) {?>style="background-color:#66CD00;"<?php }?>>
                                <td>
                                  <?php echo $_smarty_tpl->tpl_vars['set']->value['setId'];?>
.<?php echo $_smarty_tpl->tpl_vars['set']->value['name'];?>
<?php if ($_smarty_tpl->tpl_vars['set']->value['done']==1) {?>
                                  <span style="font-style:italic;margin-right:5em;" class="pull-right">
                                    Done
                                  </span>
                                  <?php }?>
                                </td>
                              </tr>
                              <?php } ?>							
                          </tbody>
          </table>
          <?php } else { ?>
          <table id="table_set_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="" class="table table-striped table-condensed table-bordered setsTable">
            <tbody>
              
            </tbody>
          </table>
          <?php }?>
      </div>
      
      <div id="tab2" class="tab">
        <style>
          html, body {
            overflow-x: hidden;
            width: 100%;
          }
          table.eventsTable tbody {
            height:300px;
            overflow-y:scroll ;
            display:block;
          }
        </style>
      
        <table id="table_ev_<?php echo $_smarty_tpl->tpl_vars['class']->value['id'];?>
" style="" class="table table-striped table-condensed  eventsTable">
          <tbody>
            
            <?php  $_smarty_tpl->tpl_vars['event'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['event']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['class']->value['classEvents']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['event']->key => $_smarty_tpl->tpl_vars['event']->value) {
$_smarty_tpl->tpl_vars['event']->_loop = true;
?>
            <tr>

              <td>
                <?php echo $_smarty_tpl->tpl_vars['event']->value['description'];?>

              </td>
            </tr>
            

            <?php } ?>							
          </tbody>
          
          
          
        </table>

      </div>
                          </div>
                      </div>
                      
                      
                      
                      
                      
                      
                      
                      
                      <!-- -->
                  </div>
                  
              </div>
              
          </div>
          
  </div>
  
  
  <?php } ?>
</div>
</div>


<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/s_classes.js">
</script>
<?php }} ?>
