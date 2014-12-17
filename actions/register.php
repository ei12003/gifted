<?php
<?php
include_once('../config/init.php');
include_once('../database/members.php');
  
if (!isset($_SESSION['username'])){
	if (isset($_POST['first_name'])
		&& isset($_POST['last_name'])
		&& isset($_POST['email'])
		&& isset($_POST['birth_date'])
		&& isset($_POST['gender'])
		&& isset($_POST['usertype'])
		&& isset($_POST['password'])
		&& isset($_POST['confpass'])
		&& isset($_POST['username'])) {
		
		$user = getUserByUsername($_POST['username']);
		if(empty($user)){
			if(strcmp($_POST['confpass'],$_POST['password'])==0){
				$result=insertUser($_POST['first_name'], $_POST['last_name'],
						$_POST['email'], $_POST['birth_date'],
						$_POST['gender'], $_POST['usertype'],
						$_POST['password'], $_POST['username']);
						
				if($result<0){
					$_SESSION['error_messages'] = "Error.";
					header("Location: ".$_SERVER['HTTP_REFERER']);
				}
				else{
					$_SESSION['usertype'] = $_POST['usertype'];
					$_SESSION['userid'] = $result;
					$_SESSION['username'] = $_POST['username'];
					
					header("Location: ../index.php");
				}
			}
			else{
				$_SESSION['error_messages'] = "Passwords don't match.";
				header("Location: ".$_SERVER['HTTP_REFERER']);
			}
				
		}
		else{
			$_SESSION['error_messages'] = "That username already exists.";
			header("Location: ".$_SERVER['HTTP_REFERER']);
		}
				
	}
}


?>
 

?>