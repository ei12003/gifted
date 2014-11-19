<?php

function createMember() {
	global $conn;
	$query = 'INSERT INTO "Member" (username,first_name,last_name,birth_date,gender,email,country,password,privileges)
				 VALUES (\''.$_POST['username'].'\',
						 \''.$_POST['first_name'].'\',
						 \''.$_POST['last_name'].'\',
						 \''.$_POST['birth_date'].'\',
						 \''.$_POST['gender'].'\',
						 \''.$_POST['email'].'\',
						 \''.$_POST['country'].'\',
						 \''.$_POST['password'].'\',
						 \''.$_POST['type'].'\',
						 \'Member\')';
						
	$conn->query($query);

  }
  
function updateAvatar($url,$username) {
	global $conn;
	$query = 'UPDATE "Member" SET avatar_url = \''.$url.'\' WHERE username= \''.$username.'\'';
	$conn->query($query);
}

function deleteUser() {
	global $conn;
	$query = 'DELETE FROM "Member" WHERE username = \''.$_GET['user'].'\'';
	$conn->query($query);
}

function getUser() {
	global $conn;
	$stmt = $conn->prepare('SELECT username, avatar_url, type FROM "Member" WHERE username = ? AND password = ?');
    $stmt->execute(array($_POST['username'],$_POST['password']));
    $result = $stmt->fetch();    

	return $result;
}

function editUser() {
	global $conn;
	$query = 'UPDATE "Member" SET username = \''.$_POST['username'].'\' ,
									  first_name = \''.$_POST['first_name'].'\' ,
									  last_name = \''.$_POST['last_name'].'\' ,
									  birth_date = \''.$_POST['birth_date'].'\' ,
									  gender = \''.$_POST['gender'].'\' ,
									  email = \''.$_POST['email'].'\' ,
									  country = \''.$_POST['country'].'\'  WHERE username= \''.$_POST['username'].'\'';
	$conn->query($query);
}

function getMemberInfo($username) {
global $conn;

	$query = 'SELECT username,first_name,last_name,avatar_url,birth_date,gender,email,country,type FROM "Member" WHERE username = \'' . $username . '\'';
  	$result = $conn->query($query);

	return $result;
}

function getMemberInfoByEmail($email) {
global $conn;

	$query = 'SELECT username,first_name,last_name,avatar_url,birth_date,gender,email,country,password,privileges,publico FROM "Member" WHERE email = \'' . $email . '\'';
  	$result = $conn->query($query);

	return $result->fetch();
}


function getAllMembers(){
global $conn;
	$query = 'SELECT username,first_name,last_name,avatar_url,birth_date,gender,email,country, type FROM "Member"';
  	$result = $conn->query($query);

	return $result;

}

