$(document).ready(function () {

	//set focus on username after 50 ms
	$('#nav_login').click(function() {
		setTimeout('$(\'#login_username\').focus()', 50);
	});
	
	$('.dropdown-menu').on('click', function(e) {
		e.stopPropagation();
	});
	
});