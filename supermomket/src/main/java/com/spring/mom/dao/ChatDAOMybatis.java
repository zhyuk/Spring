

package com.spring.mom.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.ChatMessageVO;
import com.spring.mom.vo.ChatRoomVO;

@Repository
public class ChatDAOMybatis {
    
    @Autowired
    private SqlSessionTemplate mybatis;
    
    public int updateChatRoom(ChatRoomVO room) {
        return mybatis.update("ChatDAO.updateChatRoom", room);
    }
    
    public void createChatRoom(ChatRoomVO room) {
        mybatis.insert("ChatDAO.createChatRoom", room);
    }
    
    public List<ChatRoomVO> getChatRoomList(String userId) {
        return mybatis.selectList("ChatDAO.getChatRoomList", userId);
    }
    
    public List<ChatMessageVO> getChatMessages(int roomId) {
        return mybatis.selectList("ChatDAO.getChatMessages", roomId);
    }
    
    public int saveMessage(ChatMessageVO message) {  
        return mybatis.insert("ChatDAO.saveMessage", message); 
    }
    
    public ChatRoomVO getChatRoom(int roomId) {
        return mybatis.selectOne("ChatDAO.getChatRoom", roomId);
    }
    
    public ChatRoomVO findExistingRoom(ChatRoomVO param) {
        return mybatis.selectOne("ChatDAO.findExistingRoom", param);
    }
}