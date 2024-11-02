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

import com.spring.mom.vo.UserService;
import com.spring.mom.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping("/generalSignup.do")
	public String join(UserVO vo) {
		userService.joinUser(vo);
		return "redirect:login.jsp?result=1";
	}

	@GetMapping(value = "/login.do")
	public String loginView(UserVO vo) {
		return "login.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {
		System.out.println(vo);
		vo = userService.getUser(vo);
		if (vo != null) {
            System.out.println("성공");
            session.setAttribute("userId", vo.getU_id()); 
            return "redirect:index.jsp"; 
        } else {
            System.out.println("실패");
            model.addAttribute("loginError", "로그인 실패하였습니다."); // 오류 메시지 설정
            return "../login";
        }
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
	
	@RequestMapping("/logout.do")
	public String logout(UserVO vo, HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}

}
