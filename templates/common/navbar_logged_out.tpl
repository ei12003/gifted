{if isset($ERROR_MESSAGES)}
<script type="text/javascript">
bootbox.alert("{$ERROR_MESSAGES}");
</script>
{/if}

<li class="dropdown" >
	<a class="dropdown-toggle" href="#" data-toggle="dropdown">Log In<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form id="form_login" action="{$BASE_URL}actions/login.php" method="post" accept-charset="UTF-8" onsubmit="return check_empty_field()">
			<input class="form-control" type="text" placeholder="Username" id="login_username" name="username" style="min-width:200px;">
			<input class="form-control" type="password" placeholder="Password" id="login_password" name="password">
			<input class="btn btn-log btn-block" type="submit" id="login" value="Log In">
		</form>
		<form action="register.php">
			<button class="btn btn-reg btn-block" id="register">Register</button>
		</form>
		
	</div>
</li>