package com.spring.mom.co.my.order.vo;

import java.util.LinkedHashMap;

public class ResponseVO {
	private int code;
	private String message;
	private LinkedHashMap<String, Object> response;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public LinkedHashMap<String, Object> getResponse() {
		return response;
	}
	public void setResponse(Object response) {
		this.response = (LinkedHashMap<String, Object>) response;
	}
	
	@Override
	public String toString() {
		return "ResponseVO [code=" + code + ", message=" + message + ", response=" + response + "]";
	}
	
}
