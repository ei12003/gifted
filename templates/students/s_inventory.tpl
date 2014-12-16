<div class="container">
    <h1>My Inventory</h1>
		
		<div>
	<br><br>
					
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<th>Preview</th>
								</tr>
							</thead>
							<tbody>
<br><br>
		{foreach from=$INVENTORY item=itemobj}

								<tr>
									<th>{$itemobj.id}</th>
									<th>{$itemobj.name}</th>
									<th>{$itemobj.description}</th>
									<th><img src="{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" width="42"></th>
								</tr>

								{/foreach}
							  
							</tbody>
						</table>
						
					</div>
				</div>