package com.spring.mom.co.my.order.vo;

public class ResponseVO3 {
	
	private String name;
	private String value;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "ResponseVO3 [name=" + name + ", value=" + value + "]";
	}
	
	
		
}
