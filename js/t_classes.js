$(document).ready(function () {
	$(".addStundetnButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		addStudent(classID, $("#searchStudents_" + classID).val());
	});
	
	
	
	$(".rmvClassButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		bootbox.confirm("Are you shure you want to delete this class?", function(res) {
			if (res) {
				deleteClass(classID);
			}
		});

	});
	
	/* 
	$(".searchStudents").on('input',function(e){
		alert('Changed!');
	}); 
	*/
	
});

function addStudent(classID, studentID) {

	$.get( "../../api/addStudent.php", { classid: classID, userid: studentID} , function( data ) {
		var data_array = jQuery.parseJSON( data );
		
		if (data_array[0] == true) {
		
			var table = $("#table_" + classID);
			table.append("<tr><td>"+studentID+"</td><td>"+data_array[1]+"</td><td>0</td></tr>");
			
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