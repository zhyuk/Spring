package com.spring.mom.vo;

public class CommentVO {
	private int cm_no;
	private String cm_class;
	private int co_no;
	private String co_writer;
	private String co_content;
	private String co_date;

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public String getCm_class() {
		return cm_class;
	}

	public void setCm_class(String cm_class) {
		this.cm_class = cm_class;
	}

	public int getCo_no() {
		return co_no;
	}

	public void setCo_no(int co_no) {
		this.co_no = co_no;
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
}
