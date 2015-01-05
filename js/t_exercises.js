$current_set = -1;
$exercise_id = -1;

$(document).ready(function () {

	jquery_events();

	$("#createSet").click(function() {
		bootbox.prompt("Set name?", function(result) {
			if (result == "") {
				bootbox.alert("Invalid Set name.");    
			} else if (result != null) {      
				createSet(result);
			}
		});
	});
	
	
	$(".radioStyle").click(function() {
		$id = $(this).attr("id");
		
		$('.radioStyle').each(function(i, obj) {
			if ($id != $(this).attr("id")) {
				$(this).prop('checked', false);
			}
		});
	});
	
	$('#createEx, #editEx').on('hidden.bs.modal', function (e) {
	  $(this)
		.find("input,textarea,select")
		   .val('')
		   .end()
		.find("input[type=checkbox], input[type=radio]")
		   .prop("checked", "")
		   .end();
		   
	  $current_set = -1;
	});
	
	
	$("#createExerciseButton").click(function() {
	
	
		if ($current_set == -1) return;
		
		if ($("#question").val() == null || $("#question").val() == "") {
			$("#question").focus();
		} else if ($("#opt1").val() == null || $("#opt1").val() == "") {
			$("#opt1").focus();
		} else if ($("#opt2").val() == null || $("#opt2").val() == "") {
			$("#opt2").focus();
		} else if ($("#opt3").val() == null || $("#opt3").val() == "") {
			$("#opt3").focus();
		} else if ($("#opt4").val() == null || $("#opt4").val() == "") {
			$("#opt4").focus();
		} else if (atleastOneChecked() == null) {
			bootbox.alert("You must check one option as the correct answer.");
		} else {

			createExercise(
				$current_set,
				$("#question").val(),
				$("#opt1").val(),
				$("#opt2").val(),
				$("#opt3").val(),
				$("#opt4").val(),
				atleastOneChecked()
			);
			
			$("#createEx").modal("hide");
			
		}
		
	});
	
	
	
	$("#saveExerciseButton").click(function() {
	
		if ($current_set == -1) return;
		
		
		
		if ($("#e_question").val() == null || $("#e_question").val() == "") {
			$("#e_question").focus();
		} else if ($("#e_opt1").val() == null || $("#e_opt1").val() == "") {
			$("#e_opt1").focus();
		} else if ($("#e_opt2").val() == null || $("#e_opt2").val() == "") {
			$("#e_opt2").focus();
		} else if ($("#e_opt3").val() == null || $("#e_opt3").val() == "") {
			$("#e_opt3").focus();
		} else if ($("#e_opt4").val() == null || $("#e_opt4").val() == "") {
			$("#e_opt4").focus();
		} else if (e_atleastOneChecked() == null) {
			bootbox.alert("You must check one option as the correct answer.");
		} else {
		
			deleteExercise($exercise_id);

			createExercise(
				$current_set,
				$("#e_question").val(),
				$("#e_opt1").val(),
				$("#e_opt2").val(),
				$("#e_opt3").val(),
				$("#e_opt4").val(),
				e_atleastOneChecked()
			);
			
			$("#editEx").modal("hide");
			
		}
		
	});
	
	
	
	
	
});

function updateEditModal() {
	if ($exercise_id == -1) return;
		
		
	$question_str = $("#ex_content_" + $exercise_id).siblings().children().children().text();
	
	$question = $question_str;
	
	$options = $("#ex_content_" + $exercise_id).children().children("span");
	
	$options_desc = {};
	
	
	
	$("#e_question").val($question);
	
	$ans = 0;
	
	for (i = 0; i < $options.length; i++) { 
		$options_desc[i] = $options[i].textContent.substring(3).trim();
		$("#e_opt" + (i+1)).val($options_desc[i]);
		
		if ($options[i].childNodes.length > 1) {
			$ans = i+1;
		}
	}
	
	$("#e_op" + $ans).prop('checked', true);

}

function atleastOneChecked() {
	$ret = null;
	$('.radio1').each(function(i, obj) {
		if ($(this).prop('checked'))
			$ret = $(this).attr("id");
	});
	return $ret;
}

function e_atleastOneChecked() {
	$ret = null;
	$('.radio2').each(function(i, obj) {
		if ($(this).prop('checked'))
			$ret = ($(this).attr("id")).substring(2);
	});
	return $ret;
}

