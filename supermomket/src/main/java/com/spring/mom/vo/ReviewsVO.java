package com.spring.mom.vo;

public class ReviewsVO {
	private int p_no;
	private String r_writer;
	private String r_date ;
	private String r_content;

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	} 
}
