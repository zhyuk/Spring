package com.spring.mom.vo;

import java.util.List;

public interface ChatService {
	   ChatRoomVO createChatRoom(String sellerId, String buyerId, int tNo);
	    List<ChatRoomVO> getChatRoomList(String userId);
	    List<ChatMessageVO> getChatMessages(int roomId);
	    boolean saveMessage(ChatMessageVO message);
	    ChatRoomVO getChatRoom(int roomId);
	    ChatRoomVO findExistingRoom(String sellerId, String userId, int tNo);
	    boolean markRoomAsDeleted(int roomId, String userId);
}