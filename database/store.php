<?php

function getStore() {
	global $conn;
	$stmt = $conn->prepare('SELECT ItensStore.price, Itens.id,Itens.name,Itens.img_location,Itens.description
		FROM ItensStore JOIN Itens ON Itens.id=ItensStore.itenId');
    $stmt->execute();
    $result = $stmt->fetchAll();    
	return $result;
}


function buyItem($userid,$itemid) {
	global $conn;
	
	//Check if User can afford it.
	$stmt = $conn->prepare('SELECT price FROM ItensStore WHERE ItensStore.itenId= ?');
    $stmt->execute(array($itemid));
    $result = $stmt->fetch();    
    $price = $result['price'];
    
    $stmt = $conn->prepare('SELECT points FROM Members WHERE Members.id= ?');
    $stmt->execute(array($userid));
    $result = $stmt->fetch();    
	$user_points = $result['points'];

	$points_left = $user_points - $price;
	if($points_left<=0)
		return -1;
	else{
		$stmt = $conn->prepare('UPDATE Members SET points = ? WHERE Members.id= ?');
    	$stmt->execute(array($points_left,$userid));
    	$result = $stmt->fetch();    
		if($stmt->rowCount()<1)
			return -1;
		$stmt = $conn->prepare('INSERT INTO MemberInventory (memberId, itenId) VALUES (?, ?)');
    	$stmt->execute(array($userid,$itemid));
    	if($stmt->rowCount()<1)
			return -1;
		echo "oi";
		return $points_left;
	}
}


?>