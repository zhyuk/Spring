package com.spring.mom.co.my.order.vo;

//주문상세VO
public class OrderListDetailVO {
	
	//주문상세아이디
	private int orderListDetailNo;
	
	//실주문번호 OrderListVO에서 가져오기
	private String orderListID;
	
	//상품 고유 ID
	String productId;
	
	//상품코드(auto_increment)
	private int productCode;
	
	//주문 총 수량
	private int orderCnt;
	
	//단가
	private int oneProductPrice;
	
	public int getOrderListDetailNo() {
		return orderListDetailNo;
	}
	public void setOrderListDetailNo(int orderListDetailNo) {
		this.orderListDetailNo = orderListDetailNo;
	}
	public String getOrderListID() {
		return orderListID;
	}
	public void setOrderListID(String orderListID) {
		this.orderListID = orderListID;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	public int getOneProductPrice() {
		return oneProductPrice;
	}
	public void setOneProductPrice(int oneProductPrice) {
		this.oneProductPrice = oneProductPrice;
	}
	
	@Override
	public String toString() {
		return "OrderListDetailVO [orderListDetailNo=" + orderListDetailNo + ", orderListID=" + orderListID
				+ ", productId=" + productId + ", productCode=" + productCode + ", orderCnt=" + orderCnt
				+ ", oneProductPrice=" + oneProductPrice + "]";
	}
	
}
