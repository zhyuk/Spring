package com.spring.mom.svc;

import javax.servlet.http.HttpSession;

import com.spring.mom.vo.UserVO;

public interface KakaoUserService {
	UserVO kakaoLogin(String code, HttpSession session);
}
