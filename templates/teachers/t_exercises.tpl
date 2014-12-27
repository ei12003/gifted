<div class="container">
	<h1>My Exercises</h1>
	
	<button id="createSet" type="button" class="btn btn-lg btn-success" style="margin-bottom:20px;">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Exercise Set
	</button>

	<div id="setPanelGroup" class="panel-group">
		{foreach from=$SETS item=set}
			<div id="{$set.id}" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a  data-toggle="collapse" href="#content_{$set.id}">{$set.id}. {$set.name}<i style="font-size:80%;"><br><span id="setCount_{$set.id}">{$set.numEx}</span> Exercise(s)</i></a>
					</h4>
				</div>
				<div id="content_{$set.id}" class="panel-collapse collapse">
					<div class="panel-body">
					
					<button id="add_button_{$set.id}" type="button" class="btn btn-default addExerciseButton" data-toggle="modal" data-target="#createEx">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Exercise
					</button>
					
					<button id="rmv_button_{$set.id}" type="button" class="btn btn-danger pull-right rmvSetButton">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Set
					</button>
					
					<br><br>
					
					<div id="exercisePanelGroup{$set.id}" class="panel-group">
					{foreach from=$set.exercises item=ex}
						<div id="ex{$ex.id}" class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" href="#ex_content_{$ex.id}">{$ex.name}</a>
								</h4>
							</div>
							<div id="ex_content_{$ex.id}" class="panel-collapse collapse">
								<div class="panel-body">
								
									<button id="edit_ex_button_{$ex.id}" type="button" class="btn btn-sm btn-default editExerciseButton" data-toggle="modal" data-target="#editEx">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
									</button>
									
									<button id="delete_ex_button_{$ex.id}" type="button" class="btn btn-sm btn-danger pull-right deleteExerciseButton">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete
									</button>
									
									<br><br>
								
									{$c = 0}
									{foreach from=$ex.ops item=opt}
										{$c = $c +1}
										<span style="color:black;">{$c}.  {$opt.description} <span> {if $opt.optid == $ex.correct} <span class="glyphicon glyphicon-ok"></span> {/if}<br>
									{/foreach}
								</div>
							</div>
						</div>
					{/foreach}
					</div>
					
					</div>
				</div>
		
			</div>
		{/foreach}
	</div> 
	
	
	<div id="createEx" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Create Exercise</h4>
			</div>
			<div class="modal-body">
					
					<div class="input-group">
						<span class="input-group-addon label-warning" style="color:white;" aria-describedby="basic-addon2">Question</span>
						<input id="question" type="text" class="form-control" placeholder="Question" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 1
							<input id="op1" style="margin-left:20px;" type="checkbox" class="radioStyle">
						</span>
						<input id="opt1" type="text" class="form-control" placeholder="Option 1" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 2
							<input id="op2" style="margin-left:20px;" type="checkbox" class="radioStyle">
						</span>
						<input id="opt2" type="text" class="form-control" placeholder="Option 2" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 3
							<input id="op3" style="margin-left:20px;" type="checkbox" class="radioStyle">
						</span>
						<input id="opt3" type="text" class="form-control" placeholder="Option 3" aria-describedby="basic-addon2">
						
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">
							Option 4
							<input id="op4" style="margin-left:20px;" type="checkbox" class="radioStyle">
						</span>
						<input id="opt4" type="text" class="form-control" placeholder="Option 4" aria-describedby="basic-addon2">
						
					</div><br>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button id="createExerciseButton" type="button" class="btn btn-primary">Create</button>
			</div>
		</div>
	  </div>
	</div>
	
	<div id="editEx" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Edit Exercise</h4>
			</div>
			<div class="modal-body">

					<div class="input-group">
						<span class="input-group-addon label-warning" style="color:white;" aria-describedby="basic-addon2">Question</span>
						<input type="text" class="form-control" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">Option 1</span>
						<input type="text" class="form-control" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">Option 2</span>
						<input type="text" class="form-control" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">Option 3</span>
						<input type="text" class="form-control" aria-describedby="basic-addon2">
					</div><br>
					
					<div class="input-group">
						<span class="input-group-addon label-info" style="color:white;" aria-describedby="basic-addon2">Option 4</span>
						<input type="text" class="form-control" aria-describedby="basic-addon2">
					</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button id="editExerciseButton" type="button" class="btn btn-primary">Save</button>
			</div>
		</div>
	  </div>
	</div>

	
	

	

</div>

<script src="{$BASE_URL}js/t_exercises.js"></script>