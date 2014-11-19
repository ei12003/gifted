<?php

session_start();
if (!empty($_SERVER['HTTP_REFERER']))
			$url=$_SERVER['HTTP_REFERER'];
else
			$url = "../index.php";
session_destroy();
header("Location: ".$url);
?>