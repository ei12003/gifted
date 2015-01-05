<?php

/* All database queries associated with an User Inventory. */

function getUserInventory($user_id) {
	global $conn;
	$stmt = $conn->prepare('SELECT Itens.id,Itens.name,Itens.img_location,Itens.part,Itens.description
		FROM MemberInventory JOIN Itens ON Itens.id=MemberInventory.itenId
		WHERE MemberInventory.memberid = ? ');
    $stmt->execute(array($user_id));
    $result = $stmt->fetchAll();    
	return $result;
}
?>