package com.spring.mom.vo;

import org.springframework.web.multipart.MultipartFile;

public class Community_noriterVO {
	
		private int cm_no;
		private String cm_writer;
		private String cm_title;
		private String cm_content;
		private String cm_date;
		private int cm_view;
		
		private int cot_cnt;
		private int likecnt;
		private int hatecnt;
		
		private String searchCondition; 
		private String searchKeyword; 
		
		private MultipartFile uploadFile;
		private String cm_img;

		private int start; 
		private int listcnt;


		
		
		public int getCot_cnt() {
			return cot_cnt;
		}

		public void setCot_cnt(int cot_cnt) {
			this.cot_cnt = cot_cnt;
		}

		public int getLikecnt() {
			return likecnt;
		}

		public void setLikecnt(int likecnt) {
			this.likecnt = likecnt;
		}

		public int getHatecnt() {
			return hatecnt;
		}

		public void setHatecnt(int hatecnt) {
			this.hatecnt = hatecnt;
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

		public MultipartFile getUploadFile() {
			return uploadFile;
		}

		public void setUploadFile(MultipartFile uploadFile) {
			this.uploadFile = uploadFile;
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

		public int getCm_no() {
			return cm_no;
		}

		public void setCm_no(int cm_no) {
			this.cm_no = cm_no;
		}


		public String getCm_writer() {
			return cm_writer;
		}

		public void setCm_writer(String cm_writer) {
			this.cm_writer = cm_writer;
		}

		public String getCm_title() {
			return cm_title;
		}

		public void setCm_title(String cm_title) {
			this.cm_title = cm_title;
		}

		public String getCm_content() {
			return cm_content;
		}

		public void setCm_content(String cm_content) {
			this.cm_content = cm_content;
		}

		public String getCm_date() {
			return cm_date;
		}

		public void setCm_date(String cm_date) {
			this.cm_date = cm_date;
		}

		public int getCm_view() {
			return cm_view;
		}

		public void setCm_view(int cm_view) {
			this.cm_view = cm_view;
		}

		public String getCm_img() {
			return cm_img;
		}

		public void setCm_img(String cm_img) {
			this.cm_img = cm_img;
		}

		@Override
		public String toString() {
			return "Community_noriterVO [cm_no=" + cm_no + ", cm_writer=" + cm_writer + ", cm_title=" + cm_title + ", cm_content=" + cm_content + ", cm_date=" + cm_date + ", cm_view=" + cm_view
					+ ", cot_cnt=" + cot_cnt + ", likecnt=" + likecnt + ", hatecnt=" + hatecnt + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", uploadFile="
					+ uploadFile + ", cm_img=" + cm_img + ", start=" + start + ", listcnt=" + listcnt + "]";
		}


	}


