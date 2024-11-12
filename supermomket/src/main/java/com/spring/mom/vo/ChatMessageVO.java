package com.spring.mom.vo;
import java.sql.Timestamp;
public class ChatMessageVO {
	
	private int messageId;
    private int roomId;
    private String senderId;
    private String message;
    private Timestamp sentAt;
    private boolean isRead;
    private String senderNickname;
    private String type;
	
    public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getSentAt() {
		return sentAt;
	}
	public void setSentAt(Timestamp sentAt) {
		this.sentAt = sentAt;
	}
	public boolean isRead() {
		return isRead;
	}
	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}
	public String getSenderNickname() {
		return senderNickname;
	}
	public void setSenderNickname(String senderNickname) {
		this.senderNickname = senderNickname;
	}
	@Override
	public String toString() {
		return "ChatMessageVO [messageId=" + messageId + ", roomId=" + roomId + ", senderId=" + senderId + ", message="
				+ message + ", sentAt=" + sentAt + ", isRead=" + isRead + ", senderNickname=" + senderNickname
				+ ", type=" + type + "]";
	}

}
