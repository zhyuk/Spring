package com.spring.controller;

import java.security.SecureRandom;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mom.svc.KakaoUserService;
import com.spring.mom.svc.UserService;
import com.spring.mom.svc.impl.PhoneService;
import com.spring.mom.vo.UserVO;


@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
    private KakaoUserService kakaoUserService;

	@Autowired
	private PhoneService testService;
	
	@GetMapping(value = "/login.do")
	public String loginView(UserVO vo) {
		return "login/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {
        boolean isAuthenticated = userService.authenticateUser(vo.getU_id(), vo.getU_pw());
        if (isAuthenticated) {
            UserVO user = userService.getUser(vo); 
            session.setAttribute("userId", user.getU_id());
            session.setAttribute("userName", user.getU_name());
            session.setAttribute("userNickname", user.getU_nickname());
            session.setAttribute("userRole", user.getU_role());
            return "redirect:/";
        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login/login";  
        }
    }
	
	@GetMapping("kakaoLogin.do") 
	public String klogin(UserVO vo, String code) {
		System.out.println("code: "+code);
		/* userService.joinUser(vo); */
		return "login/kakaoLogin";
	}
	
	@GetMapping("/login/kakaoLogin")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model) {
		System.out.println("code: " + code);
		try {
            UserVO user = kakaoUserService.kakaoLogin(code, session);
            if (user != null) {
                session.setAttribute("userId", user.getU_id());
                session.setAttribute("userName", user.getU_name());
                session.setAttribute("userNickname", user.getU_nickname());
                session.setAttribute("userRole", user.getU_role());
                return "redirect:/";  // 로그인 후 홈으로 리디렉션
            } else {
                model.addAttribute("error", "로그인 실패");
                return "login/login";  // 로그인 실패 시 로그인 페이지로 돌아가기
            }
        } catch (Exception e) {
        	e.printStackTrace();
            model.addAttribute("error", "로그인 처리 중 오류가 발생했습니다.");
            return "redirect:/";
        }
    }
	
//	@GetMapping("kakaoLogin.do") //a
//	public String klogin(UserVO vo, String code) {
//		System.out.println("code: "+code);
//		/* userService.joinUser(vo); */
//		return "login/kakaoLogin";
//	}
	
//	@GetMapping("/login/kakaoLogin") //a
//	public String kakaoLoginTest() {
//		System.out.println("넘어와짐.");
//		return "redirect:index.jsp";
//	}
	
//	@RequestMapping("kakaoToken.do") //b
//	public String klogin(UserVO vo ,@RequestBody TestVO tvo) {
//		System.out.println("tvo: "+tvo);
//		
//		/* userService.joinUser(vo); */
//		return "login/kakaoLogin";
//	}
	
//	@RequestMapping("/kakaoLogin.do") //b
//	public String klogin(UserVO vo) {
//		/* userService.joinUser(vo); */
//		return "login/kakaoLogin";
//	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
	    // 세션에서 카카오 액세스 토큰을 가져옴
	    String accessToken = (String) session.getAttribute("accessToken");
	    
	    if (accessToken != null) {
	        // 카카오 로그아웃 URL 생성
	        String logoutUrl = "https://accounts.kakao.com/logout?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Flogout%2Fcallback%3Fthrough_account%3Dtrue%26logout_redirect_uri%3Dhttp%253A%252F%252Flocalhost%253A8090%252Flogin%252FkakaoLogout%26client_id%3Dc51dc8cbf39989606e8b1ae468eaee37";
	        
	        // 액세스 토큰이 있을 경우, 로그아웃 URL로 리디렉션
	        return "redirect:" + logoutUrl;
	    }
	    
	    // 액세스 토큰이 없으면 일반 로그아웃 처리
	    session.invalidate();
	    return "login/login";  // 로그아웃 후 로그인 페이지로 이동
	}

	@RequestMapping("/login/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
	    // 카카오 로그아웃 후 리디렉션된 URL
	    // 로그아웃 후 세션 무효화
	    session.invalidate();
	    
	    // 로그아웃 완료 후 로그인 페이지로 이동
	    return "redirect:/login.do";  // 또는 홈 페이지로 리디렉션할 수 있음
	}

	
