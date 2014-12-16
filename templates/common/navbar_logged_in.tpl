{if $USERTYPE == 'teacher'}
	<li><a id="navbar_color" href="{$BASE_URL}pages/teachers/t_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/teachers/t_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	
{else if $USERTYPE == 'student'}
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_store.php"><span class="glyphicon glyphicon-heart-empty"></span> Store</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_inventory.php"><span class="glyphicon glyphicon-star"></span> Inventory</a></li>
{/if}

<li class="dropdown" >
	<a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> {$USERNAME}<strong class="caret"></strong></a>
	<div class="dropdown-menu" >
		<form action="{$BASE_URL}pages/profile.php">
			<button class="btn btn-primary btn-block" id="logout">Edit Profile</button>
		</form>
		<form action="{$BASE_URL}actions/logout.php">
			<button class="btn btn-primary btn-block" id="logout">Logout</button>
		</form>
	</div>
</li>