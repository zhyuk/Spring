package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mom.svc.ProductService;
import com.spring.mom.vo.ProductVO;

@Controller
public class AdminProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/productsList.do")
    public String listProducts(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(required = false) String searchQuery,
        Model model
    ) {
        int pageSize = 15; // 한 페이지에 보여줄 상품 개수를 9로 설정
        List<ProductVO> products = productService.getProductsByPage(page, pageSize, null, null, searchQuery);
        model.addAttribute("ProductList", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("searchQuery", searchQuery);

        int totalCount = productService.getProductCountByCategory(null, searchQuery);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("totalPages", totalPages);

        return "product/adminProductList";
    }

    
  
}