package com.chm.socket;

import org.springframework.web.socket.WebSocketSession;

public class UserSession {
	
	private String username;
	private WebSocketSession webSocket;
	
	public UserSession(String username,WebSocketSession webSocket){
		this.username = username;
		this.webSocket = webSocket;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setWebSocket(WebSocketSession webSocket){
		this.webSocket = webSocket;
	}
	
	public WebSocketSession getWebSocket(){
		return this.webSocket;
	}
}
