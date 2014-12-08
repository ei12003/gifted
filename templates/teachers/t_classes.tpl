<div class="container">
    <h1>My Classes</h1>
	{foreach from=$CLASSES item=class}
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a  data-toggle="collapse" data-parent="#accordion" href="#{$class.id}">{$class.id}. {$class.name} (30 Students)</a>
					</h4>
				</div>
				<div id="{$class.id}" class="panel-collapse collapse">
					<div class="panel-body">					
						 <table class="table table-striped">
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
		</div>
	{/foreach}
</div>

