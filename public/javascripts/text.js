function pad(number, length) {

    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;

}


$(document).ready(function() {
  
  var wordcount = 0;
  
	if($('#story h1').length){
		
		$('#story h1').each(function(index) {

			$(this).after('<div class="parnum">CAP'+ (index+1) +'</div>');
			
		});
		
	} else { $('#story p:first').before('<div class="parnum">CAP</div>');}
  

  $('#story p').each(function(index) {

		var key = 'in' + (index+1)
		
		if(inline[key])
		{
			$(this).after('<p><img src='+inline[key]+'></p>');
			
		}
		else
		{
			$(this).after('<p class="upload-link"><a href="/illustrations/new?type=inline&position='+ (index+1) +'">Upload illustration here</a></p>');
		}

  });


});