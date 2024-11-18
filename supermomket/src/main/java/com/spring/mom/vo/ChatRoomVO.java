package com.spring.mom.vo;
import java.sql.Timestamp;
public class ChatRoomVO {
	
	  private int roomId;
	    private String sellerId;
	    private String buyerId;
	    private int tNo;
	    private Timestamp createdAt;
	    private String lastMessage;    // 마지막 메시지 내용
	    private String sellerNickname; // 판매자 닉네임
	    private String buyerNickname;  // 구매자 닉네임
	    private String productName;  // 상품명
	    private boolean isDeletedSeller;
	    private boolean isDeletedBuyer;
	    private String productImage;
		public boolean isDeletedSeller() {
			return isDeletedSeller;
		}
		public void setDeletedSeller(boolean isDeletedSeller) {
			this.isDeletedSeller = isDeletedSeller;
		}
		public boolean isDeletedBuyer() {
			return isDeletedBuyer;
		}
		public String getProductImage() {
			return productImage;
		}
		public void setProductImage(String productImage) {
			this.productImage = productImage;
		}
		public void setDeletedBuyer(boolean isDeletedBuyer) {
			this.isDeletedBuyer = isDeletedBuyer;
		}
		public int getRoomId() {
			return roomId;
		}
		public void setRoomId(int roomId) {
			this.roomId = roomId;
		}
		public String getSellerId() {
			return sellerId;
		}
		public void setSellerId(String sellerId) {
			this.sellerId = sellerId;
		}
		public String getBuyerId() {
			return buyerId;
		}
		public void setBuyerId(String buyerId) {
			this.buyerId = buyerId;
		}
		public int gettNo() {
			return tNo;
		}
		public void settNo(int tNo) {
			this.tNo = tNo;
		}
		public Timestamp getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Timestamp createdAt) {
			this.createdAt = createdAt;
		}
		public String getLastMessage() {
			return lastMessage;
		}
		public void setLastMessage(String lastMessage) {
			this.lastMessage = lastMessage;
		}
		public String getSellerNickname() {
			return sellerNickname;
		}
		public void setSellerNickname(String sellerNickname) {
			this.sellerNickname = sellerNickname;
		}
		public String getBuyerNickname() {
			return buyerNickname;
		}
		public void setBuyerNickname(String buyerNickname) {
			this.buyerNickname = buyerNickname;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		@Override
		public String toString() {
			return "ChatRoomVO [roomId=" + roomId + ", sellerId=" + sellerId + ", buyerId=" + buyerId + ", tNo=" + tNo
					+ ", createdAt=" + createdAt + ", lastMessage=" + lastMessage + ", sellerNickname=" + sellerNickname
					+ ", buyerNickname=" + buyerNickname + ", productName=" + productName + ", isDeletedSeller="
					+ isDeletedSeller + ", isDeletedBuyer=" + isDeletedBuyer + ", productImage=" + productImage + "]";
		}

}