function jquery_events() {
	$(".addExerciseButton").unbind("click").click(function() {

		var id = $(this).attr('id');
		var setID = id.substring(id.lastIndexOf("_")+1);
		
		$current_set = setID;
		
	});
	
	$(".editExerciseButton").unbind("click").click(function() {
	
	
		var id = $(this).parent().parent().parent().parent().parent().parent().attr('id');
		var setID = id.substring(id.lastIndexOf("_")+1);
		
		$current_set = setID;

	
		var id = $(this).attr('id');
		var exID = id.substring(id.lastIndexOf("_")+1);
		
		$exercise_id = exID;
		
		updateEditModal();
	});
	
	
	$(".rmvSetButton").unbind("click").click(function() {
		var id = $(this).attr('id');
		var setID = id.substring(id.lastIndexOf("_")+1);
		
		bootbox.dialog({
			message: "Are you sure you want to delete this set?",
			buttons: {
				no: {
					label: "No",
					className: "btn-default"
				},
				yes: {
					label: "Yes",
					className: "btn-danger",
					callback: function() {
						deleteSet(setID);
					}
				}
			}
		});
	});
	
	$(".deleteExerciseButton").unbind("click").click(function() {
		var id = $(this).attr('id');
		var exID = id.substring(id.lastIndexOf("_")+1);

		bootbox.dialog({
			message: "Are you sure you want to delete this exercise?",
			buttons: {
				no: {
					label: "No",
					className: "btn-default"
				},
				yes: {
					label: "Yes",
					className: "btn-danger",
					callback: function() {
						deleteExercise(exID);
					}
				}
			}
		});
		
		
		
	});
	
}

function createExercise(setID, ques, opt1, opt2, opt3, opt4, ans) {
	$.get( "../../api/createExercise.php", { setid : setID, question : ques, op1 : opt1, op2 : opt2, op3 : opt3, op4 : opt4, correct : ans} , function( data ) {
		
		var data_array = jQuery.parseJSON( data );
		
		if (data_array[0] == true) {

			
			exID = data_array[1];
			
			$firstp = "<div id='ex"+exID+"' class='panel panel-default'>       <div class='panel-heading'>        <h4 class='panel-title'>         <a data-toggle='collapse' href='#ex_content_"+exID+"'>"+ques+"</a>        </h4>       </div>       <div id='ex_content_"+exID+"' class='panel-collapse collapse'>        <div class='panel-body'>                 <button id='edit_ex_button_"+exID+"' type='button' class='btn btn-sm btn-default editExerciseButton' data-toggle='modal' data-target='#editEx'>          <span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> Edit         </button>                  <button id='delete_ex_button_"+exID+"' type='button' class='btn btn-sm btn-danger pull-right deleteExerciseButton'>          <span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Delete         </button>                  <br><br>";

			list =  [opt1, opt2, opt3, opt4];
			$opts = "";
			for(var $i = 0;$i<4;$i++){
				
			  $opts += "<span style='color:black;'>"+($i+1)+".  "+list[$i];
			  if(ans == ("op"+($i+1))){
				$opts +=  "<span class='glyphicon glyphicon-ok'></span>";
			  }
			  $opts += "</span><br>";
				  
			}          
			$lastp = "</div></div></div>";

			$new_html = $firstp +$opts+$lastp;
			
			$("#exercisePanelGroup" + setID).append($new_html);
			
			var setCount = parseInt($("#setCount_" + setID).html());
			$("#setCount_" + setID).html(setCount+1);
			
			jquery_events();
			
		} else {
			bootbox.alert(data_array[1]);
		}
	});
}



function deleteExercise(exID) {
	var id = $("#ex" + exID).parent().parent().parent().attr("id");
	var setID = id.substring(id.lastIndexOf("_")+1);
	

	$.get( "../../api/deleteExercise.php", { exid: exID} , function( data ) {
		if (data == 1) {
			$("#ex" + exID).remove();
			var setCount = parseInt($("#setCount_" + setID).html());
			$("#setCount_" + setID).html(setCount-1);
		} else {
			bootbox.alert("Cannot remove this exercise.");
		}
	});
}
function deleteSet(setID) {
	$.get( "../../api/deleteSet.php", { setid: setID} , function( data ) {
		if (data == 1) {
			$("#" + setID).remove();
		} else {
			bootbox.alert("Cannot remove this set.");
		}
	});
}



function createSet(setName) {
	
	$.get( "../../api/createSet.php", { name: setName } , function( data ) {
	
		var data_array = jQuery.parseJSON( data );
	
		if (data_array[0] == true) {
			$(".noexerc").remove();
		
			var setID = data_array[1];
			
			$("#setPanelGroup").append("<div id='"+setID+"' class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a  data-toggle='collapse' href='#content_"+setID+"'>"+setID+". "+setName+"<i style='font-size:80%;'><br><span id='setCount_"+setID+"'>0</span> Exercise(s)</i></a></h4></div><div id='content_"+setID+"' class='panel-collapse collapse'><div class='panel-body'><button id='add_button_"+setID+"' type='button' class='btn btn-default addExerciseButton' data-toggle='modal' data-target='#createEx'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span> Create Exercise</button><button id='rmv_button_"+setID+"' type='button' class='btn btn-danger pull-right rmvSetButton'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Delete Set</button><br><br><div id='exercisePanelGroup"+setID+"' class='panel-group'></div></div></div></div>");
			
			jquery_events();
		
		} else {
			bootbox.alert("Unable to create Set.");
		}
	});
	
}