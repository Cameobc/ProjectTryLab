package com.project.trylab.chat;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {

	//log를 찍어줄 logger
	private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	//seeeion 아이디를 담을 후보군
	//1. list    2.ConcurrentHashMap
	private List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	
	//클라이언트와 연결 이후 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		//세션값을 {}에 넣으세요.
		logger.info("{} 연결됌", session.getId());
		System.out.println("채팅방 입장자 : "+session.getPrincipal().getName());
	}

	
	//클라이언트가 서버로 메세지르 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로부터 {} 받음", session.getId(), message.getPayload());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}


	
	
}
