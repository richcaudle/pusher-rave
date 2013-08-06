// --- FOR DEBUG ONLY -- //
Pusher.log = function(message) {
	console.log(message);
}

// PUSHER - LOCAL SERVER //
var pusher = new Pusher(PUSHER_CONFIG.APP_KEY, {
    wsHost: "192.168.1.9",
    wsPort: 8300
});

// SUBSCRIBE TO COLOURS CHANNEL //
chColours = pusher.subscribe('rave-' + getRandomInt(1,2));

chColours.bind('colour-change', function(data) {
	changeColour(data.colour);
});