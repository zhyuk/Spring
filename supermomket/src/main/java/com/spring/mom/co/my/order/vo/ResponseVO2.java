package com.spring.mom.co.my.order.vo;

import java.util.ArrayList;

public class ResponseVO2 {
	private int code;
	private String message;
	private ArrayList<Object> response;
	
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
	public ArrayList<Object> getResponse() {
		return response;
	}
	public void setResponse(Object response) {
		this.response = (ArrayList<Object>) response;
	}
	
	@Override
	public String toString() {
		return "ResponseVO2 [code=" + code + ", message=" + message + ", response=" + response + "]";
	}
	
}
