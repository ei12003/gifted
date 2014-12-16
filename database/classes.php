<?php


function getClassName($class_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT name FROM Classes WHERE id = ?');
    $stmt->execute(array($class_id));
    $result = $stmt->fetch();    
	return $result;
}

function getUserClasses($user_id) { // US07
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
function getRankedClass($class_id){ //US06/US24
	global $conn;
	$stmt = $conn->prepare('SELECT Members.first_name, Members.last_name, memberId, score FROM ClassMember,Members WHERE Members.id = ClassMember.memberId AND classId = ?');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();
	return $result;
}

function getStudentsFromClass($class_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT DISTINCT Members.id, Members.first_name, Members.last_name, ClassMember.score FROM Members,Classes,ClassMember WHERE ClassMember.memberId = Members.id AND ClassMember.classId = ? AND Members.usertype = "student" ORDER BY Members.id');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getTeacherFromClass($class_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT DISTINCT Members.id, Members.first_name, Members.last_name, ClassMember.score FROM Members,Classes,ClassMember WHERE ClassMember.memberId = Members.id AND ClassMember.classId = ? AND Members.usertype = "teacher" ORDER BY Members.id');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getStudentsEventsClass($class_id){ //US15
	global $conn;
	$stmt = $conn->prepare('SELECT Members.first_name, Members.last_name, MemberEvents.memberId, MemberEvents.description FROM MemberEvents,Members WHERE MemberEvents.memberId = Members.id AND MemberEvents.classId = ? AND Members.usertype = "student" ORDER BY Members.id');
    $stmt->execute(array($class_id));
    $result = $stmt->fetchAll();    
	return $result;
}

function getStudentEvents($userid){ //US15
	global $conn;
	$stmt = $conn->prepare('SELECT MemberEvents.description, Classes.name FROM Classes,MemberEvents WHERE MemberEvents.memberId = ? AND MemberEvents.classId=Classes.id');
    $stmt->execute(array($userid));
    $result = $stmt->fetchALL();    
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

function createClass($userid,$class_name){ //US08

	global $conn;
	
	try{ 
        $query = "insert into Classes (name) values (?)";
		$stmt = $conn->prepare($query);
    	$stmt->execute(array($class_name));
    	$result = $conn->lastInsertId();
    	$classid=$result;
    	addUserToClass($userid,$classid);
		return $result;	
    } 
    catch(PDOException $exception){ 
        return $exception->getMessage(); 
	   return -1;
    } 

}

function deleteClass($classid){//US05

	global $conn;
	$query = "DELETE FROM Classes WHERE id = ?";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($classid));
    $result = $stmt->rowCount();    
	return $result;

}

function addUserToClass($userid,$classid){//US09

 global $conn;

 
 $stmt = $conn->prepare('SELECT * FROM Members WHERE id = ?');
    $stmt->execute(array($userid));
    $result = $stmt->fetchAll();   
    if(count($result)>0){
     try {
      $query = "INSERT INTO ClassMember (memberId,classId,score) VALUES (?,?,0)";
   $stmt = $conn->prepare($query);
      $stmt->execute(array($userid,$classid));
      $result = $stmt->rowCount();  
     } 
      catch( PDOException $Exception ) {
    
  $result = $Exception->getCode();

 }
 }
    else
     $result = 0;
 
 return $result;

}

function removeUserFromClass($userid,$classid){//US23
	global $conn;
	$query = "DELETE FROM ClassMember WHERE classId=? AND memberId = ?";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($classid,$userid));
    $result = $stmt->rowCount();    
	return $result;
}

function givePointsToUser($amount,$classid,$userid){
	
	global $conn;
	$query = "UPDATE ClassMember SET score = (SELECT score FROM ClassMember WHERE classid = ? AND memberId = ?)+? WHERE classid = ? AND memberId = ?";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($classid,$userid,$amount,$classid,$userid));
    $result = $stmt->rowCount();    
	return $result;
}