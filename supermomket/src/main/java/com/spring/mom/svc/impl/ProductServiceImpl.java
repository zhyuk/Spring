package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.ProductDAO;
import com.spring.mom.svc.ProductService;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> getProductsByPage(int pageNum, int pageSize, String sortType, String category,
			String searchQuery) {
		int offset = (pageNum - 1) * pageSize;
		return productDAO.getProductsByPage(pageSize, offset, sortType, category, searchQuery);
	}

	@Override
	public int getProductCountByCategory(String category, String searchQuery) {
		return productDAO.getProductCountByCategory(category, searchQuery);
	}

	// 상세 페이지 관련 추가
	@Override
	public ProductVO getProductById(int p_no) {
		return productDAO.getProductById(p_no);
	}

	@Override
	public ProductVO getProduct(ProductVO pvo) {
		return productDAO.getProduct(pvo);
	}

	@Override
	public int setReview(ReviewVO rvo) {
		return productDAO.setReview(rvo);
	}

	@Override
	public List<ReviewVO> getReviewsByProductId(int p_no) {
		return productDAO.getReviewsByProductId(p_no);
	}

	// 리뷰 삭제 메서드 구현
	@Override
	public boolean deleteReviewById(String reviewId) {
	    try {
	        productDAO.deleteReviewById(reviewId); // 논리 삭제 처리
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	// 리뷰 중복 확인 메서드 구현체에 추가
	@Override
	public boolean checkIfReviewExists(int p_no, String c_id) {
	    return productDAO.checkIfReviewExists(p_no, c_id);
	}

}
