package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.mom.svc.IndexService;
import com.spring.mom.vo.Community_vsVO;

@Controller
public class AdminController {

	@Autowired
	private IndexService svc;

	@GetMapping("/admin.do")
	public String adminLogin(HttpSession session) {
//		System.out.println("admin 로그인페이지 이동");
		session.setAttribute("adminId", "admin");
		return "admin/login";
	}

	@GetMapping("/admin_index.do")
	public String adminIndex(Community_vsVO vo, HttpSession session, Model model) {
//		System.out.println("admin 로그인완료");

		model.addAttribute("boardList" , svc.getCommunityList(vo));

		return "admin/index";
	}

	@GetMapping("/admin_logout.do")
	public String adminLogout(HttpSession session) {
//		System.out.println("admin 로그아웃");
		session.invalidate();
		return "redirect:/";
	}
}
