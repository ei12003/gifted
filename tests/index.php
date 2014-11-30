<?php

	include_once('../config/init.php');
  error_reporting(E_ALL);
	include_once('../database/classes.php');
  include_once('../database/inventory.php');
  include_once('../database/store.php');
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
    echo "<h3>Inventory</h3>";
     $user_id=7;
       $query = getUserInventory($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getUserInventory('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";

          $user_id=8;
       $query = getUserInventory($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getUserInventory('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
/*
     $userid=3;$itemid=1;
       $query = buyItem($userid,$itemid,0);
       echo '<p></p><input type="checkbox" class="trigger" /> (for himself)buyItem('.$userid.','.$itemid.',0): '.$query.' points left (failed if -1)</div></p>';

     $userid=2;$itemid=1;
     $offer_userid=8;
       $query = buyItem($userid,$itemid,$offer_userid=8);
       echo '<p></p><input type="checkbox" class="trigger" /> (offering)buyItem('.$userid.','.$itemid.','.$offer_userid.'): '.$query.' points left (failed if -1)</div></p>';
*/

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
       $query = getStudentsFromClass($class_id);
	   echo '<p></p><input type="checkbox" class="trigger" /> getStudentsFromClass('.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
       
       $userid=6;
       $query = getStudentEventsClass($userid);
     echo '<p></p><input type="checkbox" class="trigger" /> getStudentEventsClass('.strval($userid).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
       
       $class_id=2;
       $query = getStudentsEventsClass($class_id);
	   echo '<p></p><input type="checkbox" class="trigger" /> getStudentsEventsClass('.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
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

	
     
		$class_id=1;
       $query = getClassTotalScore($class_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getClassTotalScore('.strval($class_id).'): ('.$query.')<div class="spoiler"></div></p>';
	   
	   $class_id=1;
       $query = getRankedClass($class_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getRankedClass('.strval($class_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";

     $class_name='Física';
     $userid=2;
       $query = createClass($userid,$class_name);
       echo '<p></p><input type="checkbox" class="trigger" /> createClass('.$userid.','.$class_name.'): '.$query.' id created.</div></p>';
     
     $id = $query;
    //  $query = deleteClass($id);
     // echo '<p></p><input type="checkbox" class="trigger" /> deleteClass(...): '.$query.' row(s) affected</div></p>';
     

     $userid=3;$classid=31;
       $query = addUserToClass($userid,$classid);
       echo '<p></p><input type="checkbox" class="trigger" /> addUserToClass('.$userid.','.$classid.'): '.$query.' row(s) affected</div></p>';
    

      $query = removeUserFromClass($userid,$classid);
      echo '<p></p><input type="checkbox" class="trigger" /> removeUserFromClass(...): '.$query.' row(s) affected</div></p>';
     


?>
