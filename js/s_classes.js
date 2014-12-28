$(document).ready(function () {



	$(".studentTable tbody>tr").click( function() {
		
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
				}
			}
		});
	});
	
	$(".leaveClassButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		
		bootbox.dialog({
			message: "Are you sure you want to leave this class?",
			buttons: {
				no: {
					label: "No",
					className: "btn-default"
				},
				yes: {
					label: "Yes",
					className: "btn-danger",
					callback: function() {
						leaveClass(classID);
					}
				}
			}
		});
	});


	$(".evButton").click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		$(".evButton_"+classID).toggle();
		$("#table_ev_"+classID).toggle();
		

	});

});


function leaveClass(classID) {
	$.get( "../../api/leaveClass.php", { classid: classID} , function( data ) {
		if (data == true) {
			$("#" + classID).remove();
			bootbox.alert("Left Class Sucessfully.");
		} else {
			bootbox.alert("Unable to leave this class.");
		}
	});
}