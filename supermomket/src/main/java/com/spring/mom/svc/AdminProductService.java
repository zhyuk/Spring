package com.spring.mom.svc;

import java.util.List;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

public interface AdminProductService {

    List<ProductVO> getAdminProductsByPage(int page, int pageSize, String category, String sortType, String searchQuery);

    int getProductCountByCategory(String category, String searchQuery);

    ProductVO getProductByNo(int pNo);

    int getReviewCountByProductId(int pNo); // 리뷰 개수 가져오는 메서드

    List<ReviewVO> getReviewsByProductId(int pNo); // 리뷰 목록 가져오는 메서드

	int saveProduct(ProductVO product);

	int updateProduct(ProductVO product);

	void deleteProduct(int p_no);
}
