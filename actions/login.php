<? 

include_once('../config/init.php');
include_once('../database/members.php');
  
if (!isset($_SESSION['login'])) {
    $_SESSION['login'] = null;
}
	
	if (isset($_POST['username']) && isset($_POST['password'])) {
		
	$row=getUser();	
		
	if(!$row){

		$_SESSION['login'] = null;
		header("Location: ../index.php");
	}
	else{
		$_SESSION['avatar_url'] = $row['avatar_url'];
		$_SESSION['login'] = $_POST['username'];
		
		if (!empty($_SERVER['HTTP_REFERER']))
			header("Location: ".$_SERVER['HTTP_REFERER']);
		else
			header("Location: ../index.php");
	
	}
			
	}
?>
 
