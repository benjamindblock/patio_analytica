// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready', function() {

  if($('#patios_show').length > 0){
    set_letters();
    animate_letters();
  }

  function set_letters(){
  	var letters = $('.name-for-animation').text();
  	var wavy_letters = $('#wavy_letters');
  	for (i = 0; i < letters.length; i++) {
  		$('<div>', {
  			html: letters[i]
  		})
  		.addClass('letter')
  		.appendTo(wavy_letters);
  	}
  }

  function animate_letters(){
    var width = $(window).width() - 40;
    var starttime = new Date().getTime();

    setInterval(function(){
      var elapsed = new Date().getTime() - starttime;
  		var pos = elapsed * 0.1;

  		$('div.letter').each(function(index, letter) {
  			var posx = (pos + 20 * index) % width;
  			var posy = 100 + Math.sin(posx / 80) * 80;
        $(letter).animate({
          left: posx + 'px',
          top: posy + 'px'
        }, 30);
  		});
    }, 30);
  }
});
