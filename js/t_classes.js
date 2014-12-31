$(document).ready(function () {



	jquery_events();
	
	
	
	
	


	$("#createClass").click(function() {
		bootbox.prompt("Class name?", function(result) {
			if (result == "") {
				bootbox.alert("Invalid Class name.");    
			} else if (result != null) {      
				createClass(result);
				
			}
		});
	});
	

	
	
	
	
	
});

function jquery_events() {

$('.select2-container').remove();
$('.select2Sets').empty();
$('.select2Sets').append('<option value=""></option>');

$('.searchStudents').empty();
$('.searchStudents').append('<option value=""></option>');
	loadUsers();
	loadSets();


	
	$(".setsTable tbody>tr").unbind("click").click( function() {
		var set_row = $('td', this).html();
		var setID = set_row.substring(0,set_row.lastIndexOf("."));
		var setName = set_row.substring(set_row.lastIndexOf(".")+1);

		var id = $(this).parent().parent().attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);

		$row = $(this);

		
		bootbox.dialog({
			message: setID + ". " + setName,
			backdrop: false,
			buttons: {
				cancel: {
					label: "Cancel",
					className: "btn-default"
				},
				exercise: {
					label: "View",
					className: "btn-default",
					callback: function() {
						window.location.href = "./t_exercises.php#"+ setID;	
					}
				},
				remove: {
					label: "Remove",
					className: "btn-danger",
					callback: function() {
						removeSetFromClass(classID,setID,$row);
					}
				}
			}
		});

		
	});


	$(".studentTable tbody>tr").unbind("click").click( function() {
		
		var studentID = $(':nth-child(1)', this).html();
		var studentName = $(':nth-child(2)', this).html();

		var id = $(this).parent().parent().attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		$row = $(this);
		
		bootbox.dialog({
			message: studentID + ". " + studentName,
			backdrop: false,
			buttons: {
				cancel: {
					label: "Cancel",
					className: "btn-default"
				},
				profile: {
					label: "View Profile",
					className: "btn-default",
					callback: function() {
						window.location.href = "../showprofile.php?id="+ studentID;	
					}
				},
				add: {
					label: "Add Points",
					className: "btn-success",
					callback: function() {
						bootbox.dialog({
							message: '<input class="spin_'+studentID+'" type="number" min="1" value="1"/>',

							buttons: {
								add: {
									label: "Add",
									className: "btn-default",
									callback: function() {
										
										$amount = $(".spin_"+studentID).val();
										addPoints($amount,studentID,classID);

									}
								}
							}

						});


					}
				},
				kick: {
					label: "Kick Student",
					className: "btn-danger",
					callback: function() {
						
						bootbox.dialog({
							message: "Are you sure you want to kick this student from the class?",
							buttons: {
								no: {
									label: "No",
									className: "btn-default"
								},
								yes: {
									label: "Yes",
									className: "btn-danger",
									callback: function() {
										kickStudent(classID, studentID, $row);
									}
								}
							}
						});
						
						
					}
				}
			}
		});
	});


	$(".setButton").unbind('click').click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		$(".setButton_"+classID).toggle();
		$("#table_set_"+classID).toggle();
		

	});


	$(".addSetButton").unbind('click').click(function() {
	
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		var input = $("#searchSets_" + classID).val();

		
		
		if (input != null && input != "") {
			addSet(classID, input);
		} else {
			$("#searchSets_" + classID).select2('open');
		}
	});


	$(".addStudentButton").unbind('click').click(function() {
	
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		var input = $("#searchStudents_" + classID).val();
		
		if (input != null && input != "") {
			addStudent(classID, input);
		} else {
			$("#searchStudents_" + classID).select2('open');
		}
	});
	
	$(".rmvClassButton").unbind('click').click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		bootbox.dialog({
			message: "Are you sure you want to delete this class?",
			buttons: {
				no: {
					label: "No",
					className: "btn-default"
				},
				yes: {
					label: "Yes",
					className: "btn-danger",
					callback: function() {
						deleteClass(classID);
					}
				}
			}
		});
	});

}

function loadSets() {
	
	$.get( "../../api/getSets.php", function( data ) {
		if (data == false) {
			alert("Unable to obtain Sets.");
			return;
		}
		//$(".searchSets").empty();
		var json = jQuery.parseJSON( data );

		for (i=0; i < json.length; i++) {
			var arr = json[i];
			var val = arr["id"];
			var txt = arr["id"] + ". " + arr["name"];
			
		$(".searchSets").append($('<option></option>').val(val).html(txt));
		}
		
		
		$('.select2Sets').select2();
	});

	
}


