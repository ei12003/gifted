$(document).ready(function () {
	var max = parseInt($(".pag_data").attr("max"));

	$(".pag_btn").click(function() {
		var page = parseInt($(this).attr("id"));
		var current = parseInt($(".pag_data").attr("current"));

		if(current!=page)
			handlePagination(page,max);

	});

	$(".pg_next").click(function() {
		var current = parseInt($(".pag_data").attr("current"));
		handlePagination(current+1,max);
	});

	$(".pg_prev").click(function() {
		var current = parseInt($(".pag_data").attr("current"));
		handlePagination(current-1,max);
	});


	$(".buy-item").click(function() {
		var itemID = $(this).attr("id");
		var amount = parseInt($(this).parent().prev().html());
	
	bootbox.dialog({
			message: $(this).html(),
			backdrop: false,
			buttons: {
				buy: {
					label: "Buy",
					className: "btn-default",
					callback: function() {
						buyItem(itemID,amount);
					}
				},
				offer: {
					label: "Offer",
					className: "btn-default",
					callback: function() {
						bootbox.prompt("Choose username", function(result) {
							if (result != null) {
								offerItemUsername(itemID,result,amount);
							}
						}); 
					}
				}
			}
		});
	});

	function buyItem(itemID,amount){
		$.get( "../../api/buyItem.php", { itemid: itemID} , function( data ) {
			var data_array = jQuery.parseJSON( data );
			bootbox.alert(data_array[1]);
			if(data_array[0]==true){
				$('.header_userpts').html(parseInt($('.header_userpts').html())-amount);
			}
				
		});
	}

	function offerItemUsername(itemID,studentUsername,amount){
		$.get( "../../api/buyItem.php", { itemid: itemID, offer_username: studentUsername} , function( data ) {
			var data_array = jQuery.parseJSON( data );
				bootbox.alert(data_array[1]);
				if(data_array[0]==true){
					$('.header_userpts').html(parseInt($('.header_userpts').html())-amount);
				}
		});
	}

	function handlePagination(page,max){
		
		$( ".pgn" ).each(function() {
			var this_pg = parseInt($( this ).attr( "id" ));
			if(this_pg!=page)
				$(this).hide();
			else
				$(this).show();
		});

		
		
		$( ".pag_btn" ).each(function() {
			var aux = parseInt($( this ).attr( "id" ));


			if(aux==page)
				$(this).css('font-size',17);
			else
				$(this).css('font-size',14);

			if (aux > (page-2)
				&& aux < (page+2) )
				$(this).show();				
			else
				$(this).hide();
		});
		

		if(page == max){
			$( ".pag_btn#"+(max-2) ).show();
			$(".pg_next").hide();
		}
		else if(page == 1){
			$( ".pag_btn#"+(page+2) ).show();
			$(".pg_prev").hide();
		}
		else{
			$(".pg_next").show();	
			$(".pg_prev").show();	
		}

		$(".pag_data").attr("current",page)
	}


});