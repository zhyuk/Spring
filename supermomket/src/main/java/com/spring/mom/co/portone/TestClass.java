package com.spring.mom.co.portone;

import java.util.Calendar;
import java.util.Date;

public class TestClass {
	public static void main(String[] args) {
		//시간값 long데이터 만들기
		Calendar c = Calendar.getInstance();
		long currTime = c.getTimeInMillis();
		long expired =  currTime + (1000*60*4);
		System.out.println("현재시각: " + new Date(currTime).toLocaleString());
		System.out.println("만료시각: " + new Date(expired).toLocaleString());
	}
}
