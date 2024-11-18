package com.spring.mom.vo;

import java.util.Date;

public class ReviewVO {
	
    // 리뷰 관련 필드
    private int c_cid;                  // 리뷰 번호
    private int c_no;
    private String c_id;               // 리뷰 작성자 ID
    private String c_text;             // 리뷰 내용
    private int c_avg;                 // 리뷰 평점
    private String c_img;              // 리뷰 이미지 URL
    private Date created_at; // 작성 시간 추가
    private String c_delete; // 삭제 여부
    private String merchant_uid; // 주문번호
    
	public int getC_cid() {
		return c_cid;
	}
	public void setC_cid(int c_cid) {
		this.c_cid = c_cid;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_text() {
		return c_text;
	}
	public void setC_text(String c_text) {
		this.c_text = c_text;
	}
	public int getC_avg() {
		return c_avg;
	}
	public void setC_avg(int c_avg) {
		this.c_avg = c_avg;
	}
	public String getC_img() {
		return c_img;
	}
	public void setC_img(String c_img) {
		this.c_img = c_img;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getC_delete() {
		return c_delete;
	}
	public void setC_delete(String c_delete) {
		this.c_delete = c_delete;
	}
		
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	@Override
	public String toString() {
		return "ReviewVO [c_cid=" + c_cid + ", c_no=" + c_no + ", c_id=" + c_id + ", c_text=" + c_text + ", c_avg="
				+ c_avg + ", c_img=" + c_img + ", created_at=" + created_at + ", c_delete=" + c_delete
				+ ", merchant_uid=" + merchant_uid + "]";
	}


}
