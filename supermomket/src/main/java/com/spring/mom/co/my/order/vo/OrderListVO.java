package com.spring.mom.co.my.order.vo;

//주문관련VO
public class OrderListVO {

	//실주문번호
	private String orderListID;
	//주문자아이디
	private String orderUserId;
	//주문자명
	private String orderUsername;
	//주문자메일
	private String orderUserEmail;
	//수취인
	private String orderReceiveName;
	//수취인 연락처
	private String orderReceiveTel;
	//배송주소
	private String orderReceiveAddr;
	//대표상품명
	private String orderName;
	//총 결제금액
	private int totalAmount;
	
	/*PortOneVO에서 가져온 데이터*/
	//결제수단
	private String pay_method;
	//포트원 고유 결제번호(중복불가)
	private String imp_uid;
	//우리가 만든 주문번호(중복불가)
	private String merchant_uid;
	//결제승인시각 (UNIX timestamp)
	private String paid_at;
	
	public String getOrderListID() {
		return orderListID;
	}
	public void setOrderListID(String orderListID) {
		this.orderListID = orderListID;
	}
	public String getOrderUserId() {
		return orderUserId;
	}
	public void setOrderUserId(String orderUserId) {
		this.orderUserId = orderUserId;
	}
	public String getOrderUsername() {
		return orderUsername;
	}
	public void setOrderUsername(String orderUsername) {
		this.orderUsername = orderUsername;
	}
	public String getOrderUserEmail() {
		return orderUserEmail;
	}
	public void setOrderUserEmail(String orderUserEmail) {
		this.orderUserEmail = orderUserEmail;
	}
	public String getOrderReceiveName() {
		return orderReceiveName;
	}
	public void setOrderReceiveName(String orderReceiveName) {
		this.orderReceiveName = orderReceiveName;
	}
	public String getOrderReceiveTel() {
		return orderReceiveTel;
	}
	public void setOrderReceiveTel(String orderReceiveTel) {
		this.orderReceiveTel = orderReceiveTel;
	}
	public String getOrderReceiveAddr() {
		return orderReceiveAddr;
	}
	public void setOrderReceiveAddr(String orderReceiveAddr) {
		this.orderReceiveAddr = orderReceiveAddr;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPaid_at() {
		return paid_at;
	}
	public void setPaid_at(String paid_at) {
		this.paid_at = paid_at;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [orderListID=" + orderListID + ", orderUserId=" + orderUserId + ", orderUsername="
				+ orderUsername + ", orderUserEmail=" + orderUserEmail + ", orderReceiveName=" + orderReceiveName
				+ ", orderReceiveTel=" + orderReceiveTel + ", orderReceiveAddr=" + orderReceiveAddr + ", orderName="
				+ orderName + ", totalAmount=" + totalAmount + ", pay_method=" + pay_method + ", imp_uid=" + imp_uid
				+ ", merchant_uid=" + merchant_uid + ", paid_at=" + paid_at + "]";
	}
}
