<?php

function getClassName($class_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT name FROM Classes WHERE id = ?');
    $stmt->execute(array($class_id));
    $result = $stmt->fetch();    
	return $result;
}

function getUserClasses($user_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT Classes.name, Classes.id FROM Classes,ClassMember WHERE ClassMember.memberId = ? AND ClassMember.classId = Classes.id GROUP BY Classes.id');
    $stmt->execute(array($user_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getScoreInClass($user_id,$class_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT score FROM ClassMember WHERE memberId = ? AND classId = ?');
    $stmt->execute(array($user_id,$class_id));
    $result = $stmt->fetch();
	return $result;
  }
function getRankedClass($class_id){
	global $conn;
	$stmt = $conn->prepare('SELECT Members.first_name, Members.last_name, memberId, score FROM ClassMember,Members WHERE Members.id = ClassMember.memberId AND classId = ?');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();
	return $result;
}

function getStudentsIDFromClass($class_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT Members.id FROM Members,Classes,ClassMember WHERE ClassMember.memberId = Members.id AND ClassMember.classId = ? AND Members.usertype = "student" ORDER BY Members.id');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getStudentEventsClass($class_id){
	global $conn;
	$stmt = $conn->prepare('SELECT MemberEvents.memberId, MemberEvents.description FROM MemberEvents,Members WHERE MemberEvents.memberId = Members.id AND MemberEvents.classId = ? AND Members.usertype = "student" ORDER BY Members.id');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getNumStudentsClass($class_id){
	global $conn;
	$stmt = $conn->prepare('SELECT COUNT(*) as count
   							FROM ClassMember 
							where ClassMember.classId = ?');
    $stmt->execute(array($class_id));
    $result = $stmt->fetch();    
	return $result['count'];
} 

function getClassTotalScore($class_id){
	global $conn;

	$query = "SELECT SUM(score) as totalscore FROM ClassMember WHERE classId = ?";
	$stmt = $conn->prepare($query);
	$stmt->execute(array($class_id));
	$result = $stmt->fetch(); 
	
	return $result['totalscore'];
} 
