package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.mom.svc.IndexService;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.TradeVO;

@Controller
public class ViewController {

	@Autowired
	private IndexService IndexSVC;

	@GetMapping("/")
	public String getIndexInfo(Community_vsVO communityVO, TradeVO tradeVO, ProductVO productVO, Model model) {
//		System.out.println("인덱스 접속시도");

		model.addAttribute("boardList", IndexSVC.getCommunityList(communityVO));
		model.addAttribute("tradeList",IndexSVC.getTradeList(tradeVO));
		model.addAttribute("productList", IndexSVC.getProductList(productVO));
		return "view/index";
	}

}
