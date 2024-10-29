package com.spring.mom.vo;

public class Comment_vsVO {

	private int vs_no;
	private int vs_cno;
	private String vs_writer = "test1";
	private String vs_date;
	private String vs_comment;

	public int getVs_no() {
		return vs_no;
	}

	public void setVs_no(int vs_no) {
		this.vs_no = vs_no;
	}

	public int getVs_cno() {
		return vs_cno;
	}

	public void setVs_cno(int vs_cno) {
		this.vs_cno = vs_cno;
	}

	public String getVs_writer() {
		return vs_writer;
	}

	public void setVs_writer(String vs_writer) {
		this.vs_writer = vs_writer;
	}

	public String getVs_date() {
		return vs_date;
	}

	public void setVs_date(String vs_date) {
		this.vs_date = vs_date;
	}

	public String getVs_comment() {
		return vs_comment;
	}

	public void setVs_comment(String vs_comment) {
		this.vs_comment = vs_comment;
	}

	@Override
	public String toString() {
		return "Comment_vsVO [vs_no=" + vs_no + ", vs_cno=" + vs_cno + ", vs_writer=" + vs_writer + ", vs_date="
				+ vs_date + ", vs_comment=" + vs_comment + "]";
	}

}
