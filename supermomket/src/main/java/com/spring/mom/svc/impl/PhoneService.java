package com.spring.mom.svc.impl;

import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class PhoneService {
	private String sendPhoneNumber = "01057980698";
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSEO30R9XKZQFUW";
		String api_secret = "GP4YTSI1DNSC7IAOAGINQ45NCZO7GYS9";

		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(api_key, api_secret,
				"https://api.coolsms.co.kr");
		Message message = new Message();	
		message.setFrom(sendPhoneNumber);	
		message.setTo(userPhoneNumber);
		message.setText("[supermomket] 인증번호는" + "[" + randomNumber + "]" + "입니다.");

		try {
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {

		} catch (Exception exception) {

		}

	}

}
