package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mom.svc.FaqService;
import com.spring.mom.vo.FaqVO;
import com.spring.mom.vo.PagingVO;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;

	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("답변", "CONTENT");
		conditionMap.put("질문", "TITLE");
		return conditionMap;
	}
	
	@RequestMapping("/searchfaq.do")
	public String searchfaq(HttpServletRequest req, @RequestParam(value="nowPage", required = false) String nowPage, 
	                        FaqVO fvo, PagingVO pv, Model model) {
	    String cntPerPage = "10"; // 한 페이지당 항목 수
	   
		if (fvo.getSearchKeyword() == null)
			fvo.setSearchKeyword(fvo.getFaq_class());

		int total = faqService.countFaqclass(fvo); 
		if (nowPage == null) {
			nowPage = "1"; 
		}
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		System.out.println("pagingVO: "+pv);
		fvo.setStart(pv.getStart());
		fvo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("searchURI", getURI(req));
	    model.addAttribute("searchCondition", fvo.getSearchCondition());
	    model.addAttribute("searchKeyword", fvo.getSearchKeyword());
	    model.addAttribute("fvo", faqService.searchfaq(fvo));
	    
		return "FAQ/faqUserList";
		
	}
	
	
	
	@RequestMapping("/getFaqAdminList.do")
	public String getFaqList(@RequestParam(value="nowPage", required = false) String nowPage,PagingVO pv, FaqVO fvo, Model model) {
		System.out.println("컨트롤러 진입");
		String cntPerPage = "10";
		if (fvo.getSearchCondition() == null) {
			System.out.println("fvo.if 컨디션:"+fvo.getSearchCondition());
			fvo.setSearchCondition("TITLE");
			
		}
		else {
			fvo.setSearchCondition(fvo.getSearchCondition());
			System.out.println("fvo.컨디션:"+fvo.getSearchCondition());
		}
		if (fvo.getSearchKeyword() == null)
			fvo.setSearchKeyword("");
		else
			fvo.setSearchKeyword(fvo.getSearchKeyword());

		int total = faqService.countFaq(fvo); 
		if (nowPage == null) {
			nowPage = "1"; 
		}
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		System.out.println("pagingVO: "+pv);
		fvo.setStart(pv.getStart());
		fvo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("fvo", faqService.getFaqList(fvo));
		model.addAttribute("searchCondition", fvo.getSearchCondition());
		model.addAttribute("searchKeyword", fvo.getSearchKeyword());
		
		return "FAQ/faqAdminList";
	}
	
	public String getURI(HttpServletRequest req) {
		return req.getRequestURI();
	}

	@RequestMapping("/getFaqUserList.do")
	public String getFaqUserList(HttpServletRequest req,@RequestParam(value="nowPage", required = false) String nowPage,PagingVO pv, FaqVO fvo, Model model) {
		model.addAttribute("searchURI", getURI(req));
		String cntPerPage = "8";
		if (fvo.getSearchCondition() == null)
			fvo.setSearchCondition("TITLE");
		else
			fvo.setSearchCondition(fvo.getSearchCondition());
		if (fvo.getSearchKeyword() == null)
			fvo.setSearchKeyword("");
		else
			fvo.setSearchKeyword(fvo.getSearchKeyword());

		int total = faqService.countFaq(fvo); 
		if (nowPage == null) {
			nowPage = "1"; 
		}
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		System.out.println("pagingVO: "+pv);
		fvo.setStart(pv.getStart());
		fvo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("fvo", faqService.getFaqList(fvo));
		model.addAttribute("searchCondition", fvo.getSearchCondition());
		model.addAttribute("searchKeyword", fvo.getSearchKeyword());
		
		return "FAQ/faqUserList";
	}

	@RequestMapping("/getFaq.do")
	public String getFaq(FaqVO fvo, Model model ,@RequestParam(value="nowPage", required = false) String nowPage) {
	
		System.out.println("컨트롤러 진입");
		model.addAttribute("fvo", faqService.getFaq(fvo));
		model.addAttribute("searchCondition", fvo.getSearchCondition());
		model.addAttribute("searchKeyword", fvo.getSearchKeyword());
		model.addAttribute("nowPage", nowPage);
		System.out.println("fvo: " + fvo.toString());
		return "FAQ/faq";
	}

	@RequestMapping("/updatefaq.do")
	public String updatefaq(@ModelAttribute("faq") FaqVO fvo) {
		System.out.println("updatefaq.do  컨트롤러");
		faqService.updatefaq(fvo);
		return "redirect:getFaqAdminList.do";
	}

	@RequestMapping("/deletefaq.do")
	public String deletefaq(@ModelAttribute("faq") FaqVO fvo) {
		System.out.println("deletefaq.do 컨트롤러");
		faqService.deletefaq(fvo);
		return "redirect:getFaqAdminList.do";
	}

	@RequestMapping(value = "/insertfaq.do" ,method = RequestMethod.POST)
	public String insertfaq(@ModelAttribute("fvo") FaqVO vo) {
		System.out.println("insertfaq.do 컨트롤러");
			int cnt = faqService.insertfaq(vo);
			if (cnt == 1) {
				return "redirect:getFaqAdminList.do";
			} else
				return "FAQ/faqInsert";
	}
	@RequestMapping(value = "/insertfaq.do" ,method = RequestMethod.GET)
	public String insertfaqin(@ModelAttribute("fvo") FaqVO vo) {
		return "FAQ/faqInsert";
	}
	
}
