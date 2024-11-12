package com.spring.mom.co.portone.vo;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class PaymentCancelAnnotationVO {
	private String pg_tid;  //PG사 승인취소번호
	private int amount; //취소 금액
	private Integer cancelled_at; //r취소 시각
	private String reason; //취소 사유
	private String cancellation_id; //결제취소 아이디
	private String receipt_url; // 취소 매출전표 URL
	
	public String getPg_tid() {
		return pg_tid;
	}
	public void setPg_tid(String pg_tid) {
		this.pg_tid = pg_tid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Integer getCancelled_at() {
		return cancelled_at;
	}
	public void setCancelled_at(Integer cancelled_at) {
		this.cancelled_at = cancelled_at;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCancellation_id() {
		return cancellation_id;
	}
	public void setCancellation_id(String cancellation_id) {
		this.cancellation_id = cancellation_id;
	}
	public String getReceipt_url() {
		return receipt_url;
	}
	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}
	@Override
	public String toString() {
		return "PaymentCancelAnnotationVO [pg_tid=" + pg_tid + ", amount=" + amount + ", cancelled_at=" + cancelled_at
				+ ", reason=" + reason + ", cancellation_id=" + cancellation_id + ", receipt_url=" + receipt_url + "]";
	}
}
