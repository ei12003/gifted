var validation;
var validation_user;

function isaLetter(text){
    var regex = /^[a-zA-Z]+$/;
    return text.match(regex);
}

function validateUsername(username){
	return (username.length >= 5 && isaLetter(username[0]));
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 

function validatePassword(password){
	var re = /^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$/;
	return re.test(password);
}

function equalPasswords(password, rpassword){
	return (password == rpassword);
}

function validUsername(input) {
	$.get( "../api/validNewUsername.php", {username: input.value}, function( data ) {
		if (data == true) {
			input.setCustomValidity("");
		} else {
			input.setCustomValidity("Username already exists.");
		}
	});
}

$(document).ready(function () {
    $("#txt_username").blur(function () {
		var txt_username = document.getElementById("txt_username");
		if( !validateUsername(txt_username.value) )
			document.getElementById("lbl_username").innerHTML = "<p>The username must be at least 5 characters length and must start by a letter.</p>";
		else
			document.getElementById("lbl_username").innerHTML = "";
    }),
	$("#txt_password").blur(function () {
		var txt_password = document.getElementById("txt_password");
		if( !validatePassword(txt_password.value) )	
			document.getElementById("lbl_password").innerHTML = "<p>The password must be at least 6 characters length (one letter and one digit must figure in it).</p>";
		else
			document.getElementById("lbl_password").innerHTML = "";
    }),
	$("#txt_rpassword").blur(function () {
		var txt_password = document.getElementById("txt_password");
		var txt_rpassword = document.getElementById("txt_rpassword");
		if( !equalPasswords(txt_password.value, txt_rpassword.value) )	
			document.getElementById("lbl_rpassword").innerHTML = "<p>Passwords must be equal.</p>";
		else
			document.getElementById("lbl_rpassword").innerHTML = "";
    }),
	$("#txt_email").blur(function () {
		var txt_email = document.getElementById("txt_email");
		if( !validateEmail(txt_email.value) )	
			document.getElementById("lbl_email").innerHTML = "<p>Enter a valid email.</p>";
		else
			document.getElementById("lbl_email").innerHTML = "";
    });
}); 

function validateRegister(){
	var txt_username = document.getElementById("txt_username");
	var txt_password = document.getElementById("txt_password");
	var txt_rpassword = document.getElementById("txt_rpassword");
	var txt_email = document.getElementById("txt_email");
	
	if( !validateUsername(txt_username.value) || !validatePassword(txt_password.value)
		|| !equalPasswords(txt_password.value, txt_rpassword.value)
		|| !validateEmail(txt_email.value)){
			alert("There are fields that are not still correct.");
			return false;
	} else{
		var response = validateCaptcha();
		var response_user = validateUser();
				
		if(response == "true" && response_user == "true")
			return true;
		else
			return false;
	}
}