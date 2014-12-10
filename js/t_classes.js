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
	
	/* 
	$(".searchStudents").on('input',function(e){
		alert('Changed!');
	}); 
	*/
	
	$(".studentTable tbody>tr").click( function() {
		
		var studentID = $(':nth-child(1)', this).html();
		var studentName = $(':nth-child(2)', this).html();
	
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
					className: "btn-default"
				},
				kick: {
					label: "Kick Student",
					className: "btn-danger",
					callback: function() {
						alert("kick Student");
					}
				}
			}
		});
	});
	
	
	$(document).on('click', '.bootbox', function(){
		var classname = event.target.className;
		if(!$('.' + classname).parents('.modal-dialog').length && classname != "bootbox-input bootbox-input-text form-control")
			bootbox.hideAll();
	});
	
	
});

function jquery_events() {

	$(".addStudentButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		var input = $("#searchStudents_" + classID).val();
		
		if (input != null && input != "") {
			addStudent(classID, input);
		} else {
			$("#searchStudents_" + classID).focus();
		}
	});
	
	$(".rmvClassButton").click(function() {
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

function addStudent(classID, studentID) {

	$.get( "../../api/addStudent.php", { classid: classID, userid: studentID} , function( data ) {
		var data_array = jQuery.parseJSON( data );
		
		if (data_array[0] == true) {
		
			var table = $("#table_" + classID);
			table.append("<tr><td>"+studentID+"</td><td>"+data_array[1]+"</td><td>0</td></tr>");
			
			var classCount = parseInt($("#classCount_" + classID).html());
			
			$("#classCount_" + classID).html(classCount+1);
			
			
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
			$("#classPanelGroup").append("<div id='"+classID+"' class='panel panel-default'>				<div class='panel-heading'>					<h4 class='panel-title'>						<span style='padding:10px;pointer-events: none;' class='pull-right'><i style='font-size:80%;'>Score:</i> 0</span>						<a  data-toggle='collapse' href='#content_"+classID+"'>"+classID+". "+className+"<i style='font-size:80%;'><br><span id='classCount_"+classID+"'>0</span> Student(s)</i> </a>					</h4>				</div>				<div id='content_"+classID+"' class='panel-collapse collapse'>					<div class='panel-body'>									<input id= 'searchStudents_"+classID+"' class='searchStudents' type='text' list='userList' style='height:33px;color:black;padding-left:10px;'>								<button id='add_button_"+classID+"' type='button' class='btn btn-default addStudentButton'>							<span class='glyphicon glyphicon-plus' aria-hidden='true'></span> Add Student						</button>												<button id='rmv_button_"+classID+"' type='button' class='btn btn-danger pull-right rmvClassButton'>							<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Delete Class						</button>												<br><br>											<table id='table_"+classID+"' class='table table-striped table-condensed table-bordered studentTable'>							<thead>								<tr>									<th>#</th>									<th>Name</th>									<th>Score</th>								</tr>							</thead>							<tbody> 							</tbody>						</table>											</div>				</div>			</div>");
		
			jquery_events(); //Needed to update new JQUERY NODES
		
		} else {
			bootbox.alert("Unable to create class.");
		}
	});
}