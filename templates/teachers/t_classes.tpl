<div class="container">
    <h1>My Classes</h1>
		<div class="panel-group">
		{foreach from=$CLASSES item=class}
			<div id="{$class.id}" class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a  data-toggle="collapse" href="#content_{$class.id}">{$class.id}. {$class.name} (30 Students) </a>
					</h4>
				</div>
				<div id="content_{$class.id}" class="panel-collapse collapse">
					<div class="panel-body">	
		
						<input id= "searchStudents_{$class.id}" class="searchStudents" type="text" style="height:33px;color:black;padding-left:10px;">
		
						<button id="add_button_{$class.id}" type="button" class="btn btn-default addStundetnButton">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Student
						</button>
						
						<button id="rmv_button_{$class.id}" type="button" class="btn btn-danger pull-right rmvClassButton">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Class
						</button>
						
						<br><br>
					
						<table id="table_{$class.id}" class="table table-striped table-condensed">
							<thead>
							  <tr>
								<th>#</th>
								<th>Name</th>
								<th>Score</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
								<td>1</td>
								<td>Anna</td>
								<td>111</td>
							  </tr>
							  <tr>
								<td>2</td>
								<td>Debbie</td>
								<td>111</td>
							  </tr>
							  <tr>
								<td>3</td>
								<td>John</td>
								<td>111</td>
							  </tr>
							</tbody>
						  </table>
						
					</div>
				</div>
			</div>
		{/foreach}
		</div>
</div>



