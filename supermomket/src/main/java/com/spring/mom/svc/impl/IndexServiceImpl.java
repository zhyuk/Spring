package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.IndexDAO;
import com.spring.mom.svc.IndexService;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.TradeVO;

@Service
public class IndexServiceImpl implements IndexService{
	
	@Autowired
	private IndexDAO dao;

	// 게시글 목록 가져오기
	@Override
	public List<Community_vsVO> getCommunityList(Community_vsVO vo) {
//		System.out.println("IndexSVC getCommunityList() 실행");
		return dao.getCommunityList(vo);
	}

	// 사용자 페이지 중고상품 목록 가져오기
	@Override
	public List<TradeVO> getTradeList(TradeVO vo) {
//		System.out.println("IndexSVC getTradeList() 실행");
		return dao.getTradeList(vo);
	}

	// 새상품 목록 가져오기
	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
//		System.out.println("IndexSVC getProductList() 실행");
		return dao.getProductList(vo);
	}

}
