package com.spring.mom.svc.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.KakaoUserDAO;
import com.spring.mom.svc.KakaoUserService;
import com.spring.mom.util.KakaoOAuth;
import com.spring.mom.vo.UserVO;

@Service
public class KakaoUserServiceImpl implements KakaoUserService {

    @Autowired
    private KakaoUserDAO kakaoUserDAO;

    @Override
    public UserVO kakaoLogin(String code, HttpSession session) {
        String accessToken = KakaoOAuth.getAccessToken(code);
        if (accessToken == null) {
            return null;  
        }

        session.setAttribute("accessToken", accessToken);
        UserVO user = KakaoOAuth.getUserInfo(accessToken);
        if (user == null) {
            return null; 
        }

        UserVO existingUser = kakaoUserDAO.getUserById(user.getU_sid());
        if (existingUser == null) {
            kakaoUserDAO.insertUser(user); 
        }

        return user;  
    }

}
