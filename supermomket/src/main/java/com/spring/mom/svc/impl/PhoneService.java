package com.spring.mom.svc.impl;

import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class PhoneService {
	//쿨sms에서 가입한 자신의 전화번호 입력
	private String sendPhoneNumber = "01057980698";
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		System.out.println("실제 전송로직: " + userPhoneNumber);

		// coolsms의 개발/연동 메뉴에 있는 API Key관리 메뉴에서 API Key, API Secret값 넣기
		String api_key = "NCSEO30R9XKZQFUW";
		String api_secret = "GP4YTSI1DNSC7IAOAGINQ45NCZO7GYS9";

		//로직참고: https://developers.coolsms.co.kr/sdk-list/Java/send-message 
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(api_key, api_secret,
				"https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		
		//"계정에서 등록한 발신번호 입력"
		message.setFrom(sendPhoneNumber);
		//"수신번호 입력"
		message.setTo(userPhoneNumber);
		//"SMS는 한글 45자, 영자 90자까지 입력할 수 있습니다." 90자이상이면 LMS로 자동변환됨.
		message.setText("[supermomket] 인증번호는" + "[" + randomNumber + "]" + "입니다.");

		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}

	}

}
