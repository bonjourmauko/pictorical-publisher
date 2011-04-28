$(document).ready(function() {
  
  var wordcount = 0;
  
	
	//assigns caps

		
		
	$('#story h1').each(function(index) {
		
		var key = 'cap' + (index+1)

		if( $('#'+key).length > 0 )
		{
			$('#'+key).insertAfter($(this));
		}

	});


	

  $('#story p').each(function(index) {

		var key = 'inline' + (index+1)
		
		if( $('#'+key).length > 0 )
		{
			$('#'+key).insertAfter($(this));
		}

  });


});