function loadUsers() {
	
	$.get( "../../api/getStudents.php", function( data ) {
		if (data == false) {
			alert("Unable to obtain Users.");
			return;
		}
	
		var json = jQuery.parseJSON( data );
		for (i=0; i < json.length; i++) {
			var arr = json[i];
			var val = arr["id"];
			var txt = arr["id"] + ". " + arr["first_name"] + " " + arr["last_name"];
			
			$(".searchStudents").append($('<option></option>').val(val).html(txt));
		}
		
		
		$('.select2').select2();
	});

	
}

function removeSetFromClass(classID,setID,row){
	$.get( "../../api/removeSetFromClass.php", { classid: classID, setid: setID} , function( data ) {
		if (data == true) {
			row.remove();
			bootbox.alert("Success.");
		} else {
			bootbox.alert("Unable to remove this set.");
		}
	});

}

function kickStudent(classID, studentID, row) {

	$.get( "../../api/removeStudent.php", { classid: classID, userid: studentID} , function( data ) {
		if (data == true) {
			points_deducted = parseInt(row.find('#score_'+classID+'_'+studentID).html());
			row.remove();
			
			$row = $("#classscore_" + classID);
			$num = parseInt($row.html()) - parseInt(points_deducted);
			$row.html($num);



			var classCount = parseInt($("#classCount_" + classID).html());
			$("#classCount_" + classID).html(classCount-1);
			
			bootbox.alert("Student was kicked from class.");
		} else {
			bootbox.alert("Unable to kick this student.");
		}
	});
	
}

function addSet(classID, setID) {
	$.get( "../../api/addSetToClass.php", { classid: classID, setid: setID} , function( data ) {
		var data_array = jQuery.parseJSON( data );
			
			
			if (data_array[0] == true) {
				var table = $("#table_set_" + classID);
				table.append("<tr><td>"+setID+"."+data_array[1]+"</td></tr>");
				jquery_events();
				bootbox.alert('Success.');

			}
			else
				bootbox.alert(data_array[1]);
			
		
	});
}

function addStudent(classID, studentID) {

	$.get( "../../api/addStudent.php", { classid: classID, userid: studentID} , function( data ) {
		var data_array = jQuery.parseJSON( data );
		
		if (data_array[0] == true) {
		
			var table = $("#table_" + classID);
			table.append("<tr><td>"+studentID+"</td><td>"+data_array[1]+"</td><td id='score_"+classID+"_"+studentID+"'>0</td></tr>");
			
			var classCount = parseInt($("#classCount_" + classID).html());
			
			$("#classCount_" + classID).html(classCount+1);
			jquery_events();
			
		} else {
			bootbox.alert(data_array[1]);
		}
	});
	
}

function addPoints(pts,studentID,classID){
	$.get( "../../api/addPointsAsTeacher.php", { amount: pts, classid: classID, userid: studentID} , function( data ) {
		var data_array = jQuery.parseJSON( data );
		
		if (data_array[0] == true) {
		
			bootbox.alert(data_array[1]);
			var $row = $("#score_" + classID + "_" + studentID);
			
			var $num = parseInt($row.html()) + parseInt(pts);
			$row.html($num);

			$row = $("#classscore_" + classID);
			$num = parseInt($row.html()) + parseInt(pts);
			$row.html($num);

			
		} else {
			bootbox.alert(data_array[1]);
		}
	});

}


function deleteClass(classID) {
	$.get( "../../api/deleteClass.php", { classid: classID} , function( data ) {
		if (data == 1) {
			$("#" + classID).remove();
		} else {
			bootbox.alert("Cannot remove this class.");
		}
	});
	
}

