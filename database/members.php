<?php

function getUser($user_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT first_name, last_name, email, birth_date, gender, username FROM Members WHERE id = ? ORDER BY id');
    $stmt->execute(array($user_id));
    $result = $stmt->fetch();    
	return $result;
}

function getUserEvents($user_id){
	global $conn;
	$stmt = $conn->prepare('SELECT description FROM MemberEvents WHERE memberId = ?');
    $stmt->execute(array($user_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getUserWithPass($username,$password){
	global $conn;
	$stmt = $conn->prepare('SELECT usertype,id FROM Members WHERE username = ? AND password = ?');
    $stmt->execute(array($username,$password));
    $result = $stmt->fetch();    
	return $result;
}

function editProfile($username,$first_name,$last_name,$email,$password,$id){
	global $conn;
	$stmt = $conn->prepare('UPDATE Members SET username = ?, 
												first_name = ?, 
												last_name = ?,
												email = ?, 
												password = ? WHERE id = ?');
    $stmt->execute(array($username,$first_name,$last_name,$email,$password,$id));
    $result = $stmt->rowCount();    
	return $result;
}

function insertUser($first_name, $last_name, $email, $birth_date, $gender, $usertype, $password, $username){
	global $conn;
	
	
	try{ 
        $query = "INSERT INTO Members (first_name, last_name, email, birth_date, gender, usertype, password, username)
						   VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	
	$stmt = $conn->prepare($query);
    $stmt->execute(array($first_name, $last_name, $email, $birth_date, $gender, $usertype, $password, $username));
    $result = $conn->lastInsertId(); 
	return $result;	
    } 
    catch(PDOException $exception){ 
       // return $exception->getMessage(); 
	   return -1;
    } 
	
}

function deleteUser($userid){

	global $conn;
	$query = "DELETE FROM Members WHERE id = ?";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($userid));
    $result = $stmt->rowCount();    
	return $result;

}


