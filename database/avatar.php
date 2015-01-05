<?php

/* All database queries associated with a student avatar. */

function avatarSelection($memberId,$part0,$part1,$part2) {
	global $conn;

	$stmt = $conn->prepare('UPDATE AvatarUser SET  part0=?,
													part1=?,
													part2=? 
													where 
													memberId = ? ');
     $stmt->execute(array($part0,$part1,$part2,$memberId));
       $result = $stmt->rowCount();    
	return $result;
}

function getAvatarSelection($memberId) {
	global $conn;

	$stmt = $conn->prepare('SELECT part0,part1,part2 FROM AvatarUser where memberId = ?');
    $stmt->execute(array($memberId));
    $result = $stmt->fetch();    
	return $result;
}

function getItem($itemid){
	global $conn;

	$stmt = $conn->prepare('SELECT * FROM Itens where id = ?');
    $stmt->execute(array($itemid));
    $result = $stmt->fetch();    
	return $result;

}

?>