<?php /* Smarty version Smarty-3.1.15, created on 2015-01-05 17:49:47
         compiled from "C:\Xampp\htdocs\gifted\templates\common\register.tpl" */ ?>
<?php /*%%SmartyHeaderCode:791854aac0ab4a6a72-75581770%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6ee686a91a992b315f5db80c1c4f84e93e678cd9' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\register.tpl',
      1 => 1420299016,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '791854aac0ab4a6a72-75581770',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54aac0ab565f36_37379873',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54aac0ab565f36_37379873')) {function content_54aac0ab565f36_37379873($_smarty_tpl) {?><style type="text/css"> 
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
  
  <!-- edit form column -->
  <div class="col-md-9 personal-info">
    <h1>
	Register
    </h1>
    
    <form class="form-horizontal" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/register.php" method="POST" role="form" id="register_form">
      
      <div class="form-group">
        <label class="col-md-3 control-label">
          Type:
        </label>
        <div class="col-md-8">
          <div class="radio">
            <label>
              <input required  type="radio" name="usertype" value="student">
              Student
            </label>
          </div>
          <div class="radio">
            <label>
              <input type="radio" name="usertype" value="teacher">
              Teacher
            </label>
          </div>
        </div>
      </div>
      
      
      <div class="form-group">
        <label class="col-md-3 control-label">
          First name:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="text" name="first_name" placeholder="Your first name">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Last name:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="text" name="last_name" placeholder="Your last name">
        </div>
      </div>
      
      
      <div class="form-group">
        <label class="col-md-3 control-label">
          Birthday:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="date" name="birth_date" placeholder="Your birth date">
          
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-3 control-label">
          Gender:
        </label>
        <div class="col-md-8">
          <div class="radio">
            <label>
              <input required  type="radio" name="gender" value="female">
              Female
            </label>
          </div>
          <div class="radio">
            <label>
              <input type="radio" name="gender" value="Male">
              Male
            </label>
          </div>
        </div>
      </div>
      

	  
	  
      <div class="form-group">
        <label class="col-md-3 control-label">
          Email:
        </label>
        <div class="col-md-8">
          <input required class="form-control" type = "email" name = "email" id = "txt_email" placeholder="Enter a valid email address" pattern = "(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Username:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="text" name="username" id = "txt_username" placeholder="Ex.:User123" pattern="[a-zA-Z][a-zA-Z0-9]{4,}" oninput="validUsername(this)">
		  <div class="txt_username">The username must be at least 5 characters length and start by a letter.</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Password:
        </label>
        <div class="col-md-8">
		  <input required  class="form-control" type="password" name="password" id = "txt_password" pattern="(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}">
		  <div class="txt_password">The password must be at least 6 characters length (one letter and one digit must figure in it).</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Confirm password:
        </label>
        <div class="col-md-8">
		  <input required  class="form-control" type="password" name="rpassword" id="txt_rpassword" pattern="(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}" oninput="checkValidPass(this)">
		  <div class="txt_rpassword">The passwords must match.</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
        </label>
        <div class="col-md-8">
		  <input type="submit" class="btn btn-reg" value="Register">
        </div>
      </div>
    </form>
    
    
  </div>
</div>
</div>
<hr>

</div>
<hr>

<script type="text/javascript">function supports_input_placeholder() { var i = document.createElement('input'); return 'placeholder' in i; } if(!supports_input_placeholder()) { var fields = document.getElementsByTagName('INPUT'); for(var i=0; i < fields.length; i++) { if(fields[i].hasAttribute('placeholder')) { fields[i].defaultValue = fields[i].getAttribute('placeholder'); fields[i].onfocus = function() { if(this.value == this.defaultValue) this.value = ''; } fields[i].onblur = function() { if(this.value == '') this.value = this.defaultValue; } } } } </script>
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/register.js"></script>
<?php }} ?>
