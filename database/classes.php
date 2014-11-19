<?php

function getClassesByUser(username) {
	global $conn;
	$stmt = $conn->prepare('SELECT SMTH FROM SMTH WHERE username = ?');
    $stmt->execute(array($_POST['username']));
    $result = $stmt->fetch();    

	return $result;
}

function getClass() {
	global $conn;
	$stmt = $conn->prepare('SELECT SMTH FROM SMTH WHERE SMTH = ?');
    $stmt->execute(array(SMTH));
    $result = $stmt->fetch();    

	return $result;
}

function createClass() {
	global $conn;
	$query = 'INSERT INTO "Class" (SMTH,SMTH)
				 VALUES (\''.$_POST['SMTH'].'\',
						 \''.$_POST['SMTH'].'\',
						 
						 )';
						
	$conn->query($query);

  }