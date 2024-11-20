package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mom.svc.AdminLoginService;
import com.spring.mom.svc.IndexService;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.UserVO;

@Controller
public class AdminController {

	@Autowired
	private IndexService svc;
	
	@Autowired
	private AdminLoginService adminLoginService;


	@GetMapping(value = "/admin_login.do")
	public String adminlogin(UserVO vo) {
		return "login/admin_login";
	}

	@RequestMapping(value = "/admin_login.do", method = RequestMethod.POST)
	public String loginadmin(UserVO vo, HttpSession session, Model model) {
        boolean isAuthenticated = adminLoginService.authenticateUser(vo.getU_id(), vo.getU_pw());
        if (isAuthenticated) {
            UserVO user = adminLoginService.getUser(vo); 
            session.setAttribute("adminId", user.getU_id());
            session.setAttribute("adminName", user.getU_name());
            session.setAttribute("adminNickname", user.getU_nickname());
            session.setAttribute("adminRole", user.getU_role());
            return "redirect:/admin_index.do";
        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login/admin_login";  
        }
    }

	@GetMapping("/admin_index.do")
	public String adminIndex(Community_vsVO CommunityVo, ProductVO productVO, UserVO userVO,HttpSession session, Model model) {

		model.addAttribute("boardList" , svc.getCommunityList(CommunityVo));
		model.addAttribute("productList", svc.getProductListAdmin(productVO));
		model.addAttribute("userList", svc.getUserListAdmin(userVO));
		return "admin/index";
	}
	
	@GetMapping("/admin_logout.do")
	public String adminLogout(HttpSession session) {
		session.invalidate();
	    return "login/admin_login";
	}
}
