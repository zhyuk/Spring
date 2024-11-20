package com.spring.mom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

@Repository
public class ProductDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    // 페이징, 정렬, 카테고리, 검색 필터링을 처리하는 메서드
    public List<ProductVO> getProductsByPage(int limit, int offset, String sortType, String category, String searchQuery) {
        Map<String, Object> params = new HashMap<>();
        params.put("limit", limit);
        params.put("offset", offset);
        params.put("sortType", sortType);
        params.put("category", category);
        params.put("searchQuery", searchQuery);
        return sqlSession.selectList("ProductDAO.getProductsByPage", params);
    }
    
 // 페이징, 정렬, 카테고리, 검색 필터링을 처리하는 메서드
    public List<ProductVO> getAdminProductsByPage(int limit, int offset, String sortType, String category, String searchQuery) {
        Map<String, Object> params = new HashMap<>();
        params.put("limit", limit);
        params.put("offset", offset);
        params.put("sortType", sortType);
        params.put("category", category);
        params.put("searchQuery", searchQuery);
        return sqlSession.selectList("ProductDAO.getAdminProductsByPage", params);
    }

    // 특정 카테고리의 전체 상품 수를 가져오는 메서드
    public int getProductCountByCategory(String category, String searchQuery) {
        Map<String, Object> params = new HashMap<>();
        params.put("category", category);
        params.put("searchQuery", searchQuery);
        return sqlSession.selectOne("ProductDAO.getProductCountByCategory", params);
    }

    // 특정 상품 가져오기 (상품 상세 페이지 용도)
    public ProductVO getProductById(int p_no) {
        return sqlSession.selectOne("ProductDAO.getProductById", p_no);
    }

    public ProductVO getProduct(ProductVO pvo) {
        return sqlSession.selectOne("ProductDAO.getProduct", pvo);
    }

    public int setReview(ReviewVO rvo) {
        return sqlSession.insert("ProductDAO.setReview", rvo);
    }

    public int getReviewCountByProductId(int p_no) {
        return sqlSession.selectOne("ProductDAO.getReviewCountByProductId", p_no);
    }

    public List<ReviewVO> getReviewsByProductId(int p_no) {
        return sqlSession.selectList("ProductDAO.getReviewsByProductId", p_no);
    }

 // 특정 사용자와 상품에 대한 리뷰가 존재하는지 확인하는 메서드 추가
    public boolean checkIfReviewExists(int p_no, String c_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("p_no", p_no);
        params.put("c_id", c_id);
        int count = sqlSession.selectOne("ProductDAO.checkIfReviewExists", params);
        return count > 0; // 결과가 0보다 크면 리뷰가 존재하는 것으로 간주
    }

    // 리뷰를 논리적으로 삭제하기 위해 c_delete 필드를 y로 업데이트하는 메서드
 // ProductDAO.java
    public void deleteReviewById(String reviewId) {
        Map<String, Object> params = new HashMap<>();
        params.put("reviewId", reviewId);
        params.put("c_delete", "y"); // 논리 삭제 처리
        sqlSession.update("ProductDAO.deleteReviewById", params);
    }
    
    
    //ADMIN - 상품등록
    public int saveProduct(ProductVO product) {
        return sqlSession.insert("ProductDAO.saveProduct", product);
    }

	public int saveDetail(int productKey, String d_content, String d_info) {
		Map<String, Object> params = new HashMap<>();
        params.put("d_no", productKey);
        params.put("d_content", d_content);
        params.put("d_info", d_info);
		return sqlSession.insert("ProductDAO.saveDetailProduct", params);
	}

	public void updateProduct(ProductVO product) {
	    sqlSession.update("ProductDAO.updateProduct", product); // 마스터 업데이트
	}

	public int updateDetail(int p_no, String d_content, String d_info) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("d_no", p_no);
	    paramMap.put("d_content", d_content);
	    paramMap.put("d_info", d_info);
	    return sqlSession.update("ProductDAO.updateDetail", paramMap); // 상세 데이터 업데이트
	}

	public void deleteProduct(int p_no) {
		sqlSession.delete("ProductDAO.deleteProduct", p_no);
		
	}

	public void deleteProductDetail(int p_no) {
		sqlSession.delete("ProductDAO.deleteProductDetail", p_no);
		
	}



}
