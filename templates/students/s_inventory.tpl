<div class="container">
    <h1>My Inventory</h1>
		
		<div>
	<br>
	<br>
<form action="{$BASE_URL}actions/avatar.php" method=POST>
	<br><br>
					<div class="skincolor">
						 <h3>Skin Color</h3>
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							<tdead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<!--th>Part</th-->
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</tdead>
							<tbody>
								<tr>
									<td>0</td>
									<td>Default</td>
									<td>Default</td>
									<!--td>{$itemobj.part}</td-->
									<td> </td>
									<td><input type="radio" name="skincolor" value=0 {IF $AVATARCHOICES.part0 == NULL}checked="true"{/if}></td>
								</tr>
								{foreach from=$INVENTORY item=itemobj}
								{if $itemobj.part == 0}
								<tr>
									<td>{$itemobj.id}</td>
									<td>{$itemobj.name}</td>
									<td>{$itemobj.description}</td>
									<!--td>{$itemobj.part}</td-->
									<td> <a class="popoverOption" class="btn" href="#" data-content='<img src="{$BASE_URL}img/{$itemobj.img_location}" class="avatar img-circle" alt="itemImage">' rel="popover" data-original-title={$itemobj.name}><img src="{$BASE_URL}img/{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="skincolor" value={$itemobj.id} {IF $AVATARCHOICES.part0 == {$itemobj.id}}checked="true"{/if}></td>
								</tr>
								{/if}
								{/foreach}					
						</tbody>
						</table>
					</div>
					<br>
					<div class="shirt">
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							 <h3>Shirts</h3>
							<tdead>
								<tr>
									<th>#</td>
									<th>Name</td>
									<th>Description</th>
									<!--th>Part</th-->
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</tdead>
							<tbody>
								<tr>
									<td>0</td>
									<td>Default</td>
									<td>Default</td>
									<!--td>{$itemobj.part}</td-->
									<td> </td>
									<td><input type="radio" name="shirt" value=0 {IF $AVATARCHOICES.part1 == NULL}checked="true">{/if}</td>
								</tr>
								{foreach from=$INVENTORY item=itemobj}
								{if $itemobj.part == 1}
								<tr>
									<td>{$itemobj.id}</td>
									<td>{$itemobj.name}</td>
									<td>{$itemobj.description}</td>
									<!--td>{$itemobj.part}</td-->
									<td> <a class="popoverOption" class="btn" href="#" data-content='<img src="{$BASE_URL}img/{$itemobj.img_location}" class="avatar img-circle" alt="itemImage">' rel="popover" data-original-title={$itemobj.name}><img src="{$BASE_URL}img/{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="shirt" value={$itemobj.id} {IF $AVATARCHOICES.part1 == {$itemobj.id}}checked="true"{/if}> </td>
								</tr>
								{/if}
								{/foreach}					
						</tbody>
						</table>
					</div>
					<br>
					<div class="eyes">
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							 <h3>Eye Color</h3>
							<tdead>
								<tr>
									<th>#</th>
									<td>Name</th>
									<td>Description</th>
									<!--th>Part</th-->
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</tdead>
							<tbody>
								<tr>
									<td>0</td>
									<td>Default</td>
									<td>Default</td>
									<!--td>{$itemobj.part}</td-->
									<td> </td>
									<td><input type="radio" name="eyecolor" value=0 {IF $AVATARCHOICES.part2 == NULL}checked="true"{/if}></td>
								</tr>
								{foreach from=$INVENTORY item=itemobj}
								{if $itemobj.part == 2}
								<tr>
									<td>{$itemobj.id}</td>
									<td>{$itemobj.name}</td>
									<td>{$itemobj.description}</td>
									<!--td>{$itemobj.part}</td-->
									<td> <a class="popoverOption" class="btn" href="#" data-content='<img src="{$BASE_URL}img/{$itemobj.img_location}" class="avatar img-circle" alt="itemImage">' rel="popover" data-original-title={$itemobj.name}><img src="{$BASE_URL}img/{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="eyecolor" value={$itemobj.id} {IF $AVATARCHOICES.part2 == {$itemobj.id}}checked="true"{/if}></td>
								</tr>
								{/if}
								{/foreach}					
						</tbody>
						</table>
					</div>	

						
					<input type="submit" class="btn btn-danger" value="Change">

						</form>
					</div>
				</div>

					<script>
					</script>