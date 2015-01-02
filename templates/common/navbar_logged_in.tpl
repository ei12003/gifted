<style>
.yellow{
	color: #DAA520;
}
</style>

{if $USERTYPE == 'teacher'}
	<li><a id="navbar_color" href="{$BASE_URL}pages/teachers/t_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/teachers/t_exercises.php"><span class="glyphicon glyphicon-pencil"></span> Exercises</a></li>
	
{else if $USERTYPE == 'student'}
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_classes.php"><span class="glyphicon glyphicon-book"></span> Classes</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_store.php"><span class="glyphicon glyphicon-heart-empty"></span> Store{if $USERTYPE == 'student' AND isset($ITEMS)} <span style="color:yellow" class="header_userpts">{$USERPOINTS} pts</span> {/if}</a></li>
	<li><a id="navbar_color" href="{$BASE_URL}pages/students/s_inventory.php"><span class="glyphicon glyphicon-star"></span> Inventory</a></li>
{/if}

<li class="dropdown" >
	<a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> {$USERNAME}<strong class="caret"></strong></a>
	<!--a class="dropdown-toggle" id="nav_login" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> {$USERNAME}{if $USERTYPE == 'student'}
	{if $USERPOINTS < 20}
	(<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span> Level 0, <span class="header_userpts">{$USERPOINTS}</span> pts)
	{else if $USERPOINTS >= 20 AND $USERPOINTS < 50}
	(<span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span> Level 1, <span class="header_userpts">{$USERPOINTS}</span> pts)
	{else if $USERPOINTS >= 50 AND $USERPOINTS < 80}
	(<span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span> Level 2, <span class="header_userpts">{$USERPOINTS}</span> pts)
	{else if $USERPOINTS >= 80 AND $USERPOINTS < 100}
	(<span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span> Level 3, <span class="header_userpts">{$USERPOINTS}</span> pts)
	{else if $USERPOINTS >= 100 AND $USERPOINTS < 200}
	(<span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star"></span> Level 4, <span class="header_userpts">{$USERPOINTS}</span> pts)
	{else if $USERPOINTS >= 200}
	(<span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span><span class="glyphicon glyphicon-star yellow"></span> Level 5, <span class="header_userpts">{$USERPOINTS}</span> pts)
	{/if}{/if}<strong class="caret"></strong></a-->
	<div class="dropdown-menu" >
		<form action="{$BASE_URL}pages/profile.php">
			<button class="btn btn-primary btn-block" id="logout">Edit Profile</button>
		</form>
		<form action="{$BASE_URL}actions/logout.php">
			<button class="btn btn-primary btn-block" id="logout">Logout</button>
		</form>
	</div>
</li>