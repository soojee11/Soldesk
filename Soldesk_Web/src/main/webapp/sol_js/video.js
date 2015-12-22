/*
JS Modified from a tutorial found here: 
http://www.inwebson.com/html5/custom-html5-video-controls-with-jquery/

I really wanted to learn how to skin html5 video.
*/
$(document).ready(function(){
	//INITIALIZE
	var video = $('#myVideo');
	
	//remove default control when JS loaded
	$('.caption').fadeIn(500);
			
		//bind video events
		$('.videoContainer')
		.hover(function() {
			$('.caption').stop().fadeIn();
		}, function() {
			if(!volumeDrag && !timeDrag){
				$('.caption').stop().fadeOut();
			}
		});
});
