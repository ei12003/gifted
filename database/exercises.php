<?php

function getSet($setid) {
	global $conn;
	$stmt = $conn->prepare(
		'SELECT Exercises.id as exid
		FROM ExerciseSet JOIN Exercises ON ExerciseSet.exerciseId = Exercises.id
		WHERE ExerciseSet.setId = ? ORDER BY Exercises.id');
    $stmt->execute(array($setid));
    $result = $stmt->fetchAll();    
	return $result;
}


function getSetName($setid) {
	global $conn;
	$stmt = $conn->prepare(
		'SELECT name from Sets where id = ?');
    $stmt->execute(array($setid));
    $result = $stmt->fetch();   
	return $result['name'];
}

function getExerciseName($setid) {
	global $conn;
	$stmt = $conn->prepare(
		'SELECT name from Exercises where id = ?');
    $stmt->execute(array($setid));
    $result = $stmt->fetch();   
	return $result['name'];
}


function getSetsClassTeach($setid,$classid,$userid) {
	global $conn;
	$stmt = $conn->prepare('SELECT Sets.id from ClassExerciseSet, Sets WHERE Sets.id = ? and Sets.id=ClassExerciseSet.setId and ClassExerciseSet.classId = ? and Sets.teacher_id=?');
    $stmt->execute(array($setid,$classid,$userid));
    $result = $stmt->fetchAll();    
	return $result;
}

function getSetsIDFromClass($classid) {
	global $conn;
	$stmt = $conn->prepare('SELECT ClassExerciseSet.setId, Sets.name, ClassExerciseSet.classId from ClassExerciseSet INNER JOIN Sets ON Sets.id=ClassExerciseSet.setId where ClassExerciseSet.classId = ?');
    $stmt->execute(array($classid));
    $result = $stmt->fetchAll();    
	return $result;
}

function getSetsFromTeacher($userid) {
	global $conn;
	$stmt = $conn->prepare('SELECT id,name from Sets where teacher_id=?');
    $stmt->execute(array($userid));
    $result = $stmt->fetchAll();    
	return $result;
}


function getExercise($exeid) {
	global $conn;
	$stmt = $conn->prepare(
		'SELECT ExerciseOptions.id as optid, ExerciseOptions.description
		FROM Exercises JOIN ExerciseOptions ON Exercises.id = ExerciseOptions.exerciseId
		WHERE Exercises.Id = ? ORDER BY ExerciseOptions.id');
    $stmt->execute(array($exeid));
    $result = $stmt->fetchAll();    
	return $result;
}

function getRightAnswer($exeid){
	global $conn;
	$stmt = $conn->prepare(
		'SELECT optionId
		FROM ExerciseRightAnswer JOIN Exercises ON Exercises.id=ExerciseRightAnswer.exerciseid
		WHERE Exercises.Id = ? 
		');
    $stmt->execute(array($exeid));
    $result = $stmt->fetch();    
	return $result['optionId'];
}

function createOption($exid,$description){
	global $conn;
	$query = "insert into ExerciseOptions (exerciseId,description) values (?,?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($exid,$description));
    $result = $conn->lastInsertId();
	return $result;
}

function setRightAnswer($exid,$optid){
	global $conn;
	$query = "insert into ExerciseRightAnswer (exerciseId,optionId) values (?,?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($exid,$optid));
    $result = $stmt->rowCount();  
	return $result;
}

function addExerciseToSet($exid,$setid){
	global $conn;
	$query = "insert into ExerciseSet (setId,exerciseId) values (?,?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($setid,$exid));
    $result = $stmt->rowCount();    
	return $result;	
}

function createExercise($description){
	global $conn;
	$query = "insert into Exercises (name) values (?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($description));
    $result = $conn->lastInsertId();
	return $result;
}

function deleteExercise($exid){
	global $conn;
	$stmt = $conn->prepare(
		'DELETE FROM Exercises
		WHERE id =?');
    $stmt->execute(array($exid));
    $result = $stmt->rowCount();    
	return $result;
}

function createSet($name,$userid){
	global $conn;
	try{ 
		$query = "insert into Sets (name,teacher_id,itenID) values (?,?,0) ";
		$stmt = $conn->prepare($query);
	    $stmt->execute(array($name,$userid));
	    $result = $conn->lastInsertId();
	}
	catch(PDOException $exception){ 
        echo $exception->getMessage(); 
	   return -1;
    } 

	return $result;        	
}

function deleteSet($setid){
	global $conn;
	$stmt = $conn->prepare(
		'DELETE FROM Sets
		WHERE id =?');
    $stmt->execute(array($setid));
    $result = $stmt->rowCount();    
	return $result;
}

function addSetToClass($setid,$classid){
	global $conn;
	$query = "INSERT OR IGNORE INTO ClassExerciseSet (setId,classId) values (?,?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($setid,$classid));
    $result = $stmt->rowCount();
	return $result; 
}


function removeSetFromClass($setid,$classid){//US23
	global $conn;
	$query = "DELETE FROM ClassExerciseSet WHERE classId=? AND setId = ?";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($classid,$setid));
    $result = $stmt->rowCount();    
	return $result;
}


?>