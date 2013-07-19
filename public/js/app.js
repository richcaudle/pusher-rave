$(function () {
	initPusher();
});

function changeColour(bgColour, fgColour)
{
	$('body').css('background-color', bgColour);
	$('h1').css('color', fgColour);
}

function initPusher()
{
	// --- FOR DEBUG ONLY -- //
	Pusher.log = function (message) {
	    if (window.console && window.console.log) {
	        window.console.log(message);
	    }
	};

	// --- CONNECT TO PUSHER -- //
    var pusher = new Pusher(PUSHER_CONFIG.APP_KEY);

	// --- SUBSCRIBE TO COMMENTS CHANNEL -- //
	chColours = pusher.subscribe('rave-colours');

	chColours.bind('colour-change', function(data) {
		changeColour(data.bgColour, data.fgColour);
	});
	
	// Hide the address bar!
	window.scrollTo(0, 1);

}