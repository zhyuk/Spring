package com.spring.config;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.mom.vo.ChatMessageVO;
import com.spring.mom.vo.ChatRoomVO;
import com.spring.mom.vo.ChatService;

@Component
public class ChatHandler extends TextWebSocketHandler {
	
	 @Autowired
	    private ChatService chatService;
    
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final Map<String, Map<String, WebSocketSession>> chatRooms = new ConcurrentHashMap<>();
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        Map<String, String> queryParams = parseQueryString(session.getUri().getQuery());
        String roomId = queryParams.get("roomId");
        String userId = queryParams.get("userId");
        
        if (roomId != null && userId != null) {
            session.getAttributes().put("roomId", roomId);
            session.getAttributes().put("userId", userId);
            
            chatRooms.computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
                    .put(userId, session);
            
            // 입장 메시지 제거
            System.out.println("WebSocket 연결 성공 - Room: " + roomId + ", User: " + userId);
        }
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        try {
            String payload = message.getPayload();
            System.out.println("=== 메시지 수신 ===");
            System.out.println("Session ID: " + session.getId());
            System.out.println("Payload: " + payload);
            
            ChatMessageVO chatMessage = objectMapper.readValue(payload, ChatMessageVO.class);
            String roomId = String.valueOf(chatMessage.getRoomId());
            
            System.out.println("파싱된 메시지 정보:");
            System.out.println("- 방 번호: " + roomId);
            System.out.println("- 발신자: " + chatMessage.getSenderId());
            System.out.println("- 메시지 타입: " + chatMessage.getType());
            System.out.println("- 메시지 내용: " + chatMessage.getMessage());
            
            Map<String, WebSocketSession> roomSessions = chatRooms.get(roomId);
            if (roomSessions != null) {
                System.out.println("\n현재 방 연결 상태:");
                roomSessions.forEach((userId, userSession) -> {
                    System.out.println("- 사용자 " + userId + ": " + 
                        (userSession.isOpen() ? "연결됨" : "연결끊김"));
                });
            }
            
            // 시간 정보 추가
            chatMessage.setSentAt(new java.sql.Timestamp(System.currentTimeMillis()));
            
            // CHAT 타입 메시지만 저장
            if ("CHAT".equals(chatMessage.getType())) {
                // 닉네임 설정
                ChatRoomVO room = chatService.getChatRoom(Integer.parseInt(roomId));
                String nickname = chatMessage.getSenderId().equals(room.getSellerId()) 
                    ? room.getSellerNickname() 
                    : room.getBuyerNickname();
                chatMessage.setSenderNickname(nickname);
                
                boolean saved = chatService.saveMessage(chatMessage);
                System.out.println("메시지 저장 결과: " + saved);
                
                String messageJson = objectMapper.writeValueAsString(chatMessage);
                System.out.println("전송할 메시지 JSON: " + messageJson);
                
                if (roomId != null) {
                    broadcastToRoom(roomId, new TextMessage(messageJson));
                }
            } else if ("LEAVE".equals(chatMessage.getType())) {
                // 퇴장 메시지 처리
                ChatRoomVO room = chatService.getChatRoom(Integer.parseInt(roomId));
                String nickname = chatMessage.getSenderId().equals(room.getSellerId()) 
                    ? room.getSellerNickname() 
                    : room.getBuyerNickname();
                chatMessage.setSenderNickname(nickname);
                chatMessage.setMessage(nickname + "님이 퇴장했습니다.");
                
                String messageJson = objectMapper.writeValueAsString(chatMessage);
                broadcastToRoom(roomId, new TextMessage(messageJson));
            }
            // ENTER 타입은 무시
            
            System.out.println("=== 메시지 처리 완료 ===\n");
        } catch (Exception e) {
            System.err.println("메시지 처리 중 오류 발생: " + e.getMessage());
            System.err.println("오류 내용: " + e.getMessage());
            e.printStackTrace();
            System.err.println("=== 오류 로그 종료 ===\n");
        }
    }
    
    
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        try {
            Object roomIdObj = session.getAttributes().get("roomId");
            Object userIdObj = session.getAttributes().get("userId");
            
            if (roomIdObj != null && userIdObj != null) {
                String roomId = String.valueOf(roomIdObj);
                String userId = String.valueOf(userIdObj);
                
                Map<String, WebSocketSession> roomSessions = chatRooms.get(roomId);
                if (roomSessions != null) {
                    roomSessions.remove(userId);
                    
                    // 퇴장 메시지에 닉네임 추가
                    ChatMessageVO leaveMessage = new ChatMessageVO();
                    leaveMessage.setType("LEAVE");
                    leaveMessage.setRoomId(Integer.parseInt(roomId));
                    leaveMessage.setSenderId(userId);
                    // 닉네임 가져오기 (ChatService를 통해)
                    ChatRoomVO room = chatService.getChatRoom(Integer.parseInt(roomId));
                    String nickname = userId.equals(room.getSellerId()) ? room.getSellerNickname() : room.getBuyerNickname();
                    leaveMessage.setSenderNickname(nickname);
                    leaveMessage.setMessage(nickname + "님이 퇴장했습니다.");
                    leaveMessage.setSentAt(new java.sql.Timestamp(System.currentTimeMillis()));
                    
                    String leaveMessageJson = objectMapper.writeValueAsString(leaveMessage);
                    broadcastToRoom(roomId, new TextMessage(leaveMessageJson));
                    
                    if (roomSessions.isEmpty()) {
                        chatRooms.remove(roomId);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("연결 종료 처리 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    
    private Map<String, String> parseQueryString(String queryString) {
        Map<String, String> result = new HashMap<>();
        if (queryString != null) {
            for (String param : queryString.split("&")) {
                String[] pair = param.split("=");
                if (pair.length == 2) {
                    result.put(pair[0], pair[1]);
                }
            }
        }
        return result;
    }
    
    public void broadcastToRoom(String roomId, TextMessage message) {
        Map<String, WebSocketSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions != null) {
            try {
                ChatMessageVO chatMessage = objectMapper.readValue(message.getPayload(), ChatMessageVO.class);
                String senderId = chatMessage.getSenderId();
                
                roomSessions.forEach((userId, session) -> {
                    try {
                        if (!userId.equals(senderId) && session.isOpen()) {
                            session.sendMessage(message);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}