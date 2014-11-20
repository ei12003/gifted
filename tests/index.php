<?php

	include_once('../config/init.php');
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
<?
	   echo "<h3>CLASSES GET</h3>";
	   $user_id=1;
       $query = getClassName($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getClassName('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
       
       $user_id=31;
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
	   $user_id=13;
       $query = getUser($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getUser('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
	   
	   $user_id=47;
       $query = getUserEvents($user_id);
       echo '<p></p><input type="checkbox" class="trigger" /> getUserEvents('.strval($user_id).'): ('.count($query).' )<div class="spoiler">';
       print_r($query);
       echo "</div></p>";
     
    

?>
