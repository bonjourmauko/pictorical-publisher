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
		
	} else { $('p:first').before('<div class="parnum">CAP</div>');}
  

  $('p').each(function(index) {

    var positionemail = pad(index+1,3);
    $(this).after('<div class="parnum">'+pad(index+1,3)+'</div>');

    var string = $(this).text();
    var count = string.split(" "); 
    wordcount = wordcount + count.length;

    });

    wordcount = wordcount/1.2; // correction for number of word 

    var number_of_illustrations = wordcount/300;
    var number_of_illustrations_top = Math.round(number_of_illustrations*1.2);
    var number_of_illustrations_bottom = Math.round(Math.min(wordcount/300,20+(wordcount-6000)/600,30+(wordcount-12000)/1200)*0.9);

    $('#number_of_illustrations').html( number_of_illustrations_bottom + "-" + number_of_illustrations_top );

});