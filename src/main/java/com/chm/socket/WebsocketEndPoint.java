package com.chm.socket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;  
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;  
import org.springframework.web.socket.handler.TextWebSocketHandler;  

import com.chm.model.MessageDO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
  
public class WebsocketEndPoint extends TextWebSocketHandler {  
  
    @Override  
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {  
        
        ObjectMapper mapper = new ObjectMapper();
        MessageDO messageDO = mapper.readValue(message.getPayload(), MessageDO.class);
        messageDO.setUsername(session.getId());
        String msg = mapper.writeValueAsString(messageDO);
        TextMessage returnMessage = new TextMessage(msg);
        
        for(UserSession user : Socket.users.values()){
        	user.getWebSocket().sendMessage(returnMessage);
        }
    }  
    @Override
    public void handleMessage(WebSocketSession session,
    		WebSocketMessage<?> message) throws Exception {
    	// TODO Auto-generated method stub
    	System.out.println("handleMessage");
    	super.handleMessage(session, message);
    	
    }
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
    		throws Exception {
    	Socket.addUser(session.getId(), session);
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session,
    		CloseStatus status) throws Exception {
    	System.out.println("¶Ï¿ªÁ¬½Ó²âÊÔ~~~~~~~~~~~~~~");
    	Socket.removeUser(session.getId(), session);
    }
}  
