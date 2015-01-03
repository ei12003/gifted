<div class="container">
    <h1>My Inventory</h1>
		
		<div>
	<br>
	<br>
					<script>
					var body = new Array();
					var tshirt = new Array();
					var eyes = new Array();
					{foreach from=$INVENTORY item=itemobj}

					

					switch({$itemobj.part}) {
					    case 0:
					        body.push({$itemobj|json_encode});
					        break;
					    case 1:
					        tshirt.push({$itemobj|json_encode});
					        break;
					    case 2:
					        eyes.push({$itemobj|json_encode});
					        break;
					    default:
					        console.log('default');
					}

					{/foreach}


					</script>
<form action="{$BASE_URL}/actions/avatar.php" method=POST>
					<div class="skincolor">
						 <caption>Skin Color</caption>
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
								{foreach from=$INVENTORY item=itemobj}
								{if $itemobj.part == 0}
								<tr>
									<td>{$itemobj.id}</td>
									<td>{$itemobj.name}</td>
									<td>{$itemobj.description}</td>
									<!--td>{$itemobj.part}</td-->
									<td> <a id="popoverOption" class="btn" href="#" data-content="" rel="popover" data-original-title={$itemobj.name}><img src="{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="skincolor" value={$itemobj.id}> <input type="radio" name="skincolor" value="-1" checked="checked" style="display:none"></td>
								</tr>
								{/if}
								{/foreach}					
						</tbody>
						</table>
					</div>
					
					<div class="shirt">
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							 <caption>Shirts</caption>
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
								{foreach from=$INVENTORY item=itemobj}
								{if $itemobj.part == 1}
								<tr>
									<td>{$itemobj.id}</td>
									<td>{$itemobj.name}</td>
									<td>{$itemobj.description}</td>
									<!--td>{$itemobj.part}</td-->
									<td> <a id="popoverOption" class="btn" href="#" data-content="" rel="popover" data-original-title={$itemobj.name}><img src="{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="shirt" value={$itemobj.id}> <input type="radio" name="shirt"  checked="checked" value="-1" style="display:none"></td>
								</tr>
								{/if}
								{/foreach}					
						</tbody>
						</table>
					</div>

					<div class="eyes">
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							 <caption>Eye Color</caption>
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
								{foreach from=$INVENTORY item=itemobj}
								{if $itemobj.part == 2}
								<tr>
									<td>{$itemobj.id}</td>
									<td>{$itemobj.name}</td>
									<td>{$itemobj.description}</td>
									<!--td>{$itemobj.part}</td-->
									<td> <a id="popoverOption" class="btn" href="#" data-content="" rel="popover" data-original-title={$itemobj.name}><img src="{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="eyecolor" value={$itemobj.id}> <input type="radio" name="eyecolor" checked="checked" value="-1" style="display:none"></td>
								</tr>
								{/if}
								{/foreach}					
						</tbody>
						</table>
					</div>	

						<input type="submit">
						</form>
					</div>
				</div>

					<script>
					var image ='<div><img src="{$itemobj.img_location}" widtd=260 height=260/></div>';
					$('#popoverOption').popover({ trigger: "hover",'placement': 'left', content: image, html: true });
					</script>