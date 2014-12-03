<?php /* Smarty version Smarty-3.1.15, created on 2014-12-03 13:21:41
         compiled from "C:\xampp\htdocs\\gifted\templates\common\profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6025474d4a987a053-88956259%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0d1b07dc5deea9b70446bab76977ac1fc61191d6' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\common\\profile.tpl',
      1 => 1417603533,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6025474d4a987a053-88956259',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5474d4a9889a38_46172121',
  'variables' => 
  array (
    'USERID' => 0,
    'USERINFO' => 0,
    'EVENTS' => 0,
    'event' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5474d4a9889a38_46172121')) {function content_5474d4a9889a38_46172121($_smarty_tpl) {?><div class="container">
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
          <h6>Upload a different photo...</h6>
          
          <input type="file" class="form-control">
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <h3>Personal info</h3>
        
        <form class="form-horizontal" role="form">
          <input type="hidden" name="userid" value="<?php echo $_smarty_tpl->tpl_vars['USERID']->value;?>
">
          <div class="form-group">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['first_name'];?>
" name="first_name">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['last_name'];?>
" name="last_name">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Email:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['email'];?>
" name="email">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['username'];?>
" name="username">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" value="" name="password">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" value="">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="button" class="btn btn-primary" value="Save Changes">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
            </div>
          </div>
        </form>
        Events
        <?php if (count($_smarty_tpl->tpl_vars['EVENTS']->value)==0) {?>
        <hr>No events to be shown.</hr>
        <?php } else { ?>
         <?php  $_smarty_tpl->tpl_vars['event'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['event']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['EVENTS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['event']->key => $_smarty_tpl->tpl_vars['event']->value) {
$_smarty_tpl->tpl_vars['event']->_loop = true;
?>
          <hr><?php echo $_smarty_tpl->tpl_vars['event']->value['description'];?>
</hr>
         <?php } ?>
         <?php }?>
      </div>
  </div>
</div>
<hr><?php }} ?>