function createClass(className) {
	
	$.get( "../../api/createClass.php", { class_name: className} , function( data ) {
	
		var data_array = jQuery.parseJSON( data );
	
		if (data_array[0] == true) {
		
			var classID = data_array[1];
			
			//WITH SETS
			$("#classPanelGroup").append("<div id='"+classID+"' class='panel panel-default'>				<div class='panel-heading'>					<h4 class='panel-title'>						<span style='padding:10px;pointer-events: none;' class='pull-right'><i style='font-size:80%;'>Score:</i> <span id='classscore_"+classID+"'>0</span></span>						<a  data-toggle='collapse' href='#content_"+classID+"'>"+classID+". "+className+"<i style='font-size:80%;'><br><span id='classCount_"+classID+"'>0</span> Student(s)</i> </a>					</h4>				</div>				<div id='content_"+classID+"' class='panel-collapse collapse'>					<div class='panel-body'>									<select id= 'searchStudents_"+classID+"' class='select2 searchStudents' style='width:250px'>							<option value=''></option><!-- 							<option value='18'>18. Richard Riley</option>							<option value='19'>19. Jason Coleman</option>							<option value='20'>20. Kathryn Frazier</option>							<option value='21'>21. Arthur Lewis</option>							<option value='23'>23. Sandra Perez</option> -->						</select>							<button id='add_button_"+classID+"' type='button' class='btn btn-default addStudentButton'>							<span class='glyphicon glyphicon-plus' aria-hidden='true'></span> Add Student						</button>												<button id='rmv_button_"+classID+"' type='button' class='btn btn-danger pull-right rmvClassButton'>							<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Delete Class						</button>												<br><br>											<table id='table_"+classID+"' class='table table-striped table-condensed table-bordered studentTable'>							<thead>								<tr>									<th>#</th>									<th>Name</th>									<th>Score</th>								</tr>							</thead>							<tbody> 							</tbody>						</table>					<select id= 'searchSets_"+classID+"' class='select2Sets searchSets pull-right' style='width:250px'>							<option value=''></option><!-- 							<option value='18'>18. Richard Riley</option>							<option value='19'>19. Jason Coleman</option>							<option value='20'>20. Kathryn Frazier</option>							<option value='21'>21. Arthur Lewis</option>							<option value='23'>23. Sandra Perez</option> -->						</select>						<button id='addset_button_"+classID+"' type='button' class='btn btn-default addSetButton pull-right'>							<span class='glyphicon glyphicon-plus' aria-hidden='true'></span> Add Set						</button>										<button id='set_button_"+classID+"' type='button' class='btn btn-default pull-left setButton setButton_"+classID+"' style='margin-bottom:20px'>							<span id='set_glyph_"+classID+"' class='glyphicon glyphicon-zoom-in' aria-hidden='true'></span> <span id='set_text_"+classID+"'>Show Sets</span>						</button>						<button id='set_button_"+classID+"' type='button' class='btn btn-default pull-left setButton setButton_"+classID+"' style='display:none;margin-bottom:20px'>							<span id='set_glyph_"+classID+"' class='glyphicon glyphicon-zoom-out' aria-hidden='true'></span> <span id='set_text_"+classID+"'>Hide Sets</span>						</button>						<table id='table_set_"+classID+"' style='display:none;' class='table table-striped table-condensed table-bordered setsTable'>							<tbody>																				</tbody>						</table>						</div>				</div>			</div>");
			
			//WITHOUT SETS
			//$("#classPanelGroup").append("<div id='"+classID+"' class='panel panel-default'>				<div class='panel-heading'>					<h4 class='panel-title'>						<span style='padding:10px;pointer-events: none;' class='pull-right'><i style='font-size:80%;'>Score:</i> 0</span>						<a  data-toggle='collapse' href='#content_"+classID+"'>"+classID+". "+className+"<i style='font-size:80%;'><br><span id='classCount_"+classID+"'>0</span> Student(s)</i> </a>					</h4>				</div>				<div id='content_"+classID+"' class='panel-collapse collapse'>					<div class='panel-body'>									<input id= 'searchStudents_"+classID+"' class='searchStudents' type='text' list='userList' style='height:33px;color:black;padding-left:10px;'>								<button id='add_button_"+classID+"' type='button' class='btn btn-default addStudentButton'>							<span class='glyphicon glyphicon-plus' aria-hidden='true'></span> Add Student						</button>												<button id='rmv_button_"+classID+"' type='button' class='btn btn-danger pull-right rmvClassButton'>							<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Delete Class						</button>												<br><br>											<table id='table_"+classID+"' class='table table-striped table-condensed table-bordered studentTable'>							<thead>								<tr>									<th>#</th>									<th>Name</th>									<th>Score</th>								</tr>							</thead>							<tbody> 							</tbody>						</table>											</div>				</div>			</div>");
			jquery_events(); //Needed to update new JQUERY NODES

		
		} else {
			bootbox.alert("Unable to create class.");
		}
	});
}