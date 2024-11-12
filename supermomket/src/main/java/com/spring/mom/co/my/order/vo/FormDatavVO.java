package com.spring.mom.co.my.order.vo;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.spring.mom.co.portone.vo.PortOnePayRequestVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class FormDatavVO {
	private PortOnePayRequestVO pvo;
	private Object mydata;
	
	private String[] impUidArr;
	private String[] merchantUidArr;
	
	public PortOnePayRequestVO getPvo() {
		return pvo;
	}
	public void setPvo(PortOnePayRequestVO pvo) {
		this.pvo = pvo;
	}
	public Object getMydata() {
		return mydata;
	}
	public void setMydata(Object mydata) {
		this.mydata = mydata;
	}
	
	public String[] getImpUidArr() {
		return impUidArr;
	}
	public void setImpUidArr(String[] impUidArr) {
		this.impUidArr = impUidArr;
	}
	public String[] getMerchantUidArr() {
		return merchantUidArr;
	}
	public void setMerchantUidArr(String[] merchantUidArr) {
		this.merchantUidArr = merchantUidArr;
	}
	@Override
	public String toString() {
		return "FormDatavVO [pvo=" + pvo + ", mydata=" + mydata + ", impUidArr=" + Arrays.toString(impUidArr)
				+ ", merchantUidArr=" + Arrays.toString(merchantUidArr) + "]";
	}
}
