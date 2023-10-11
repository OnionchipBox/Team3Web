package com.team3web.shop.webSocket;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler {

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
        String receivedMessage = message.getPayload();
        
        session.sendMessage(new TextMessage("처리되었습니다"));
    }
    
    @MessageMapping("/updateInfo")
    @SendTo("/topic/infoUpdates")
    public String updateUserList(String message) {
        message = "회원 정보가 변경되었습니다.";
        return message;
    }
}