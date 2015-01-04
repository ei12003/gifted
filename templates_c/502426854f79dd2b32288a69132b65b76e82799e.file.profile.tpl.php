<?php /* Smarty version Smarty-3.1.15, created on 2015-01-03 20:12:31
         compiled from "C:\Xampp\htdocs\gifted\templates\common\profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2598654a83f1f6aad48-70703530%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '502426854f79dd2b32288a69132b65b76e82799e' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\profile.tpl',
      1 => 1420311300,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2598654a83f1f6aad48-70703530',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERID' => 0,
    'USERINFO' => 0,
    'EVENTS' => 0,
    'event' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83f1f767924_59173324',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83f1f767924_59173324')) {function content_54a83f1f767924_59173324($_smarty_tpl) {?><style type="text/css"> 
input:required:invalid, input:focus:invalid{ 
background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAeVJREFUeNqkU01oE1EQ/mazSTdRmqSxLVSJVKU9RYoHD8WfHr16kh5EFA8eSy6hXrwUPBSKZ6E9V1CU4tGf0DZWDEQrGkhprRDbCvlpavan3ezu+LLSUnADLZnHwHvzmJlvvpkhZkY7IqFNaTuAfPhhP/8Uo87SGSaDsP27hgYM/lUpy6lHdqsAtM+BPfvqKp3ufYKwcgmWCug6oKmrrG3PoaqngWjdd/922hOBs5C/jJA6x7AiUt8VYVUAVQXXShfIqCYRMZO8/N1N+B8H1sOUwivpSUSVCJ2MAjtVwBAIdv+AQkHQqbOgc+fBvorjyQENDcch16/BtkQdAlC4E6jrYHGgGU18Io3gmhzJuwub6/fQJYNi/YBpCifhbDaAPXFvCBVxXbvfbNGFeN8DkjogWAd8DljV3KRutcEAeHMN/HXZ4p9bhncJHCyhNx52R0Kv/XNuQvYBnM+CP7xddXL5KaJw0TMAF8qjnMvegeK/SLHubhpKDKIrJDlvXoMX3y9xcSMZyBQ+tpyk5hzsa2Ns7LGdfWdbL6fZvHn92d7dgROH/730YBLtiZmEdGPkFnhX4kxmjVe2xgPfCtrRd6GHRtEh9zsL8xVe+pwSzj+OtwvletZZ/wLeKD71L+ZeHHWZ/gowABkp7AwwnEjFAAAAAElFTkSuQmCC); 
background-position: right top;
background-repeat: no-repeat;
-moz-box-shadow: none;} 

input:required:valid{
background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
background-position: right top;
background-repeat: no-repeat;}
</style>

<div class="container">
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <h3>Personal info</h3>
        
        <form class="form-horizontal" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/editProfile.php" method="POST" role="form" id="editProfile_form">
          <input type="hidden" name="userid" value="<?php echo $_smarty_tpl->tpl_vars['USERID']->value;?>
">
          <div class="form-group">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['first_name'];?>
" name="first_name" placeholder="Enter your first name" onblur="if(this.value == '') { this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['first_name'];?>
'; }" onfocus="if(this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['first_name'];?>
') { this.value = ''; }">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['last_name'];?>
" name="last_name" placeholder="Enter your last name" onblur="if(this.value == '') { this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['last_name'];?>
'; }" onfocus="if(this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['last_name'];?>
') { this.value = ''; }">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Email:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="email" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['email'];?>
" name="email" placeholder="Enter your new email address" onblur="if(this.value == '') { this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['email'];?>
'; }" onfocus="if(this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['email'];?>
') { this.value = ''; }" pattern = "(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="text" value="<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['username'];?>
" id = "txt_username" name="username" placeholder="Enter your new username" onblur="if(this.value == '') { this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['username'];?>
'; }" onfocus="if(this.value == '<?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['username'];?>
') { this.value = ''; }" placeholder="Ex.:User123" pattern="[a-zA-Z][a-zA-Z0-9]{4,}" oninput="validUsername(this)">
              <div class="txt_username">The username must be at least 5 characters length and start by a letter.</div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="password" id="txt_password" name="password" placeholder="Enter a new password" pattern="(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}">
              <div class="txt_password">The password must be at least 6 characters length (one letter and one digit must figure in it).</div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="password" id="txt_rpassword" name="rpassword" placeholder="Retype your new password" pattern="(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}">
              <div class="txt_rpassword">The passwords must match.</div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Save Changes">
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
<hr>

<script type="text/javascript">function supports_input_placeholder() { var i = document.createElement('input'); return 'placeholder' in i; } if(!supports_input_placeholder()) { var fields = document.getElementsByTagName('INPUT'); for(var i=0; i < fields.length; i++) { if(fields[i].hasAttribute('placeholder')) { fields[i].defaultValue = fields[i].getAttribute('placeholder'); fields[i].onfocus = function() { if(this.value == this.defaultValue) this.value = ''; } fields[i].onblur = function() { if(this.value == '') this.value = this.defaultValue; } } } } </script>
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/register.js"></script><?php }} ?>
