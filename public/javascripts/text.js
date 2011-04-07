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

			$(this).after('<p class="upload-link"><a href="/illustrations/new?type=cap&position='+ (index+1) +'">Upload capital here</a></p>');
			
		});
		
	} else { $('#story p:first').before('<p class="upload-link"><a href="/illustrations/new?type=cap&position=1">Upload capital here</a></p>');}
  

  $('#story p').each(function(index) {

		var key = 'in' + (index+1)
		
		if(ill[key])
		{
			$(this).after('<p><img src="'+ill[key]+'" class="inline"></p>');
			
		}
		else
		{
			$(this).after('<p class="upload-link"><a href="/illustrations/new?type=inline&position='+ (index+1) +'">Upload illustration here</a></p>');
		}

  });


});