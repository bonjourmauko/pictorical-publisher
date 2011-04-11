function upload_link(type, position){
	
	if(type == "cap") { var what = "capital" }
	else
	{
		if(type == "inline") { var what = "illustration" }
		else
		{
			if(type == "cover") { var what = "cover" }
		}
	}
	
	str = '<div class="upload-link"><a href="/illustrations/new/' + type + '/' + position + '">Upload '+what+' here</a></div>';
	
	return str;
	
}


$(document).ready(function() {
  
  var wordcount = 0;
  
	
	//assigns caps

		
		
	$('#story h1').each(function(index) {
		
		var key = 'cap' + (index+1)

		if( $('#'+key).length > 0 )
		{
			$('#'+key).insertAfter($(this));
		}
		else
		{
			$(this).after( upload_link('cap', index+1) );
		}
	});


	

  $('#story p').each(function(index) {

		var key = 'inline' + (index+1)
		
		if( $('#'+key).length > 0 )
		{
			$('#'+key).insertAfter($(this));
		}
		else
		{
			$(this).after( upload_link('inline', index+1) );
		}

  });


});