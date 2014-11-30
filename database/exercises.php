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

function createExercise(){

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

function createSet(){

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


?>