package com.spring.mom.co.portone.vo;

//포트원 결제완료 후 응답 데이터VO
public class PortOnePayRequestVO {
	//참고: https://developers.portone.io/sdk/ko/v1-sdk/javascript-sdk/payrt?v=v1
	private boolean success; //결제 성공여부
	private String error_code; //결제 실패코드
	private String error_msg; //결제 실패메세지
	private String pay_method; //결제수단 구분코드
	private String status;  // 결제상태
	/* 결제상태 속성값 의미
		ready : 브라우저 창 이탈, 가상계좌 발급 완료 등 미결제 상태
		paid : 결제완료
		failed : 신용카드 한도 초과, 체크카드 잔액 부족, 브라우저 창 종료 또는 취소 버튼 클릭 등 결제실패 상태
	*/
	
	/*PG사 관련*/
	private String pg_provider; //PG사 구분코드
	private String pg_tid; //PG사 거래번호
	
	/*간편결제 관련*/
	private String emb_pg_provider; //간편결제 구분코드
	
	/*신용카드 승인관련*/
	private String apply_num; //신용카드 승인번호
	
	/*가상계좌 승인관련*/
	private String vbank_num; //가상계좌 입금 계좌번호
	private String vbank_name; //가상계좌 입금은행 명
	private String vbank_holder; //가상계좌 예금주
	private String vbank_date; //가상계좌 입금기한 (UNIX timestamp)
	
	
	/*상품 주문한 사람 관련 필드들*/
	private String imp_uid; //포트원 고유 결제번호(포트원에서 생성하여 보내주는 주문번호)
	private String merchant_uid; //주문번호(우리가 만들어서 보내는 주문번호)
	private int paid_amount; //결제금액
	private String name; //주문한 상품명  ***주문자명으로 잘못기재***
	private String buyer_name; //주문자명
	private String buyer_email; //주문자 Email
	private String buyer_tel; //주문자 연락처
	private String buyer_addr; //주문자 주소
	private String buyer_postcode; //주문자 우편번호
	private String custom_data; //고객사 임의 지정 데이터
	private String paid_at; //결제승인시각 (UNIX timestamp)
	private String receipt_url; //거래 매출전표 URL
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getError_code() {
		return error_code;
	}
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public String getError_msg() {
		return error_msg;
	}
	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPg_provider() {
		return pg_provider;
	}
	public void setPg_provider(String pg_provider) {
		this.pg_provider = pg_provider;
	}
	public String getPg_tid() {
		return pg_tid;
	}
	public void setPg_tid(String pg_tid) {
		this.pg_tid = pg_tid;
	}
	public String getEmb_pg_provider() {
		return emb_pg_provider;
	}
	public void setEmb_pg_provider(String emb_pg_provider) {
		this.emb_pg_provider = emb_pg_provider;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public String getVbank_num() {
		return vbank_num;
	}
	public void setVbank_num(String vbank_num) {
		this.vbank_num = vbank_num;
	}
	public String getVbank_name() {
		return vbank_name;
	}
	public void setVbank_name(String vbank_name) {
		this.vbank_name = vbank_name;
	}
	public String getVbank_holder() {
		return vbank_holder;
	}
	public void setVbank_holder(String vbank_holder) {
		this.vbank_holder = vbank_holder;
	}
	public String getVbank_date() {
		return vbank_date;
	}
	public void setVbank_date(String vbank_date) {
		this.vbank_date = vbank_date;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	public String getBuyer_addr() {
		return buyer_addr;
	}
	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	public String getBuyer_postcode() {
		return buyer_postcode;
	}
	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}
	public String getCustom_data() {
		return custom_data;
	}
	public void setCustom_data(String custom_data) {
		this.custom_data = custom_data;
	}
	public String getPaid_at() {
		return paid_at;
	}
	public void setPaid_at(String paid_at) {
		this.paid_at = paid_at;
	}
	public String getReceipt_url() {
		return receipt_url;
	}
	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}
	
	@Override
	public String toString() {
		return "PortOnePayRequestVO [success=" + success + ", error_code=" + error_code + ", error_msg=" + error_msg
				+ ", pay_method=" + pay_method + ", status=" + status + ", pg_provider=" + pg_provider + ", pg_tid="
				+ pg_tid + ", emb_pg_provider=" + emb_pg_provider + ", apply_num=" + apply_num + ", vbank_num="
				+ vbank_num + ", vbank_name=" + vbank_name + ", vbank_holder=" + vbank_holder + ", vbank_date="
				+ vbank_date + ", imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", paid_amount="
				+ paid_amount + ", name=" + name + ", buyer_name=" + buyer_name + ", buyer_email=" + buyer_email
				+ ", buyer_tel=" + buyer_tel + ", buyer_addr=" + buyer_addr + ", buyer_postcode=" + buyer_postcode
				+ ", custom_data=" + custom_data + ", paid_at=" + paid_at + ", receipt_url=" + receipt_url + "]";
	}
	
}
