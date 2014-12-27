$(document).ready(function () {
	


	$(".buy-item").click(function() {
		var itemID = $(this).attr("id");


	bootbox.dialog({
			message: $(this).html(),
			backdrop: false,
			buttons: {
				buy: {
					label: "Buy",
					className: "btn-default",
					callback: function() {
						buyItem(itemID);
					}
				},
				offer: {
					label: "Offer",
					className: "btn-default",
					callback: function() {
						bootbox.prompt("Choose username", function(result) {
							if (result != null) {
								offerItemUsername(itemID,result)
							}
						}); 
					}
				}
			}
		});
	});

	function buyItem(itemID){
		$.get( "../../api/buyItem.php", { itemid: itemID} , function( data ) {
			var data_array = jQuery.parseJSON( data );
				bootbox.alert(data_array[1]);
		});
	}

	function offerItemUsername(itemID,studentUsername){
		$.get( "../../api/buyItem.php", { itemid: itemID, offer_username: studentUsername} , function( data ) {
			var data_array = jQuery.parseJSON( data );
				bootbox.alert(data_array[1]);
		});
	}


});