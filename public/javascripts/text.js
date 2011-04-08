function pad(number, length) {

    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;

}

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
	
	str = '<div class="upload-link"><a href="/illustrations/new?type=' + type + '&position=' + position + '">Upload '+what+' here</a></div>';
	
	return str;
	
}


function illustration_image(type, src, id){
	
	str = '<div class="illustration"><img src="'+ src +'" class="'+ type +'"><br>'+  illustration_delete_link(id)+'</div>';
	
	return str;
	
}

function illustration_delete_link(id){
	str = '<a href="/illustrations/'+id+'" class="delete-link" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete illustration</a>';
	return str;
}

$(document).ready(function() {
  
  var wordcount = 0;
  
	if($('#story h1').length > 0) { var multistory = true } else { var multistory = false }
	
	//assigns caps

	if(multistory){
		
		
		$('#story h1').each(function(index) {
			
			var key = 'cap' + (index+1)

			if(ill[key])
			{
				$(this).after( illustration_image('cap', ill[key], ill_id[key] ) );
			}
			else
			{
				$(this).after( upload_link('cap', index+1) );
			}
		});
		
	} else {
		
		if(ill['cap1'])
		{
			$('#story p:first').before( illustration_image('cap', ill['cap1'], ill_id['cap1']) );
		}
		else
		{
			$('#story p:first').before( upload_link('cap', 1) );
		}
	}
  

	

  $('#story p').each(function(index) {

		var key = 'in' + (index+1)
		
		if(ill[key])
		{
			$(this).after( illustration_image('inline', ill[key], ill_id[key]) );
		}
		else
		{
			$(this).after( upload_link('inline', index+1) );
		}

  });


});