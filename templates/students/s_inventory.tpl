<div class="container">
    <h1>My Inventory</h1>
		
		<div id="classPanelGroup" class="panel-group">
		{foreach from=$INVENTORY item=inventory}
				
						<br><br>
					
						<table id="table_{$inventory.id}" class="table table-striped table-condensed table-bordered studentTable">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody>
							
							  
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		{/foreach}
		</div>
</div>