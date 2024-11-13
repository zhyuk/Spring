package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.TradeVO;

@Repository
public class IndexDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 목록 가져오기
	public List<Community_vsVO> getCommunityList(Community_vsVO vo) {
//		System.out.println("IndexDAO getCommunityList() 실행");
		return mybatis.selectList("IndexDAO.getCommunityList", vo);
	}

	// 사용자 페이지 중고상품 목록 가져오기
	public List<TradeVO> getTradeList(TradeVO vo) {
//		System.out.println("IndexDAO getTradeList() 실행");
		return mybatis.selectList("IndexDAO.getTradeList", vo);
	}

	// 새상품 목록 가져오기
	public List<ProductVO> getProductList(ProductVO vo) {
//		System.out.println("IndexDAO getProductList() 실행");
		return mybatis.selectList("IndexDAO.getProductList", vo);
	}
}
