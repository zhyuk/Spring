package com.spring.mom.svc;

import com.spring.mom.vo.UserVO;

public interface KakaoUserService {
    UserVO kakaoLogin(String code);
}
