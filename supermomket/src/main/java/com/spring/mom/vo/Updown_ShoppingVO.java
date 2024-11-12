package com.spring.mom.vo;

public class Updown_ShoppingVO {

	private String cm_writer;
	private int cm_no;
	private int cm_updownstatus;
	
	
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public int getCm_updownstatus() {
		return cm_updownstatus;
	}
	public void setCm_updownstatus(int cm_updownstatus) {
		this.cm_updownstatus = cm_updownstatus;
	}
	@Override
	public String toString() {
		return "Community_updownVO [cm_writer=" + cm_writer + ", cm_no=" + cm_no + ", cm_updownstatus=" + cm_updownstatus + "]";
	}
	
	
	
	
}
