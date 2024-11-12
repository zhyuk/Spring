package com.spring.mom.vo;

public class OrderVO {
	
		/* 주문테이블 */
		private	int c_no;
		private String u_id;
		private String o_receiver_contact;
		private int o_total_price;
		private int o_total_cnt;
		private String o_cancel_yn;
		private	String o_input_date;
		private String o_update_date;
		private String o_status;
		private String o_delete_yn;
		private String o_pay_type;
		private	String o_address;
		private String o_receiver;
		private String paid_at;
		
		/* 주문상세테이블 */
		private int p_no;
		private int p_price;
		private int p_count;
		private String p_option;
		private String Merchant_uid;
		private String Imp_uid;
		
		/* 상품테이블 */
	    private String p_name;
	    private String p_img;
	    
	    
	    
	    
	    public int getC_no() {
	    	return c_no;
	    }
	    public void setC_no(int c_no) {
	    	this.c_no = c_no;
	    }
	    
		public String getPaid_at() {
			return paid_at;
		}
		public void setPaid_at(String paid_at) {
			this.paid_at = paid_at;
		}
		public String getMerchant_uid() {
			return Merchant_uid;
		}
		public void setMerchant_uid(String merchant_uid) {
			Merchant_uid = merchant_uid;
		}
		public String getImp_uid() {
			return Imp_uid;
		}
		public void setImp_uid(String imp_uid) {
			Imp_uid = imp_uid;
		}
		
		public String getU_id() {
			return u_id;
		}
		public void setU_id(String u_id) {
			this.u_id = u_id;
		}
		public String getO_receiver_contact() {
			return o_receiver_contact;
		}
		public void setO_receiver_contact(String o_receiver_contact) {
			this.o_receiver_contact = o_receiver_contact;
		}
		public int getO_total_price() {
			return o_total_price;
		}
		public void setO_total_price(int o_total_price) {
			this.o_total_price = o_total_price;
		}
		public int getO_total_cnt() {
			return o_total_cnt;
		}
		public void setO_total_cnt(int o_total_cnt) {
			this.o_total_cnt = o_total_cnt;
		}
		public String getO_cancel_yn() {
			return o_cancel_yn;
		}
		public void setO_cancel_yn(String o_cancel_yn) {
			this.o_cancel_yn = o_cancel_yn;
		}
		public String getO_input_date() {
			return o_input_date;
		}
		public void setO_input_date(String o_input_date) {
			this.o_input_date = o_input_date;
		}
		public String getO_update_date() {
			return o_update_date;
		}
		public void setO_update_date(String o_update_date) {
			this.o_update_date = o_update_date;
		}
		public String getO_status() {
			return o_status;
		}
		public void setO_status(String o_status) {
			this.o_status = o_status;
		}
		public String getO_delete_yn() {
			return o_delete_yn;
		}
		public void setO_delete_yn(String o_delete_yn) {
			this.o_delete_yn = o_delete_yn;
		}
		public String getO_pay_type() {
			return o_pay_type;
		}
		public void setO_pay_type(String o_pay_type) {
			this.o_pay_type = o_pay_type;
		}
		public String getO_address() {
			return o_address;
		}
		public void setO_address(String o_address) {
			this.o_address = o_address;
		}
		public String getO_receiver() {
			return o_receiver;
		}
		public void setO_receiver(String o_receiver) {
			this.o_receiver = o_receiver;
		}
		public int getP_no() {
			return p_no;
		}
		public void setP_no(int p_no) {
			this.p_no = p_no;
		}
		public int getP_price() {
			return p_price;
		}
		public void setP_price(int p_price) {
			this.p_price = p_price;
		}
		public int getP_count() {
			return p_count;
		}
		public void setP_count(int p_count) {
			this.p_count = p_count;
		}
		public String getP_option() {
			return p_option;
		}
		public void setP_option(String p_option) {
			this.p_option = p_option;
		}
		public String getP_name() {
			return p_name;
		}
		public void setP_name(String p_name) {
			this.p_name = p_name;
		}
		public String getP_img() {
			return p_img;
		}
		public void setP_img(String p_img) {
			this.p_img = p_img;
		}
		
		@Override
		public String toString() {
			return "OrderVO [c_no=" + c_no + ", u_id=" + u_id + ", o_receiver_contact=" + o_receiver_contact
					+ ", o_total_price=" + o_total_price + ", o_total_cnt=" + o_total_cnt + ", o_cancel_yn="
					+ o_cancel_yn + ", o_input_date=" + o_input_date + ", o_update_date=" + o_update_date
					+ ", o_status=" + o_status + ", o_delete_yn=" + o_delete_yn + ", o_pay_type=" + o_pay_type
					+ ", o_address=" + o_address + ", o_receiver=" + o_receiver + ", paid_at=" + paid_at + ", p_no="
					+ p_no + ", p_price=" + p_price + ", p_count=" + p_count + ", p_option=" + p_option
					+ ", Merchant_uid=" + Merchant_uid + ", Imp_uid=" + Imp_uid + ", p_name=" + p_name + ", p_img="
					+ p_img + "]";
		}
	    
	    
		
		
}