//	@RequestMapping("/choiceSignup.do")
//	public String signup(UserVO vo) {
//		/* userService.joinUser(vo); */
//		return "login/choiceSignup";
//	}
	
	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findid(UserVO vo, Model model) {
		return "login/findId";
	}
	
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(UserVO vo, Model model) {
	    // 이름과 전화번호를 로그로 출력하여 제대로 넘어왔는지 확인
	    System.out.println("이름: " + vo.getU_name());
	    System.out.println("전화번호: " + vo.getU_pno());

	    // UserService에서 아이디 찾기 처리
	    List<UserVO> userList = userService.findUserId(vo);  // 여러 개의 UserVO 반환

	    if (userList != null && !userList.isEmpty()) {
	        model.addAttribute("userList", userList);  // 여러 개의 사용자 정보 전달
	        return "login/findIdResult";  // 여러 개의 사용자 정보를 출력할 페이지로 이동
	    } else {
	        model.addAttribute("error", "일치하는 정보가 없습니다.");
	        return "login/findIdResult"; // 에러 메시지와 함께 아이디 찾기 페이지로 돌아감
	    }
	}
	
	@RequestMapping(value = "/findPw.do", method = RequestMethod.GET)
	public String findpw(UserVO vo, Model model) {
		return "login/findPw";
	}
	
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public String findPwResult(UserVO vo, Model model) {
	    // 사용자 정보 확인 (이름, 아이디, 전화번호)
	    System.out.println("이름: " + vo.getU_name());
	    System.out.println("아이디: " + vo.getU_id());
	    System.out.println("전화번호: " + vo.getU_pno());

	    // 사용자 정보가 맞는지 확인
	    List<UserVO> userList = userService.findUserByNameAndPhone(vo);

	    if (userList != null && !userList.isEmpty()) {
	        if (userList.size() == 1) {
	            // 결과가 1명일 경우 비밀번호 변경
	            UserVO user = userList.get(0);
	            String tempPassword = generateTempPassword();
	            String hashedTempPassword = BCrypt.hashpw(tempPassword, BCrypt.gensalt());
	            user.setU_pw(hashedTempPassword);
	            userService.updatePassword(user);

	            model.addAttribute("tempPassword", tempPassword);
	            return "login/findPwResult";  // 임시 비밀번호 발급 완료 페이지로 이동
	        } else {
	            // 결과가 여러 명이라면 바로 비밀번호 재설정 페이지로 넘어가도록 수정
	            model.addAttribute("error", "일치하는 사용자 정보가 여러 명 있습니다.");
	            return "login/findPwResult"; // 에러 메시지와 함께 결과 페이지로 이동
	        }
	    } else {
	        model.addAttribute("error", "일치하는 정보가 없습니다.");
	        return "login/findPwResult"; // 에러 메시지와 함께 결과 페이지로 이동
	    }
	}

	// 임시 비밀번호 생성 메소드
	/*
	private String generateTempPassword() {
	    int randomNumber = (int) (Math.random() * 1000000);
	    return String.format("%06d", randomNumber);  // 6자리 숫자
	}*/
	
	public String generateTempPassword() {
	    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; // 사용할 문자 집합
	    SecureRandom random = new SecureRandom(); // 보안적인 난수 생성기
	    StringBuilder tempPassword = new StringBuilder();

	    for (int i = 0; i < 8; i++) { // 8자리 비밀번호 생성
	        int randomIndex = random.nextInt(chars.length()); // 문자 집합에서 랜덤 인덱스 선택
	        tempPassword.append(chars.charAt(randomIndex)); // 선택된 문자 추가
	    }

	    return tempPassword.toString(); // 생성된 임시 비밀번호 반환
	}

	@RequestMapping(value = "/generalSignup.do", method = RequestMethod.GET)
	public String general(UserVO vo, Model model) {
		return "login/generalSignup";
	}
	
	@RequestMapping(value = "/generalSignup.do",method = RequestMethod.POST)
	public String join(UserVO vo, Model model) {
	        userService.joinUser(vo);
	        model.addAttribute("success", "회원가입이 완료되었습니다.");
	        return "redirect:login.do"; 
	}
	
	@RequestMapping(value = "/checkUserId.do", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String checkUserId(@RequestParam("u_id") String u_id) {
	    int count = userService.checkUserId(u_id);
	    if (count > 0) {
	        return "이미 가입된 아이디입니다.";
	    } else {
	        return "사용할 수 있는 아이디입니다.";
	    }
	}
	
	@RequestMapping(value = "/checkUserNn.do", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String checkUserNn(@RequestParam("u_nickname") String u_nickname) {
	    int count = userService.checkUserNn(u_nickname);
	    if (count > 0) {
	        return "이미 가입된 닉네임입니다.";
	    } else {
	        return "사용할 수 있는 닉네임입니다.";
	    }
	}
	
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.GET) 
	@ResponseBody 
	public String sendSMS(@RequestParam("u_pno") String userPhoneNumber) { 
		System.out.println("휴대폰으로 보낼 인증번호 난수 생성"); 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		//난수 생성 
		testService.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); 
	}


}