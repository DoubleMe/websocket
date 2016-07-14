<!DOCTYPE html>  
<html>  
<head>  
    <title>WebSocket/SockJS Echo Sample (Adapted from Tomcat's echo sample)</title>  
    <style type="text/css">  
        #connect-container {  
            float: left;  
            width: 400px  
        }  
  
        #connect-container div {  
            padding: 5px;  
        }  
  
        #console-container {  
            float: left;  
            margin-left: 15px;  
            width: 400px;  
        }  
  
        #console {  
            border: 1px solid #CCCCCC;  
            border-right-color: #999999;  
            border-bottom-color: #999999;  
            height: 170px;  
            overflow-y: scroll;  
            padding: 5px;  
            width: 100%;  
        }  
  
        #console p {  
            padding: 0;  
            margin: 0;  
        }  
    </style>  
  
    <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>  
  
    <script type="text/javascript">
        function setConnected(connected) {
            document.getElementById('connect').disabled = connected;
            document.getElementById('disconnect').disabled = !connected;
            document.getElementById('echo').disabled = !connected;
            document.getElementById('message').innerHTML = '';
        }

        function connect() {
        	if ('WebSocket' in window){
        		  console.log('Websocket supported');
        		  socket = new WebSocket('ws://localhost:8080/socket/websocket');

        		  console.log('Connection attempted');

        		  socket.onopen = function(){
        			   console.log('Connection open!');
        			   setConnected(true);
        			}

        		  socket.onclose = function(){
        			  console.log('Disconnecting connection');
       			  }

        		  socket.onmessage = function (evt) 
        		     { 
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

        function sendName() {
            var message = document.getElementById('message').value;
            socket.send(JSON.stringify({ 'message': message }));
        }

        function showMessage(message) {
            var console = document.getElementById('console');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            console.appendChild(p);
        }

</script>  
</head>  
<body>  
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websockets   
    rely on Javascript being enabled. Please enable  
    Javascript and reload this page!</h2></noscript>  
<div>  
    <div id="connect-container">
        <div>  
            <button id="connect" onclick="connect();">Connect</button>  
            <button id="disconnect" disabled="disabled" onclick="disconnect();">Disconnect</button>  
        </div>  
        <div>  
            <textarea id="message" style="width: 350px">Here is a message!</textarea>  
        </div>  
        <div>  
            <button id="echo" onclick="sendName();" disabled="disabled">Echo message</button>  
        </div>  
    </div>  
    <div id="console-container">  
        <div id="console"></div>  
    </div>  
</div>  
</body>  
</html> 