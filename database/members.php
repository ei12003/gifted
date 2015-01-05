<?php

/* All database queries associated with the Members (teachers or students). */

function searchUser($search_query) {
	global $conn;
	$stmt = $conn->prepare("SELECT id, first_name, last_name, email, birth_date, gender, username FROM Members
					WHERE id LIKE '%' || ? || '%' OR 
							first_name LIKE '%' || ? || '%' OR
							last_name LIKE '%' || ? || '%' OR
							username LIKE '%' || ? || '%' OR
							email LIKE '%' || ? || '%' ORDER BY id");
    $stmt->execute(array($search_query,$search_query,$search_query,$search_query,$search_query));
    $result = $stmt->fetchAll();    
	return $result;
}

function getUserByUsername($username) {
	global $conn;
	$stmt = $conn->prepare('SELECT id FROM Members WHERE username = ?');
    $stmt->execute(array($username));
    $result = $stmt->fetch();
	return $result['id'];
}

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


function getUserPoints($userid){
	global $conn;
	$stmt = $conn->prepare('SELECT points FROM Members WHERE id = ?');
    $stmt->execute(array($userid));
    $result = $stmt->fetch();    
	return $result['points'];
}

function getUserWithPass($username,$password){
	global $conn;
	$stmt = $conn->prepare('SELECT usertype,id,points FROM Members WHERE username = ? AND password = ?');
    $stmt->execute(array($username,$password));
    $result = $stmt->fetch();    
	return $result;
}

function editProfile($username,$first_name,$last_name,$email,$password,$id){
	global $conn;
	
	try{ 
        $query = "UPDATE Members SET username = ?, first_name = ?, last_name = ?, email = ?, password = ? WHERE id = ?";
	
	$stmt = $conn->prepare($query);
    $stmt->execute(array($username,$first_name,$last_name,$email,$password,$id));
    $result = $stmt->rowCount(); 
	return $result;	
    } 
    catch(PDOException $exception){ 

	   return -1;
    }
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

	   return -1;
    } 
	
}



function addUserEvent($userid,$classid,$event){
	global $conn;
    $query = "INSERT INTO MemberEvents (memberId, classId, description)
						   VALUES (?, ?, ?)";
	
	$stmt = $conn->prepare($query);
    $stmt->execute(array($userid,$classid,$event));
    $result = $stmt->rowCount(); 
	return $result;	
}

function deleteUser($userid){

	global $conn;
	$query = "DELETE FROM Members WHERE id = ?";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($userid));
    $result = $stmt->rowCount();    
	return $result;

}

function getStudents() {

	global $conn;
	$sql = "SELECT id, first_name, last_name FROM Members WHERE usertype = 'student'";
	$query = $conn->query($sql);
	$result = $query->fetchAll();
	
	return $result;
}




