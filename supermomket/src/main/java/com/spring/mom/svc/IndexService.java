package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.TradeVO;
import com.spring.mom.vo.UserVO;

public interface IndexService {
	
	// 게시글 목록 가져오기
	public List<Community_vsVO> getCommunityList(Community_vsVO vo);
	
	// 사용자 페이지 중고상품 목록 가져오기
	public List<TradeVO> getTradeList(TradeVO vo);
	
	// 새상품 목록 가져오기
	public List<ProductVO> getProductList(ProductVO vo);
	
	// 관리자 부분
	// 새상품 목록 가져오기
	public List<ProductVO> getProductListAdmin(ProductVO vo);
	
	// 사용자 목록 가져오기
	public List<UserVO> getUserListAdmin(UserVO vo);
	
	// 차트에 들어갈 사용자 수 가져오기
	public List<UserVO> getChartAdmin(UserVO vo);

}
