package com.spring.controller;

import javax.servlet.http.HttpSession;

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
import com.spring.mom.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
    private KakaoUserService kakaoUserService;

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
            return "redirect:index.jsp";
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
            UserVO user = kakaoUserService.kakaoLogin(code);
            if (user != null) {
                session.setAttribute("userId", user.getU_id());
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
        session.invalidate();
        return "login/login";
//        return "redirect:index.jsp";
    }
	
//	@RequestMapping("/choiceSignup.do")
//	public String signup(UserVO vo) {
//		/* userService.joinUser(vo); */
//		return "login/choiceSignup";
//	}
	
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

}
