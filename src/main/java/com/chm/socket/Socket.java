package com.chm.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

public class Socket {

	
	public static Map<String,UserSession> users = new HashMap<String,UserSession>();
	
	public static void addUser(String username,WebSocketSession session){
		UserSession user = new UserSession(username, session);
		users.put(username, user);
	}
	
	public static void removeUser(String username,WebSocketSession session){
		users.remove(username);
	}
}
