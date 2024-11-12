package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

public interface ProductService {
	List<ProductVO> getProductsByPage(int pageNum, int pageSize, String sortType, String category, String searchQuery);

	int getProductCountByCategory(String category, String searchQuery);

	// 상세 관련 메서드 추가
	ProductVO getProductById(int p_no);

	ProductVO getProduct(ProductVO pvo);

	int setReview(ReviewVO rvo);

	List<ReviewVO> getReviewsByProductId(int p_no);

	// 리뷰 삭제 메서드 추가
	boolean deleteReviewById(String reviewId);

	// 리뷰 중복 확인 메서드 인터페이스에 추가
	boolean checkIfReviewExists(int p_no, String c_id);

}
