<?php

/* All database queries associated with the Store. */

function getStore() {
	global $conn;
	$stmt = $conn->prepare('SELECT price, id,name,img_location,description FROM Itens');
    $stmt->execute();
    $result = $stmt->fetchAll();    
	return $result;
}

function getStoreSize() {
	global $conn;
	$stmt = $conn->prepare('SELECT COUNT(*) as size FROM Itens');
    $stmt->execute();
    $result = $stmt->fetch();    
	return $result['size'];
}


function buyItem($userid,$itemid,$offer_userid) {
	global $conn;
	
	// Check if User can afford it.
	$stmt = $conn->prepare('SELECT price FROM Itens WHERE Itens.id= ?');
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

		// Payment for the item. 
		$stmt = $conn->prepare('UPDATE Members SET points = ? WHERE Members.id= ?');
    	$stmt->execute(array($points_left,$userid));
    	$result = $stmt->fetch();    
		if($stmt->rowCount()<1)
			return -1;
		$stmt = $conn->prepare('INSERT INTO MemberInventory (memberId, itenId) VALUES (?, ?)');
    	
    	// Checks if it's an offer or not.
    	if($offer_userid>0)
    		$stmt->execute(array($offer_userid,$itemid));
    	else
    		$stmt->execute(array($userid,$itemid));
    	if($stmt->rowCount()<1)
			return -1;
		
		$_SESSION['userpoints'] = $points_left;
		return $points_left;
	}
}




?>