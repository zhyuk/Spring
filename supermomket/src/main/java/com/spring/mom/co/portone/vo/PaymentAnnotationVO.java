package com.spring.mom.co.portone.vo;

import java.util.ArrayList;
import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;


public class PaymentAnnotationVO {
	private String imp_uid;  //포트원 거래고유번호
	private String merchant_uid;  //string고객사 주문번호
	private String pay_method;  //string결제수단 구분코드
	
	private String channel;  //string결제환경 구분코드
	private String pg_provider;  //stringPG사 구분코드
	private String emb_pg_provider;  //string허브형결제 PG사 구분코드
	private String pg_tid;  //stringPG사 거래번호
	private String pg_id;  //stringPG사 상점아이디
	
	private boolean escrow;  //boolean에스크로결제 여부
	private String apply_num;  //string승인번호
	private String bank_code;  //string은행 표준코드
	private String bank_name;  //string은행명
	
	private String card_code;  //string카드사 코드번호
	private String card_name;  //string카드사명
	private String card_issuer_code;  //string카드 발급사 코드
	private String card_issuer_name;  //string카드 발급사명
	private String card_publisher_code;  //string카드 발행사 코드
	private String card_publisher_name;  //string카드 발행사명
	private Integer card_quota;  //integer할부개월 수
	private String card_number;  //string카드번호 : 결제에 사용된 마스킹된 카드번호
	private Integer card_type;  //integer카드 구분코드 결제건에 사용된 카드 구분코드

	private String vbank_code;  //string가상계좌 은행 표준코드
	private String vbank_name;  //string가상계좌 은행명
	private String vbank_num;  //string가상계좌 계좌번호
	private String vbank_holder;  //string가상계좌 예금주
	
	private Integer vbank_date;  //integer가상계좌 입금기한
	private Integer vbank_issued_at;  //integer가상계좌 생성시각
	
	private String name;  //string제품명
	private int amount;  //number결제금액
	private int cancel_amount;  //number취소금액
	private String currency;  //string결제통화 구분코드
	private String buyer_name;  //string주문자명
	private String buyer_email;  //string주문자 Email주소
	private String buyer_tel;  //string주문자 전화번호
	private String buyer_addr;  //string주문자 주소
	private String buyer_postcode;  //string주문자 우편번호
	
	private String custom_data;  //string추가정보
	private String user_agent;  //string단말기의 UserAgent 문자열
	private String status;  //string결제상태
	
	private Integer started_at;  //integer요청 시각
	private Integer paid_at;  //integer결제 시각 결제건의 결제완료 시각 UNIX timestamp
	private Integer failed_at;  //integer실패시각 결제건의 결제실패시각 UNIX timestamp
	private Integer cancelled_at;  //integer취소시각 결제건의 결제취소시각 UNIX timestamp

	private String fail_reason;  //string결제실패 사유 결제건의 결제실패 사유
	private String cancel_reason;  //string결제취소 사유 결제건의 결제취소 사유
	private String receipt_url;  //string매출전표 URL
	
	
//	private Object cancel_history;  //PaymentCancelAnnotation[]취소 내역
	private PaymentCancelAnnotationVO[] cancel_history;  //PaymentCancelAnnotation[]취소 내역
	private String[] cancel_receipt_urls;  //string[]
	
//	(Deprecated 예정  //cancel_history 사용 권장) 취소/부분취소 시 생성되는 취소 매출전표 확인 URL. 부분취소 횟수만큼 매출전표가 별도로 생성됨

