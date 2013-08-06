// Only required for local network
Pusher.Network = new Pusher.EventsDispatcher();
Pusher.Network.isOnline = function() { return true; }

$(function () {
	initPusher();
});

function initPusher()
{
	// TODO: Write debug messages to console

	// TODO: Connect to Pusher
	
	// TODO: Subscribe to colours channel
	
	// TODO: Bind to colour change event
	
}

function changeColour(colour)
{
	$('body').css('background-color', colour);
}

function getRandomInt(min, max)
{
	return Math.floor(Math.random() * (max - min + 1)) + min;
}