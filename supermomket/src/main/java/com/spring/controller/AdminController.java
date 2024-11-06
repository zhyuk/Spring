package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin.do")
	public String adminLogin() {
//		System.out.println("admin 로그인페이지 이동");
		return "admin/login";
	}

	@GetMapping("/admin_index.do")
	public String adminIndex() {
//		System.out.println("admin 로그인완료");
		return "admin/index";
	}
	
	@GetMapping("/admin_logout.do")
	public String adminLogout() {
//		System.out.println("admin 로그아웃");
		return "redirect:index.jsp";
	}
}
