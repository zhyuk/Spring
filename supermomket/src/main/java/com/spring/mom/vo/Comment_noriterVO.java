package com.spring.mom.vo;

public class Comment_noriterVO {
	private int co_no;
	private Integer co_no2;
	private String co_writer;
	private String co_content;
	private String co_date;
	private String co_date2;
	private int cm_no;
	
	
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public Integer getCo_no2() {
		return co_no2;
	}
	public void setCo_no2(Integer co_no2) {
		this.co_no2 = co_no2;
	}
	public String getCo_writer() {
		return co_writer;
	}
	public void setCo_writer(String co_writer) {
		this.co_writer = co_writer;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public String getCo_date() {
		return co_date;
	}
	public void setCo_date(String co_date) {
		this.co_date = co_date;
	}
	public String getCo_date2() {
		return co_date2;
	}
	public void setCo_date2(String co_date2) {
		this.co_date2 = co_date2;
	}
	@Override
	public String toString() {
		return "Comment_noriterVO [co_no=" + co_no + ", co_no2=" + co_no2 + ", co_writer=" + co_writer + ", co_content=" + co_content + ", co_date=" + co_date + ", co_date2=" + co_date2 + "]";
	}

	
}
