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
						<button id="ev_button_{$class.id}" type="button" class="btn btn-default pull-left evButton evButton_{$class.id}" style="margin-bottom:20px">
							<span id="ev_glyph_{$class.id}" class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <span id="ev_text_{$class.id}">Show Events</span>
						</button>
						<button id="ev_button_{$class.id}" type="button" class="btn btn-default pull-left evButton evButton_{$class.id}" style="display:none;margin-bottom:20px">
							<span id="ev_glyph_{$class.id}" class="glyphicon glyphicon-zoom-out" aria-hidden="true"></span> <span id="ev_text_{$class.id}">Hide Events</span>
						</button>

					<button id="set_button_{$class.id}" type="button" class="btn btn-default pull-left setButton setButton_{$class.id}" style="margin-bottom:20px;margin-left:5em">
							<span id="set_glyph_{$class.id}" class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <span id="set_text_{$class.id}">Show Sets</span>
						</button>
						<button id="set_button_{$class.id}" type="button" class="btn btn-default pull-left setButton setButton_{$class.id}" style="display:none;margin-bottom:20px;margin-left:5em">
							<span id="set_glyph_{$class.id}" class="glyphicon glyphicon-zoom-out" aria-hidden="true"></span> <span id="set_text_{$class.id}">Hide Sets</span>
						</button>

						<style>
							html, body { overflow-x: hidden; width: 100%; }
							table.eventsTable tbody { height:300px;overflow-y:scroll ;  display:block; }
						</style>
						<table id="table_ev_{$class.id}" style="display:none;" class="table table-striped table-condensed table-bordered eventsTable">
							<tbody>
							
								{foreach from=$class.classEvents item=event}
								<tr>
									<td><b>{$event.first_name} {$event.last_name}</b></td>
									<td>{$event.description}</td>
								</tr>
								{/foreach}							
							</tbody>
						
					
					
						</table>

						

												{if count($class.sets)>0}
						<table id="table_set_{$class.id}" style="display:none;" class="table table-striped table-condensed table-bordered setsTable">
							<tbody>
							
								{foreach from=$class.sets item=set}
								<tr {if $set.done == 1}style="background-color:#66CD00;"{/if}>
									<td>{$set.setId}.{$set.name}{if $set.done == 1}<span style="font-style:italic;margin-right:5em;" class="pull-right">Done</span>{/if}</td>
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


						<!-- -->
					</div>
					
				</div>

			</div>

			</div>

			
		{/foreach}
		</div>
</div>


<script src="{$BASE_URL}js/s_classes.js"></script>
