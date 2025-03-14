package com.spring.mom.vo;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class TradeVO {
	private int t_no;
	private String t_writer;
	private String t_product;
	private int t_price;
	private String t_class;
	private String t_content;
	private String t_condition;
	private String t_date;
	private String t_img;
	private MultipartFile[] t_image;
	private String searchCondition; 
	private String searchKeyword;
	private int t_cnt;
	private String t_status;

	public int getT_cnt() {
		return t_cnt;
	}

	public String getT_status() {
		return t_status;
	}

	public void setT_status(String t_status) {
		this.t_status = t_status;
	}

	public void setT_cnt(int t_cnt) {
		this.t_cnt = t_cnt;
	}

	public MultipartFile[] getT_image() {
		return t_image;
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

	public void setT_image(MultipartFile[] t_image) {
		this.t_image = t_image;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public String getT_writer() {
		return t_writer;
	}

	public void setT_writer(String t_writer) {
		this.t_writer = t_writer;
	}

	public String getT_product() {
		return t_product;
	}

	public void setT_product(String t_product) {
		this.t_product = t_product;
	}

	public int getT_price() {
		return t_price;
	}

	public void setT_price(int t_price) {
		this.t_price = t_price;
	}

	public String getT_class() {
		return t_class;
	}

	public void setT_class(String t_class) {
		this.t_class = t_class;
	}

	public String getT_content() {
		return t_content;
	}

	public void setT_content(String t_content) {
		this.t_content = t_content;
	}

	public String getT_condition() {
		return t_condition;
	}

	public void setT_condition(String t_condition) {
		this.t_condition = t_condition;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

	public String getT_img() {
		return t_img;
	}

	public void setT_img(String t_img) {
		this.t_img = t_img;
	}

	@Override
	public String toString() {
		return "TradeVO [t_no=" + t_no + ", t_writer=" + t_writer + ", t_product=" + t_product + ", t_price=" + t_price
				+ ", t_class=" + t_class + ", t_content=" + t_content + ", t_condition=" + t_condition + ", t_date="
				+ t_date + ", t_img=" + t_img + ", t_image=" + Arrays.toString(t_image) + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", t_cnt=" + t_cnt + ", t_status=" + t_status
				+ "]";
	}

}
