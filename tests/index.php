<?php

	include_once('../config/init.php');
  error_reporting(E_ALL);
	include_once('../database/classes.php');
	include_once('../database/members.php');
?>
<style>
body {
  background-color:#ccc;
  padding:30px;
}

input.trigger {
  display:inline-block;
  margin:0px;
  padding:0px;
}

.spoiler {
  background-color:white;
  padding:15px 30px;
  margin:10px 0px 0px;
  display:none;
}

input.trigger:checked + .spoiler {
  display:block;
}";
</style>
<?php
	   echo "<h3>CLASSES GET</h3>";
	   $user_id=1;
       $query = getClassName($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getClassName('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
       
       $user_id=2;
	   $query = getUserClasses($user_id);
	   echo '<p></p><input type="checkbox" class="trigger" /> getUserClasses('.strval($user_id).'): ('.count($query).' )<div class="spoiler"> ';
       print_r($query);
       echo "</div></p>";
       
       $user_id=26; $class_id=1;
       $query = getScoreInClass($user_id,$class_id);
	   echo '<p></p><input type="checkbox" class="trigger" /> getScoreInClass('.strval($user_id).','.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
       
       $class_id=3;
       $query = getStudentsIDFromClass($class_id);
	   echo '<p></p><input type="checkbox" class="trigger" /> getStudentsIDFromClass('.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
       
       $class_id=2;
       $query = getStudentEventsClass($class_id);
	   echo '<p></p><input type="checkbox" class="trigger" /> getStudentEventsClass('.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
     
	   echo "<h3>MEMBERS GET</h3>";
	   $user_id=1;
       $query = getUser($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getUser('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
	   
	   $user_id=47;
       $query = getUserEvents($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getUserEvents('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
     
     $username='bhayes0'; $password='J5eFdrH3G8HU';
       $query = getUserWithPass($username,$password);
       echo '<p></p><input type="checkbox" class="trigger" /> getUserWithPass('.strval($username).','.strval($password).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
     
     $username='bhayes0'; $password='J5eFdrH3G8HU';
     $first_name='Benjamin'; $last_name='Hayes'; $email='bhayes0@narod.ru'; 
     $id = '1';
      //http://localhost/gifted/api/editProfile.php?username=bhayes0&first_name=Benjamin&last_name=Hayes&email=bhayes0@narod.ru&password=J5eFdrH3G8HU&userid=1
       $query = editProfile($username,$first_name,$last_name,$email,$password,$id);
       echo '<p></p><input type="checkbox" class="trigger" /> editProfile(...): '.$query.' row(s) affected</div></p>';
     
     $class_id='1';
       $query = getNumStudentsClass($class_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getNumStudentsClass('.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
     
     $username='diogo'; $password='diogop';
     $first_name='diogof'; $last_name='diogol'; $email='diogo@narod.ru';
	 $usertype="student"; $gender="Male"; $birth_date='7/8/2014';
       $query = insertUser($first_name, $last_name, $email, $birth_date, $gender, $usertype, $password, $username);
       echo '<p></p><input type="checkbox" class="trigger" /> insertUser(...): '.$query.' id created.</div></p>';
     
     
     $id = $query;
       //$query = deleteUser($id);
      // echo '<p></p><input type="checkbox" class="trigger" /> deleteUser(...): '.$query.' row(s) affected</div></p>';

	


?>
