<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            height: 95%;    
            overflow-y: scroll;  
            padding: 5px;  
            width: 110%;  
        }  
  
        #console p {  
            padding: 0;  
            margin: 0;  
        }  
    </style>  
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<script type="text/javascript" src="js/chat.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="container" align="center">
	<h1>Groupconsult</h1>
	<table align="center" height="500px" width="800px" border="1">
		<tbody>
		<tr>
			<td width="30%">
				<h3>user</h3>
				<ul>
					<li>tom</li>
					<li>tony</li>
					<li>cat</li>
				</ul>
				<div>  
            <button id="connect" onclick="connect();">Connect</button>  
            <button id="disconnect" disabled="disabled" onclick="disconnect();">Disconnect</button>  
        </div> 
			</td>
			<td width="70%">
				<div id="console-container"  style="width:450px;height:450px">
					<div id="console"></div>
				</div>
				<div style="bottom:0px">
					<input id="message" type="text"  style="width:430px;height:30px">
					<button id="echo" onclick="sendMessage()"disabled="disabled" style="width:100px;height:30px">send</button>
				</div>
			</td>
		</tr>
		
		</tbody>
		
	</table>
	
	
	</div>

</body>
</html>