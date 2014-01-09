/*$(document).ready(function() { 
	$("#ShopifyLogin").submit(function(e)
	{
		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		$.ajax(
		{
			url : formURL,
			type: "POST",
			data : postData,
			success:function(data, textStatus, jqXHR) 
			{
				console.log(data);
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
			}
		});
	    e.preventDefault();	
	});
		
	$("#ShopifyLogin").submit();
}); */