	private boolean cash_receipt_issued;  //boolean현금영수증 발급 여부
	private String customer_uid;  //string구매자의 결제 수단 식별 고유번호
	private String customer_uid_usage;  //string구매자의 결제 수단 식별 고유번호 사용 구분코드
	private Object promotion ;  //object프로모션 정보
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
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getPg_provider() {
		return pg_provider;
	}
	public void setPg_provider(String pg_provider) {
		this.pg_provider = pg_provider;
	}
	public String getEmb_pg_provider() {
		return emb_pg_provider;
	}
	public void setEmb_pg_provider(String emb_pg_provider) {
		this.emb_pg_provider = emb_pg_provider;
	}
	public String getPg_tid() {
		return pg_tid;
	}
	public void setPg_tid(String pg_tid) {
		this.pg_tid = pg_tid;
	}
	public String getPg_id() {
		return pg_id;
	}
	public void setPg_id(String pg_id) {
		this.pg_id = pg_id;
	}
	public boolean isEscrow() {
		return escrow;
	}
	public void setEscrow(boolean escrow) {
		this.escrow = escrow;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getCard_code() {
		return card_code;
	}
	public void setCard_code(String card_code) {
		this.card_code = card_code;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_issuer_code() {
		return card_issuer_code;
	}
	public void setCard_issuer_code(String card_issuer_code) {
		this.card_issuer_code = card_issuer_code;
	}
	public String getCard_issuer_name() {
		return card_issuer_name;
	}
	public void setCard_issuer_name(String card_issuer_name) {
		this.card_issuer_name = card_issuer_name;
	}
	public String getCard_publisher_code() {
		return card_publisher_code;
	}
	public void setCard_publisher_code(String card_publisher_code) {
		this.card_publisher_code = card_publisher_code;
	}
	public String getCard_publisher_name() {
		return card_publisher_name;
	}
	public void setCard_publisher_name(String card_publisher_name) {
		this.card_publisher_name = card_publisher_name;
	}
	public Integer getCard_quota() {
		return card_quota;
	}
	public void setCard_quota(Integer card_quota) {
		this.card_quota = card_quota;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	public Integer getCard_type() {
		return card_type;
	}
	public void setCard_type(Integer card_type) {
		this.card_type = card_type;
	}
	public String getVbank_code() {
		return vbank_code;
	}
	public void setVbank_code(String vbank_code) {
		this.vbank_code = vbank_code;
	}
	public String getVbank_name() {
		return vbank_name;
	}
	public void setVbank_name(String vbank_name) {
		this.vbank_name = vbank_name;
	}
	public String getVbank_num() {
		return vbank_num;
	}
	public void setVbank_num(String vbank_num) {
		this.vbank_num = vbank_num;
	}
	public String getVbank_holder() {
		return vbank_holder;
	}
	public void setVbank_holder(String vbank_holder) {
		this.vbank_holder = vbank_holder;
	}
	public Integer getVbank_date() {
		return vbank_date;
	}
	public void setVbank_date(Integer vbank_date) {
		this.vbank_date = vbank_date;
	}
	public Integer getVbank_issued_at() {
		return vbank_issued_at;
	}
	public void setVbank_issued_at(Integer vbank_issued_at) {
		this.vbank_issued_at = vbank_issued_at;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCancel_amount() {
		return cancel_amount;
	}
	public void setCancel_amount(int cancel_amount) {
		this.cancel_amount = cancel_amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
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
	public String getUser_agent() {
		return user_agent;
	}
	public void setUser_agent(String user_agent) {
		this.user_agent = user_agent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getStarted_at() {
		return started_at;
	}
	public void setStarted_at(Integer started_at) {
		this.started_at = started_at;
	}
	public Integer getPaid_at() {
		return paid_at;
	}
	public void setPaid_at(Integer paid_at) {
		this.paid_at = paid_at;
	}
	public Integer getFailed_at() {
		return failed_at;
	}
	public void setFailed_at(Integer failed_at) {
		this.failed_at = failed_at;
	}
	public Integer getCancelled_at() {
		return cancelled_at;
	}
	public void setCancelled_at(Integer cancelled_at) {
		this.cancelled_at = cancelled_at;
	}
	public String getFail_reason() {
		return fail_reason;
	}
	public void setFail_reason(String fail_reason) {
		this.fail_reason = fail_reason;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	public String getReceipt_url() {
		return receipt_url;
	}
	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}
	
	
	public PaymentCancelAnnotationVO[] getCancel_history() {
		return cancel_history;
	}
	public void setCancel_history(Object cancel_history) {
		ArrayList<Object> ls = (ArrayList<Object>) cancel_history;
		int len = ls.size();
		this.cancel_history = new PaymentCancelAnnotationVO[len];
		for(int i=0; i< len ; i++) {
			ObjectMapper mapper = new ObjectMapper();
			PaymentCancelAnnotationVO vo = mapper.convertValue(ls.get(i), PaymentCancelAnnotationVO.class);
			System.out.println("vo: "+vo);
			
			this.cancel_history[i] = vo;
		}
	}
	
//	public Object getCancel_history() {
//		return cancel_history;
//	}
//	public void setCancel_history(Object cancel_history) {
//		this.cancel_history = cancel_history;
//	}
	
	
	
	public String[] getCancel_receipt_urls() {
		return cancel_receipt_urls;
	}
	public void setCancel_receipt_urls(String[] cancel_receipt_urls) {
		this.cancel_receipt_urls = cancel_receipt_urls;
	}
	public boolean isCash_receipt_issued() {
		return cash_receipt_issued;
	}
	public void setCash_receipt_issued(boolean cash_receipt_issued) {
		this.cash_receipt_issued = cash_receipt_issued;
	}
	public String getCustomer_uid() {
		return customer_uid;
	}
	public void setCustomer_uid(String customer_uid) {
		this.customer_uid = customer_uid;
	}
	public String getCustomer_uid_usage() {
		return customer_uid_usage;
	}
	public void setCustomer_uid_usage(String customer_uid_usage) {
		this.customer_uid_usage = customer_uid_usage;
	}
	public Object getPromotion() {
		return promotion;
	}
	public void setPromotion(Object promotion) {
		this.promotion = promotion;
	}
	@Override
	public String toString() {
		return "PaymentAnnotationVO [imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", pay_method="
				+ pay_method + ", channel=" + channel + ", pg_provider=" + pg_provider + ", emb_pg_provider="
				+ emb_pg_provider + ", pg_tid=" + pg_tid + ", pg_id=" + pg_id + ", escrow=" + escrow + ", apply_num="
				+ apply_num + ", bank_code=" + bank_code + ", bank_name=" + bank_name + ", card_code=" + card_code
				+ ", card_name=" + card_name + ", card_issuer_code=" + card_issuer_code + ", card_issuer_name="
				+ card_issuer_name + ", card_publisher_code=" + card_publisher_code + ", card_publisher_name="
				+ card_publisher_name + ", card_quota=" + card_quota + ", card_number=" + card_number + ", card_type="
				+ card_type + ", vbank_code=" + vbank_code + ", vbank_name=" + vbank_name + ", vbank_num=" + vbank_num
				+ ", vbank_holder=" + vbank_holder + ", vbank_date=" + vbank_date + ", vbank_issued_at="
				+ vbank_issued_at + ", name=" + name + ", amount=" + amount + ", cancel_amount=" + cancel_amount
				+ ", currency=" + currency + ", buyer_name=" + buyer_name + ", buyer_email=" + buyer_email
				+ ", buyer_tel=" + buyer_tel + ", buyer_addr=" + buyer_addr + ", buyer_postcode=" + buyer_postcode
				+ ", custom_data=" + custom_data + ", user_agent=" + user_agent + ", status=" + status + ", started_at="
				+ started_at + ", paid_at=" + paid_at + ", failed_at=" + failed_at + ", cancelled_at=" + cancelled_at
				+ ", fail_reason=" + fail_reason + ", cancel_reason=" + cancel_reason + ", receipt_url=" + receipt_url
				+ ", cancel_history=" + Arrays.toString(cancel_history) + ", cancel_receipt_urls="
				+ Arrays.toString(cancel_receipt_urls) + ", cash_receipt_issued=" + cash_receipt_issued
				+ ", customer_uid=" + customer_uid + ", customer_uid_usage=" + customer_uid_usage + ", promotion="
				+ promotion + "]";
	}
}
