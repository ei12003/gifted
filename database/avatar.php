<?php
function avatarselection($memberId,$part0,$part1,$part2) {
	global $conn;

	$stmt = $conn->prepare('UPDATE AvatarUser SET   $part0=?,
													$part1=?,
													$part2=? 
													where 
													$memberId = ? ');
     $stmt->execute(array($part0,$part1,$part2,$memberId));
       $result = $stmt->rowCount();    
	return $result;
}

?>