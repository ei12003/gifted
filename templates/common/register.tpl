<div class="container">
  
  <!-- edit form column -->
  <div class="col-md-9 personal-info">
    <h1>
      Register
    </h1>
    
    <form class="form-horizontal" action="{$BASE_URL}actions/register.php" method="POST" role="form" id="register_form">
      
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
          <input required  class="form-control" type="text" name="first_name">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Last name:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="text" name="last_name">
        </div>
      </div>
      
      
      <div class="form-group">
        <label class="col-md-3 control-label">
          Birthday:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="date" name="birth_date">
          
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
          <input required  class="form-control" type="text" name="email">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Username:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="text" name="username" oninput="checkValidUsername(this)">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Password:
        </label>
        <div class="col-md-8">
          <input required  class="form-control" type="password" id="password" name="password">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">
          Confirm password:
        </label>
		<div id="err"></div>
		
        <div class="col-md-8">
          <input required  class="form-control" type="password" id="confpass" name="confpassword" oninput="checkValidPass(this)">
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


<script src="{$BASE_URL}js/register.js"></script>
