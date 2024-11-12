package com.spring.mom.vo;

public class FaqVO {
	private int faq_no;
	private String faq_q;
	private String faq_a;
	private String faq_class;

	private String searchCondition;
	private String searchKeyword;
	private String searchClass;

	private int start;
	private int listcnt;

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

	public String getSearchClass() {
		return searchClass;
	}

	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
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

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_q() {
		return faq_q;
	}

	public void setFaq_q(String faq_q) {
		this.faq_q = faq_q;
	}

	public String getFaq_a() {
		return faq_a;
	}

	public void setFaq_a(String faq_a) {
		this.faq_a = faq_a;
	}

	public String getFaq_class() {
		return faq_class;
	}

	public void setFaq_class(String faq_class) {
		this.faq_class = faq_class;
	}

	@Override
	public String toString() {
		return "FaqVO [faq_no=" + faq_no + ", faq_q=" + faq_q + ", faq_a=" + faq_a + ", faq_class=" + faq_class
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", searchClass="
				+ searchClass + "]";
	}
}
