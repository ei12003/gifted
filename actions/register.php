<?php
<?php
include_once('../config/init.php');
include_once('../database/members.php');
  
 // echo $_POST['username']; echo $_POST['password'];
// echo 'session:'.$_SESSION['username'];
// insertUser($first_name, $last_name, $email, $birth_date, $gender, $usertype, $password, $username){
if (!isset($_SESSION['username'])){
	
	if (isset($_POST['first_name'])
		&& isset($_POST['last_name'])
		&& isset($_POST['email'])
		&& isset($_POST['birth_date'])
		&& isset($_POST['gender'])
		&& isset($_POST['usertype'])
		&& isset($_POST['password'])
		&& isset($_POST['username'])) {
			
		$result=insertUser($_POST['first_name'], $_POST['last_name'],
						$_POST['email'], $_POST['birth_date'],
						$_POST['gender'], $_POST['usertype'],
						$_POST['password'], $_POST['username']);
		
		if($result<0){
			//echo "failed";
			header("Location: ../index.php");
		}
		else{
			$_SESSION['usertype'] = $_POST['usertype'];
			$_SESSION['userid'] = $result;
			$_SESSION['username'] = $_POST['username'];
			
			if (!empty($_SERVER['HTTP_REFERER']))
				header("Location: ".$_SERVER['HTTP_REFERER']);
				//echo "back";
			else
				//echo "home";
				header("Location: ../index.php");
		
		}
				
	}
}


?>
 

?>