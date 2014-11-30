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
    $result = $stmt->fetchAll();    
	return $result;
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
    $result = $conn->lastInsertId();
	return $result;
}

function addExerciseToSet($exid,$setid){
	global $conn;
	$query = "insert into ExerciseSet (setId,exerciseId) values (?,?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($setid,$exid));
    $result = $conn->lastInsertId();
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

function createSet($itemid){

	global $conn;
	$query = "insert into Sets (itenID) values (?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($itemid));
    $result = $conn->lastInsertId();
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
	$query = "insert into ClassExerciseSet (setId,classId) values (?,?)";
	$stmt = $conn->prepare($query);
    $stmt->execute(array($setid,$classid));
    $result = $stmt->rowCount();
	return $result; 
}

?>