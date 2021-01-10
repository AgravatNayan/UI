function onloadpage(id){
	showLoaderPage(true);
	$.ajax({
	    url: "page",
	    method: "POST",
	    data: {"page_id":id},	  	    
	     success: function(result){
	         // alert(result);
	    	 $("#main").html(result);
	    	 showLoaderPage(false);
	    	 
	     },
	     error(request, type, errorThrown){
	    	 showLoaderPage(false);
	    	 console.log('Custome Error:'+errorThrown);
	    	 MessageBox('Error '+type, 'Error:'+errorThrown+"", 'red', 'fa fa-warning');
	     }
	});
}
function showLoaderPage(value) {
    if (value)
    {
        $('#loader').html('<div class="loader"><div class="status"></div></div>');
    } else
    {
        $('#loader').html('');
    }

}
function showLoaderOwnPage(value,id) {
    if (value)
    {
        $('#'+id).html('<div class="loader"><div class="status"></div></div>');
    } else
    {
    	$('#'+id).html('');
    }

}
