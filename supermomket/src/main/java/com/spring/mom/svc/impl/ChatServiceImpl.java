package com.spring.mom.svc.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.ChatDAOMybatis;
import com.spring.mom.vo.ChatMessageVO;
import com.spring.mom.vo.ChatRoomVO;
import com.spring.mom.vo.ChatService;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
    

    
    @Autowired
    private ChatDAOMybatis chatDAO;
    
    
    @Override
    public int getChatRoomCountByTradeNo(int tNo) {
        return chatDAO.getChatRoomCountByTradeNo(tNo);
    }
    
    
    public boolean markRoomAsDeleted(int roomId, String userId) {
        ChatRoomVO room = chatDAO.getChatRoom(roomId);
        if (room == null) {
            throw new RuntimeException("채팅방을 찾을 수 없습니다.");
        }
        
        if (userId.equals(room.getSellerId())) {
            room.setDeletedSeller(true);
        } else if (userId.equals(room.getBuyerId())) {
            room.setDeletedBuyer(true);
        } else {
            return false;
        }
        
        return chatDAO.updateChatRoom(room) > 0;
    }
    
    
    @Override
    public ChatRoomVO createChatRoom(String sellerId, String buyerId, int tNo) {
        // 기존 채팅방이 있는지 확인
        ChatRoomVO existingRoom = findExistingRoom(sellerId, buyerId, tNo);
        if (existingRoom != null) {
            return existingRoom;
        }
        
        // 새 채팅방 생성
        ChatRoomVO room = new ChatRoomVO();
        room.setSellerId(sellerId);
        room.setBuyerId(buyerId);
        room.settNo(tNo);
        chatDAO.createChatRoom(room);
        return room;
    }
    
    @Override
    public List<ChatRoomVO> getChatRoomList(String userId) {
        List<ChatRoomVO> rooms = chatDAO.getChatRoomList(userId);
        return rooms.stream()
            .filter(room -> {
                boolean isSeller = userId.equals(room.getSellerId());
                boolean isBuyer = userId.equals(room.getBuyerId());
                
                return (isSeller && !room.isDeletedSeller()) || 
                       (isBuyer && !room.isDeletedBuyer());
            })
            .collect(Collectors.toList());
    }
    
    @Override
    public List<ChatMessageVO> getChatMessages(int roomId) {
        return chatDAO.getChatMessages(roomId);
    }
    
    @Override
    public boolean saveMessage(ChatMessageVO message) {
        try {
            message.setRead(false);
            int result = chatDAO.saveMessage(message);
            System.out.println("메시지 저장 결과: " + result + ", 메시지 내용: " + message.toString());
            return result > 0;
        } catch (Exception e) {  // 여기서 불필요한 문자 제거
            System.err.println("메시지 저장 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ChatRoomVO getChatRoom(int roomId) {
        return chatDAO.getChatRoom(roomId);
    }

    @Override
    public ChatRoomVO findExistingRoom(String sellerId, String userId, int tNo) {
        ChatRoomVO param = new ChatRoomVO();
        param.setSellerId(sellerId);
        param.setBuyerId(userId);
        param.settNo(tNo);
        return chatDAO.findExistingRoom(param);
    }
}