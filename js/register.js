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

function checkValidPass(input) {
	if ( $("#txt_password").val() != $("#txt_rpassword").val()) {
		input.setCustomValidity("Passwords don't match.");
	} else {
		input.setCustomValidity("");
	}
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

$('#txt_username').focus(function() {
if( !validateUsername(txt_username.value) )	
    $('div.txt_username').fadeIn('medium');
    $(document).bind('focusin.txt_username click.txt_username',function(e) {
        if ($(e.target).closest('.txt_username, #txt_username').length) return;
        $(document).unbind('.txt_username');
        $('div.txt_username').fadeOut('medium');
    });
});
$('div.txt_username').hide();

$('#txt_password').focus(function() {
if( !validatePassword(txt_password.value) )	
    $('div.txt_password').fadeIn('medium');
    $(document).bind('focusin.txt_password click.txt_password',function(e) {
        if ($(e.target).closest('.txt_password, #txt_password').length) return;
        $(document).unbind('.txt_password');
        $('div.txt_password').fadeOut('medium');
    });
});
$('div.txt_password').hide();

$('#txt_rpassword').focus(function() {
if( !equalPasswords(txt_password.value,txt_rpassword.value) )	
    $('div.txt_rpassword').fadeIn('medium');
    $(document).bind('focusin.txt_rpassword click.txt_rpassword',function(e) {
        if ($(e.target).closest('.txt_rpassword, #txt_rpassword').length) return;
        $(document).unbind('.txt_rpassword');
        $('div.txt_rpassword').fadeOut('medium');
    });
});
$('div.txt_rpassword').hide();
