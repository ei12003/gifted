<style type="text/css"> 
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
        
        <form class="form-horizontal" action="{$BASE_URL}actions/editProfile.php" method="POST" role="form" id="editProfile_form">
          <input type="hidden" name="userid" value="{$USERID}">
          <div class="form-group">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="text" value="{$USERINFO.first_name}" name="first_name" placeholder="Enter your first name" onblur="if(this.value == '') { this.value == '{$USERINFO.first_name}'; }" onfocus="if(this.value == '{$USERINFO.first_name}') { this.value = ''; }">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="text" value="{$USERINFO.last_name}" name="last_name" placeholder="Enter your last name" onblur="if(this.value == '') { this.value == '{$USERINFO.last_name}'; }" onfocus="if(this.value == '{$USERINFO.last_name}') { this.value = ''; }">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Email:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="email" value="{$USERINFO.email}" name="email" placeholder="Enter your new email address" onblur="if(this.value == '') { this.value == '{$USERINFO.email}'; }" onfocus="if(this.value == '{$USERINFO.email}') { this.value = ''; }" pattern = "(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{literal}{1,3}{/literal}\.[0-9]{literal}{1,3}{/literal}\.[0-9]{literal}{1,3}{/literal}\.[0-9]{literal}{1,3}{/literal}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{literal}{2,}{/literal}))">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="text" value="{$USERINFO.username}" id = "txt_username" name="username" placeholder="Enter your new username" onblur="if(this.value == '') { this.value == '{$USERINFO.username}'; }" onfocus="if(this.value == '{$USERINFO.username}') { this.value = ''; }" placeholder="Ex.:User123" pattern="[a-zA-Z][a-zA-Z0-9]{literal}{4,}{/literal}" oninput="validUsername(this)">
              <div class="txt_username">The username must be at least 5 characters length and start by a letter.</div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="password" id="txt_password" name="password" placeholder="Enter a new password" pattern="(?=.*?[A-Za-z])(?=.*?[0-9]).{literal}{6,}{/literal}">
              <div class="txt_password">The password must be at least 6 characters length (one letter and one digit must figure in it).</div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input required  class="form-control" type="password" id="txt_rpassword" name="rpassword" placeholder="Retype your new password" pattern="(?=.*?[A-Za-z])(?=.*?[0-9]).{literal}{6,}{/literal}">
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
        {if $EVENTS|@count == 0}
        <hr>No events to be shown.</hr>
        {else}
         {foreach from=$EVENTS item=event}
          <hr>{$event.description}</hr>
         {/foreach}
         {/if}
      </div>
  </div>
</div>
<hr>

<script type="text/javascript">function supports_input_placeholder() { var i = document.createElement('input'); return 'placeholder' in i; } if(!supports_input_placeholder()) { var fields = document.getElementsByTagName('INPUT'); for(var i=0; i < fields.length; i++) { if(fields[i].hasAttribute('placeholder')) { fields[i].defaultValue = fields[i].getAttribute('placeholder'); fields[i].onfocus = function() { if(this.value == this.defaultValue) this.value = ''; } fields[i].onblur = function() { if(this.value == '') this.value = this.defaultValue; } } } } </script>
<script src="{$BASE_URL}js/register.js"></script>