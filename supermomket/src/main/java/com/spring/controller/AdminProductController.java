package com.spring.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mom.svc.AdminProductService;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.ReviewVO;

@Controller
public class AdminProductController {

    @Autowired
    private AdminProductService productService;

    @GetMapping("/productsList.do")
    public String listProducts(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(required = false) String searchQuery,
        Model model
    ) {
        int pageSize = 10;
        List<ProductVO> products = productService.getAdminProductsByPage(page, pageSize, null, null, searchQuery);
        model.addAttribute("ProductList", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("searchQuery", searchQuery);

        int totalCount = productService.getProductCountByCategory(null, searchQuery);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("totalPages", totalPages);

        return "product/adminProductList";
    }

    @GetMapping("/productsDetail.do")
    public String productDetail(@RequestParam("p_no") int pNo, Model model) {
        ProductVO product = productService.getProductByNo(pNo);
        int reviewCount = productService.getReviewCountByProductId(pNo);
        List<ReviewVO> reviews = productService.getReviewsByProductId(pNo);

        model.addAttribute("product", product);
        model.addAttribute("reviewCount", reviewCount);
        model.addAttribute("reviews", reviews);
        return "product/adminProductDetail";
    }


    @GetMapping("/productsEdit.do")
    public String editProduct(@RequestParam("p_no") int pNo, Model model) {
        ProductVO product = productService.getProductByNo(pNo);
        model.addAttribute("product", product);
        return "product/adminProductEdit";
    }
    
    @GetMapping("/productsWrite.do")
    public String writeProduct() {
        return "product/adminProductWrite";
    }
    
    @PostMapping("/saveProduct.do")
    public String saveProduct(
    		ProductVO product
    		, @RequestParam("front_p_img") MultipartFile front_p_img
    		, @RequestParam("front_d_content") MultipartFile front_d_content
    		,  RedirectAttributes redirectAttributes) {
    	
    	try {
    		
    		 String realPath = "c:/swork/supermomket/src/main/webapp/resources/img/product/";
             String imgFileName = UUID.randomUUID().toString() + "_" + front_p_img.getOriginalFilename();
             String contentFileName = UUID.randomUUID().toString() + "_" + front_d_content.getOriginalFilename();
             front_p_img.transferTo(new File(realPath + imgFileName));
             front_d_content.transferTo(new File(realPath + contentFileName));
             product.setP_img(imgFileName);
             product.setD_content(contentFileName);
             
             productService.saveProduct(product);
             
             // Flash attribute로 메시지 전달
             redirectAttributes.addAttribute("status", "success");
			
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addAttribute("status", "fail");
           
		}
    	
    	return "redirect:/productsList.do";
    }
    
    @PostMapping("/updateProduct.do")
    public String updateProduct(
            ProductVO product,
            @RequestParam(value = "front_p_img", required = false) MultipartFile front_p_img,
            @RequestParam(value = "front_d_content", required = false) MultipartFile front_d_content,
            RedirectAttributes redirectAttributes) {
        try {
            String realPath = "c:/swork/supermomket/src/main/webapp/resources/img/product/";

            // 이미지 파일 처리 (이미지가 전달된 경우에만 처리)
            if (front_p_img != null && !front_p_img.isEmpty()) {
                String imgFileName = UUID.randomUUID().toString() + "_" + front_p_img.getOriginalFilename();
                front_p_img.transferTo(new File(realPath + imgFileName));
                product.setP_img(imgFileName);
            }

            if (front_d_content != null && !front_d_content.isEmpty()) {
                String contentFileName = UUID.randomUUID().toString() + "_" + front_d_content.getOriginalFilename();
                front_d_content.transferTo(new File(realPath + contentFileName));
                product.setD_content(contentFileName);
            }

            // 상품 수정 로직 실행
            productService.updateProduct(product);

            // 성공 메시지 전달
            redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            // 실패 메시지 전달
            redirectAttributes.addFlashAttribute("message", "상품 수정 중 오류가 발생했습니다.");
        }

        return "redirect:/productsList.do";
    }
    
    @PostMapping("/deleteProduct.do")
    public String deleteProduct(
            @RequestParam("p_no") int p_no,
            RedirectAttributes redirectAttributes) {
        try {
            productService.deleteProduct(p_no);
            redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "상품 삭제 중 오류가 발생했습니다.");
        }
        return "redirect:/productsList.do";
    }
}
