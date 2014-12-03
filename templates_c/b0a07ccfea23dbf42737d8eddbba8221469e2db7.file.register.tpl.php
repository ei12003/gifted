<?php /* Smarty version Smarty-3.1.15, created on 2014-12-03 14:36:02
         compiled from "C:\xampp\htdocs\\gifted\templates\common\register.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7405547f11c2b20a13-66217731%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b0a07ccfea23dbf42737d8eddbba8221469e2db7' => 
    array (
      0 => 'C:\\xampp\\htdocs\\\\gifted\\templates\\common\\register.tpl',
      1 => 1417613158,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7405547f11c2b20a13-66217731',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_547f11c2b3d0f5_68947790',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_547f11c2b3d0f5_68947790')) {function content_547f11c2b3d0f5_68947790($_smarty_tpl) {?><div class="container">

      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <h3>Register</h3>
        
        <form class="form-horizontal" role="form">
     
          <div class="form-group">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="first_name">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="last_name">
            </div>
          </div>
		   
		   
<div class="form-group">
            <label class="col-md-3 control-label">Birthday:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" id="datepicker-7"> 
			</div>
          </div>
	
		  <div class="form-group">
            <label class="col-md-3 control-label">Gender:</label>
            <div class="col-md-8">
			<div class="radio">
  <label><input type="radio" name="optradio">Female</label>
</div>
<div class="radio">
  <label><input type="radio" name="optradio">Male</label>
</div>
            </div>
          </div>
		  

          <div class="form-group">
            <label class="col-md-3 control-label">Email:</label>
			<div class="col-md-8">
              <input class="form-control" type="text" name="email">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="username">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" name="password">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="button" class="btn btn-primary" value="Register">
              <input type="button" class="btn btn-primary" value="Cancel">
            </div>
          </div>
        </form>
		
       
      </div>
  </div>
</div>
<hr>

</div>
<hr><?php }} ?>
