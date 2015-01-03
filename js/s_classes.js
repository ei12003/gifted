$(document).ready(function () {

	$('.tabs .tab-links a').on('click', function(e)  {

        var currentAttrValue = $(this).attr('href');
 
        // Show/Hide Tabs
        $('.tabs ' + currentAttrValue).show().siblings().hide();
 		 
        // Change/remove current tab to active
        $(this).parent('li').addClass('active').siblings().removeClass('active');
 
        e.preventDefault();
    
    });

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


	$(".setsTable tbody>tr").unbind("click").click( function() {
		var set_row = $('td', this).html();
		var setID = set_row.substring(0,set_row.lastIndexOf(".")).trim();
		var setName = set_row.substring(set_row.lastIndexOf(".")+1);

		var id = $(this).parent().parent().attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		window.location = "./s_exercise.php?setid="+setID+"&classid="+classID;
	});



	$(".setButton").unbind('click').click(function() {
		var id = $(this).attr('id');
		var classID = id.substring(id.lastIndexOf("_")+1);
		$(".setButton_"+classID).toggle();
		$("#table_set_"+classID).toggle();
		

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