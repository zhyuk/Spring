package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mom.svc.ProductService;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/products.do")
    public String listProducts(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "최신순") String sortType,
        @RequestParam(defaultValue = "Y") String category,
        @RequestParam(required = false) String searchQuery,
        Model model
    ) {
        int pageSize = 9; // 한 페이지에 보여줄 상품 개수를 9로 설정
        List<ProductVO> products = productService.getProductsByPage(page, pageSize, sortType, category, searchQuery);
        model.addAttribute("ProductList", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("sortType", sortType);
        model.addAttribute("category", category);
        model.addAttribute("searchQuery", searchQuery);

        int totalCount = productService.getProductCountByCategory(category, searchQuery);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("totalPages", totalPages);

        return "product/productList";
    }

    
    @GetMapping("/detail.do")
    public String productDetail(@RequestParam("p_no") int p_no, Model model) {
        ProductVO product = productService.getProductById(p_no);

        model.addAttribute("product", product);
        return "product/productDetail";
    }
    
    // 상품 리뷰 등록 및 리뷰 재로딩
    @PostMapping("/product/addReview")
    @ResponseBody
    public Map<String, Object> addReview(
            @RequestParam("p_no") int p_no,
            @RequestParam("c_id") String c_id,
            @RequestParam("c_text") String c_text,
            @RequestParam("c_img") MultipartFile c_img,
            @RequestParam("c_avg") int c_avg
            ) {
        
        Map<String, Object> requestResult = new HashMap<>();

        // 중복 리뷰 확인
        if (productService.checkIfReviewExists(p_no, c_id)) {
            requestResult.put("success", false);
            requestResult.put("message", "이미 이 상품에 대해 리뷰를 작성하셨습니다.");
            return requestResult;
        }
        
        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setC_no(p_no);
        reviewVO.setC_id(c_id);
        reviewVO.setC_text(c_text);
        reviewVO.setC_avg(c_avg);
        reviewVO.setC_delete("n"); // c_delete 기본값 "n" 설정
        reviewVO.setCreated_at(new Date());

        if (!c_img.isEmpty()) {
            try {
                String realPath = "c:/swork/supermomket/src/main/webapp/resources/img/review/";
                String fileName = UUID.randomUUID().toString() + "_" + c_img.getOriginalFilename(); 
                c_img.transferTo(new File(realPath + fileName));
                reviewVO.setC_img(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                requestResult.put("success", false);
                requestResult.put("message", "리뷰 등록에 실패했습니다.");
                return requestResult;
            }
        }
        
        productService.setReview(reviewVO);
        requestResult.put("reviewData", reviewVO);
        requestResult.put("success", true);
        requestResult.put("message", "리뷰가 성공적으로 등록되었습니다.");
        
        return requestResult;
    }

    // 상품상세페이지 진입 시, 리뷰 정보 GET
    @GetMapping("/product/getReviews")
    @ResponseBody
    public Map<String, Object> getReviews(@RequestParam("p_no") int p_no) {
        Map<String, Object> response = new HashMap<>();

        try {
            List<ReviewVO> reviews = productService.getReviewsByProductId(p_no);
            response.put("success", true);
            response.put("reviews", reviews);  // 기존 리뷰 목록
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "리뷰 로딩 중 오류 발생");
        }

        return response;
    }

 // 논리적 리뷰 삭제 기능 추가 - 리뷰 삭제 시 실제 삭제하지 않고 c_delete를 y로 설정
    @PostMapping("/product/deleteReview")
    @ResponseBody
    public Map<String, Object> deleteReview(@RequestParam("c_id") String reviewId) {
        Map<String, Object> response = new HashMap<>();

        try {
            boolean isDeleted = productService.deleteReviewById(reviewId);

            if (isDeleted) {
                response.put("success", true);
                response.put("message", "리뷰가 성공적으로 삭제되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "리뷰 삭제에 실패했습니다.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "오류가 발생했습니다: " + e.getMessage());
        }

        return response;
    }   
}