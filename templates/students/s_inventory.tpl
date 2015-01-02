<div class="container">
    <h1>My Inventory</h1>
		
		<div>
	<br>
	<br>
					<script>
					{foreach from=$INVENTORY item=itemobj}

					var body = new Array();
					var tshirt = new Array();
					var eyes = new Array();

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

					console.log(body);
					console.log(tshirt[0].part);
					//Itens.id,Itens.name,Itens.img_location,Itens.part,Itens.description

					/*
					var x=document.getElementById("content");
	var d = document.createElement('div');
	x.innerHTML = '';
	var lin ='<div id="login">Login\
			<ul><form name="loginForm" action="#" method="get" >\
			<li><p>Username: <input type="text" id="username" name=\'username\'/></p></li>\
			<li><p>Password: <input type="text" id="pword" name=\'pword\'/></p></li>\
			<li><p><div id="LoginFormButton" class="button">submeter  </div></p></li>\
			</form></ul></div>';
	x.appendChild(d);
	$(d).append(lin);
}	

					*/
					var content = "";
					for(int i =0; i< tshirt.lenght,i++){
						content+=' <tr><th>'+ tshirt[i].id + '</th>'
									<th> + tshirt[i].name + '</th>'
									<th>" + tshirt[i].description + "</th>
									<th> " + tshirt[i].part + "</th>
									<th> <a id="popoverOption" class="btn" href="#" data-content="" rel="popover" data-original-title=" + tshirt[i].name "><img src="tshirt[i].img_location" class="avatar img-circle" alt="itemImage" height="42" width="42"></th></a>
									<th><input type="radio" name="color" value="color"></th>
								</tr>';

					}

					console.log(eyes);

					</script>
<form action="avatarselection()">
					<div class="color">
						 <caption>Skin Color</caption>
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<th>Part</th>
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</thead>
							<tbody>
					</div>
					
					<div class="shirt">
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							 <caption>Shirts</caption>
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<th>Part</th>
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</thead>
							<tbody>
					</div>

					<div class="eyes">
						<table class="table table-striped table-condensed table-bordered" id="inventory">
							 <caption>Eye Color</caption>
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<th>Part</th>
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</thead>
							<tbody>
					</div>	
<br><br>
		{foreach from=$INVENTORY item=itemobj}

								<tr>
									<th>{$itemobj.id}</th>
									<th>{$itemobj.name}</th>
									<th>{$itemobj.description}</th>
									<th>{$itemobj.part}</th>
									<th> <a id="popoverOption" class="btn" href="#" data-content="" rel="popover" data-original-title={$itemobj.name}><img src="{$itemobj.img_location}" class="avatar img-circle" alt="itemImage" height="42" width="42"></th></a>
									<th><input type="radio" name="color" value="color"></th>
								</tr>
								{/foreach}						  
							</tbody>
						</table>
						<input type="submit">
						</form>
					</div>
				</div>

					<script>
					var image ='<div><img src="{$itemobj.img_location}" width=260 height=260/></div>';
					$('#popoverOption').popover({ trigger: "hover",'placement': 'left', content: image, html: true });
					</script>