package com.spring.mom.vo;

import org.springframework.web.multipart.MultipartFile;

public class Community_vsVO {
	private int vs_no;
	private String vs_title;
	private String vs_writer;
	private String vs_content;
	private String vs_date;
	private String vs_img1;
	private String vs_img2;
	private int vs_rownumber;
	private int vs_count;

	private MultipartFile vs_img1_file;
	private MultipartFile vs_img2_file;

	private int start;
	private int listcnt;

	private String searchCondition;
	private String searchKeyword;

	public int getVs_no() {
		return vs_no;
	}

	public void setVs_no(int vs_no) {
		this.vs_no = vs_no;
	}

	public String getVs_title() {
		return vs_title;
	}

	public void setVs_title(String vs_title) {
		this.vs_title = vs_title;
	}

	public String getVs_writer() {
		return vs_writer;
	}

	public void setVs_writer(String vs_writer) {
		this.vs_writer = vs_writer;
	}

	public String getVs_content() {
		return vs_content;
	}

	public void setVs_content(String vs_content) {
		this.vs_content = vs_content;
	}

	public String getVs_date() {
		return vs_date;
	}

	public void setVs_date(String vs_date) {
		this.vs_date = vs_date;
	}

	public String getVs_img1() {
		return vs_img1;
	}

	public void setVs_img1(String vs_img1) {
		this.vs_img1 = vs_img1;
	}

	public String getVs_img2() {
		return vs_img2;
	}

	public void setVs_img2(String vs_img2) {
		this.vs_img2 = vs_img2;
	}

	public MultipartFile getVs_img1_file() {
		return vs_img1_file;
	}

	public void setVs_img1_file(MultipartFile vs_img1_file) {
		this.vs_img1_file = vs_img1_file;
	}

	public MultipartFile getVs_img2_file() {
		return vs_img2_file;
	}

	public void setVs_img2_file(MultipartFile vs_img2_file) {
		this.vs_img2_file = vs_img2_file;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getListcnt() {
		return listcnt;
	}

	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}

	public int getVs_rownumber() {
		return vs_rownumber;
	}

	public void setVs_rownumber(int vs_rownumber) {
		this.vs_rownumber = vs_rownumber;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getVs_count() {
		return vs_count;
	}

	public void setVs_count(int vs_count) {
		this.vs_count = vs_count;
	}

	@Override
	public String toString() {
		return "Community_vsVO [vs_no=" + vs_no + ", vs_title=" + vs_title + ", vs_writer=" + vs_writer
				+ ", vs_content=" + vs_content + ", vs_date=" + vs_date + ", vs_img1=" + vs_img1 + ", vs_img2="
				+ vs_img2 + ", vs_img1_file=" + vs_img1_file + ", vs_img2_file=" + vs_img2_file + "]";
	}
}
