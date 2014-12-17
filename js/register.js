function checkValidPass(input) {

	if ( $("#password").val() != $("#confpass").val()) {
		input.setCustomValidity("Passwords don't match.");
	} else {
		input.setCustomValidity("");
	}

}

function checkValidUsername(input) {
	$.get( "../api/validNewUsername.php", {username: input.value}, function( data ) {
		if (data == true) {
			input.setCustomValidity("");
		} else {
			input.setCustomValidity("Username already exists.");
		}
	});
}