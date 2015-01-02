<div class="container">
    <h1>My Inventory</h1>
		
		<div>
	<br>
	<br>
					<script>
					{foreach from=$INVENTORY item=itemobj}

					body = new array();
					tshirt = new array();
					eyes = new array();

					switch({$itemobj.part}) {
					    case 0:
					        body.push({$itemobj});
					        break;
					    case 1:
					        tshirt.push({$itemobj});
					        break;
					    case 2:
					        eyes.push({$tshirt})
					        break;
					    default:
					        default console.log('default');
					}

					{/foreach}

					console.log(body);
					console.log(tshirt);
					console.log(eyes);

					</script>

						<table class="table table-striped table-condensed table-bordered" id="inventory">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<th>Part</th>
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
									<th>{$itemobj.part}</th>
									<th> <a id="popoverOption" class="btn" href="#" data-content="" rel="popover" data-original-title={$itemobj.name}><img src="{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" width="42"></th></a>
								</tr>
								{/foreach}
							  
							</tbody>
						</table>
						
					</div>
				</div>

					<script>
					var image ='<div><img src="{$itemobj.img_location}" width=260 height=260/></div>';
					$('#popoverOption').popover({ trigger: "hover",'placement': 'left', content: image, html: true });
					</script>