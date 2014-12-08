$(document).ready(function () {
	$(".addStundetnButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);

		alert("#TODO Demo Line added");
		addStudent(classID,7,"Pedro",134);
	});
	
	
	
	$(".rmvClassButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		bootbox.confirm("Are you shure you want to delete this class?", function(res) {
			if (res) {
				alert("#TODO");
				$("#" + classID).remove();
			}
		});

	});
});

function addStudent(classID, studentID, studentName, studentScore) {
	var table = $("#table_" + classID);
	
	table.append("<tr><td>"+studentID+"</td><td>"+studentName+"</td><td>"+studentScore+"</td></tr>");
}