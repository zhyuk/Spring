package com.spring.mom.svc.impl;

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
    public UserVO kakaoLogin(String code) {
        // 1. 카카오 액세스 토큰을 받아옵니다.
        String accessToken = KakaoOAuth.getAccessToken(code);
        System.out.println("접근토큰: " + accessToken);
        if (accessToken == null) {
            return null;  // 토큰이 없으면 로그인 실패
        }

        // 2. 액세스 토큰을 사용하여 카카오 사용자 정보를 조회합니다.
        UserVO user = KakaoOAuth.getUserInfo(accessToken);
        System.out.println("유저정보: " + user);
        if (user == null) {
            return null;  // 사용자 정보를 얻지 못하면 로그인 실패
        }

        // 3. DB에서 사용자가 이미 존재하는지 확인하고, 없으면 신규 사용자로 등록합니다.
        UserVO existingUser = kakaoUserDAO.getUserById(user.getU_id());
        System.out.println("사용자 정보: " + existingUser);
        if (existingUser == null) {
            kakaoUserDAO.insertUser(user);  // 신규 사용자라면 DB에 저장
        }

        return user;  // 로그인에 성공한 사용자 정보를 반환
    }
}
