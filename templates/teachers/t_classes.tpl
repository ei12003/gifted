<div class="container">
    <h1>My Classes</h1>
	
		<button id="createClass" type="button" class="btn btn-lg btn-success" style="margin-bottom:20px;">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create Class
		</button>
		
		<div id="classPanelGroup" class="panel-group">
		{foreach from=$CLASSES item=class}
			<div id="{$class.id}" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<span style="padding:10px;pointer-events: none;" class="pull-right"><i style="font-size:80%;">Score:</i> <span id="classscore_{$class.id}">{$class.score}</span></span>
						<a  data-toggle="collapse" href="#content_{$class.id}">{$class.id}. {$class.name}<i style="font-size:80%;"><br><span id="classCount_{$class.id}">{$class.numStd}</span> Student(s)</i> </a>
					</h4>
				</div>
				<div id="content_{$class.id}" class="panel-collapse collapse">
					<div class="panel-body">	
		
						<select id= "searchStudents_{$class.id}" class="select2 searchStudents" style="width:250px">
							<option value=""></option>
<!-- 							<option value="18">18. Richard Riley</option>
							<option value="19">19. Jason Coleman</option>
							<option value="20">20. Kathryn Frazier</option>
							<option value="21">21. Arthur Lewis</option>
							<option value="23">23. Sandra Perez</option> -->
						</select>
	
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
									<td id="score_{$class.id}_{$student.id}">{$student.score}</td>
								</tr>
								
								{/foreach}
							  
							</tbody>
						</table>
						
						
						
						<select id= "searchSets_{$class.id}" class="select2 searchSets pull-right" style="width:250px">
							<option value=""></option>
<!-- 							<option value="18">18. Richard Riley</option>
							<option value="19">19. Jason Coleman</option>
							<option value="20">20. Kathryn Frazier</option>
							<option value="21">21. Arthur Lewis</option>
							<option value="23">23. Sandra Perez</option> -->
						</select>


						<button id="addset_button_{$class.id}" type="button" class="btn btn-default addSetButton pull-right">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Set
						</button>
				

						<button id="set_button_{$class.id}" type="button" class="btn btn-default pull-left setButton setButton_{$class.id}" style="margin-bottom:20px">
							<span id="set_glyph_{$class.id}" class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <span id="set_text_{$class.id}">Show Sets</span>
						</button>
						<button id="set_button_{$class.id}" type="button" class="btn btn-default pull-left setButton setButton_{$class.id}" style="display:none;margin-bottom:20px">
							<span id="set_glyph_{$class.id}" class="glyphicon glyphicon-zoom-out" aria-hidden="true"></span> <span id="set_text_{$class.id}">Hide Sets</span>
						</button>

						

						{if count($class.sets)>0}
						<table id="table_set_{$class.id}" style="display:none;" class="table table-striped table-condensed table-bordered setsTable">
							<tbody>
							
								{foreach from=$class.sets item=set}
								<tr>
									<td>{$set.setId}.{$set.name}</td>
								</tr>
								{/foreach}							
							</tbody>
						</table>
						{else}
						<table id="table_set_{$class.id}" style="display:none;" class="table table-striped table-condensed table-bordered setsTable">
							<tbody>
													
							</tbody>
						</table>
						{/if}



					</div>
				</div>
			</div>
		{/foreach}
		</div>
</div>


<script src="{$BASE_URL}js/t_classes.js"></script>
