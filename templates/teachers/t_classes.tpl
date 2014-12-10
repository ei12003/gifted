<div class="container">
    <h1>My Classes</h1>
	
		<button id="createClass" type="button" class="btn btn-lg btn-success" style="margin-bottom:20px;">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Class
		</button>
		
		
		<datalist id="userList">
			<option value="Internet Explorer">
			<option value="Firefox">
			<option value="Google Chrome">
			<option value="Opera">
			<option value="Safari">
		</datalist>

		<div id="classPanelGroup" class="panel-group">
		{foreach from=$CLASSES item=class}
			<div id="{$class.id}" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<span style="padding:10px;pointer-events: none;" class="pull-right"><i style="font-size:80%;">Score:</i> {$class.score}</span>
						<a  data-toggle="collapse" href="#content_{$class.id}">{$class.id}. {$class.name}<i style="font-size:80%;"><br><span id="classCount_{$class.id}">{$class.numStd}</span> Student(s)</i> </a>
					</h4>
				</div>
				<div id="content_{$class.id}" class="panel-collapse collapse">
					<div class="panel-body">	
		
						<input id= "searchStudents_{$class.id}" class="searchStudents" type="text" list="userList" style="height:33px;color:black;padding-left:10px;">	
	
						<button id="add_button_{$class.id}" type="button" class="btn btn-default addStudentButton">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Student
						</button>
						
						<button id="rmv_button_{$class.id}" type="button" class="btn btn-danger pull-right rmvClassButton">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Class
						</button>
						
						<br><br>
					
						<table id="table_{$class.id}" class="table table-striped table-condensed table-bordered studentTable">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Score</th>
								</tr>
							</thead>
							<tbody>
							
								{foreach from=$class.students item=student}
								<tr>
									<td>{$student.id}</td>
									<td>{$student.first_name} {$student.last_name}</td>
									<td>{$student.score}</td>
								</tr>
								
								{/foreach}
							  
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		{/foreach}
		</div>
</div>


<script src="{$BASE_URL}js/t_classes.js"></script>
