function setConnected(connected) {
	document.getElementById('connect').disabled = connected;
	document.getElementById('disconnect').disabled = !connected;
	document.getElementById('echo').disabled = !connected;
}

function connect() {
	if ('WebSocket' in window) {
		console.log('Websocket supported');
		socket = new WebSocket('ws://localhost:8080/socket/websocket');

		console.log('Connection attempted');

		socket.onopen = function() {
			console.log('Connection open!');
			setConnected(true);
		}

		socket.onclose = function() {
			console.log('Disconnecting connection');
		}

		socket.onmessage = function(evt) {
			var received_msg = evt.data;
			console.log(received_msg);
			console.log('message received!');
			showMessage(received_msg);
		}

	} else {
		console.log('Websocket not supported');
	}
}

function disconnect() {
	setConnected(false);
	console.log("Disconnected");
}

function sendMessage() {
	var message = document.getElementById('message').value;
	var time = new Date();
	var json = JSON.stringify({
		'message' : message,
		'time':time
	})
	document.getElementById('message').innerHTML = '';
	socket.send(json);
	
}

function showMessage(message) {
	var json = JSON.parse(message);
	var console = document.getElementById('console');
	var username = document.createElement('p');
	username.style.wordWrap = 'break-word';
	username.appendChild(document.createTextNode(json.username));
	console.appendChild(username);
	var _message = document.createElement('p');
	_message.style.wordWrap = 'break-word';
	_message.appendChild(document.createTextNode(json.message));
	console.appendChild(_message);
}
