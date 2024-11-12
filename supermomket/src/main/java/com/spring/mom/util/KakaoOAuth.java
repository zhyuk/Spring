package com.spring.mom.util;

import com.spring.mom.svc.impl.SaltEncrypt;
import com.spring.mom.vo.UserVO;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import org.json.JSONObject;

public class KakaoOAuth {

    private static final String REST_API_KEY = "c51dc8cbf39989606e8b1ae468eaee37";  // 카카오 REST API Key
    private static final String REDIRECT_URI = "http://localhost:8090/login/kakaoLogin";  // 카카오 로그인 리디렉션 URI

    // 카카오 인증 코드로 액세스 토큰을 받아오는 메소드
    public static String getAccessToken(String code) {
        String accessToken = null;
        String url = "https://kauth.kakao.com/oauth/token";
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        
        String body = "grant_type=authorization_code&client_id=" + REST_API_KEY 
                    + "&redirect_uri=" + REDIRECT_URI + "&code=" + code;
        
        HttpEntity<String> entity = new HttpEntity<>(body, headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
        
        if (response.getStatusCode() == HttpStatus.OK) {
            JSONObject jsonResponse = new JSONObject(response.getBody());
            accessToken = jsonResponse.getString("access_token");
        }
        
        return accessToken;
    }

    // 액세스 토큰으로 카카오 사용자 정보를 받아오는 메소드
    public static UserVO getUserInfo(String accessToken) {
        UserVO user = null;
        String url = "https://kapi.kakao.com/v2/user/me";
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        
        HttpEntity<String> entity = new HttpEntity<>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        System.out.println("\n\n" + response.getBody() + "\n\n");
        
        if (response.getStatusCode() == HttpStatus.OK) {
            JSONObject jsonResponse = new JSONObject(response.getBody());
            JSONObject properties = jsonResponse.getJSONObject("properties");
            JSONObject kakaoAccount = jsonResponse.getJSONObject("kakao_account");
            SaltEncrypt encrypt = new SaltEncrypt();

            user = new UserVO();
            user.setU_id(kakaoAccount.getString("email").split("@")[0]); 
            String phoneNumber = kakaoAccount.getString("phone_number");
            String lastFourDigits = phoneNumber.substring(phoneNumber.length() - 4);
            String encryptedPassword = encrypt.encrypt(lastFourDigits);
            user.setU_pw(encryptedPassword);
            user.setU_nickname(properties.getString("nickname"));
            user.setU_email(kakaoAccount.getString("email"));
            user.setU_name(properties.getString("nickname")); 
            user.setU_pno(kakaoAccount.getString("phone_number"));
            user.setU_address("직접 입력해주세요.");
        }

        return user;
    }
}
