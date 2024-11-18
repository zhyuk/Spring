package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.ProductDAO;
import com.spring.mom.svc.AdminProductService;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

@Service
public class AdminProductServiceImpl implements AdminProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public List<ProductVO> getProductsByPage(int page, int pageSize, String category, String sortType, String searchQuery) {
        int offset = (page - 1) * pageSize;
        return productDAO.getProductsByPage(pageSize, offset, sortType, category, searchQuery);
    }

    @Override
    public int getProductCountByCategory(String category, String searchQuery) {
        return productDAO.getProductCountByCategory(category, searchQuery);
    }

    @Override
    public ProductVO getProductByNo(int pNo) {
        return productDAO.getProductById(pNo);
    }

    @Override
    public int getReviewCountByProductId(int pNo) {
        return productDAO.getReviewCountByProductId(pNo); // 리뷰 개수 가져오기
    }

    @Override
    public List<ReviewVO> getReviewsByProductId(int pNo) {
        return productDAO.getReviewsByProductId(pNo); // 리뷰 목록 가져오기
    }
    
    @Override
    public int saveProduct(ProductVO product) {
    	
    	// Product Master
    	productDAO.saveProduct(product);
    	// Product Detail    	
    	return productDAO.saveDetail(product.getP_no(), product.getD_content(), product.getD_info());
        
    }

    @Override
    public int updateProduct(ProductVO product) {
        // Product Master 업데이트
        productDAO.updateProduct(product);

        // Product Detail 업데이트
        return productDAO.updateDetail(product.getP_no(), product.getD_content(), product.getD_info());
    }
    
    @Override
    public void deleteProduct(int p_no) {
    	 // 상세 테이블 삭제
        productDAO.deleteProductDetail(p_no);
        productDAO.deleteProduct(p_no);
    }
}
