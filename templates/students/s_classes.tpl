<div class="container">
    <h1>My Classes</h1>
		
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
		
						<span style="font-size:150%;color:black"><i style="font-size:80%">Teacher:</i> <b>{$class.teacher.first_name} {$class.teacher.last_name}</b></span>
						
						<button id="leave_button_{$class.id}" type="button" class="btn btn-danger pull-right leaveClassButton" style="margin-bottom:20px">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Leave Class
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
								
									{if $USERID == $student.id} 
										<tr style="background-color: #66CD00">	
									{else}
										<tr>	
									{/if}
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


<script src="{$BASE_URL}js/s_classes.js"></script>
