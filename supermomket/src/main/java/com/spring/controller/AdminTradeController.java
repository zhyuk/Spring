
package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mom.vo.TradeService;
import com.spring.mom.vo.TradeVO;

@Controller
@RequestMapping("/admin")
public class AdminTradeController {
    
    @Autowired
    private TradeService tradeService;
    
    @GetMapping("/trade")
    public String tradeManagement(
            @RequestParam(defaultValue = "") String status,
            @RequestParam(defaultValue = "latest") String sort,
            @RequestParam(defaultValue = "") String searchKeyword,
            @RequestParam(defaultValue = "t_product") String searchCondition,
            @RequestParam(defaultValue = "1") int page,
            Model model) {
        
        int pageSize = 10; // 페이지당 게시물 수
        int offset = (page - 1) * pageSize;
        
        // 검색 조건 설정
        Map<String, Object> params = new HashMap<>();
        params.put("status", status);
        params.put("sort", sort);
        params.put("keyword", searchKeyword);
        params.put("searchCondition", searchCondition);
        params.put("offset", offset);
        params.put("pageSize", pageSize);
        
        // 데이터 조회
        List<TradeVO> trades = tradeService.getTradesForAdmin(params);
        int totalCount = tradeService.getTotalTradesCount(params);
        
        // 페이징 정보 계산
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        
        // 모델에 데이터 추가
        model.addAttribute("trades", trades);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("selectedStatus", status);
        model.addAttribute("selectedSort", sort);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("searchCondition", searchCondition);
        
        return "admin/tradeManagement";
    }
    
    @PostMapping("/trade/delete")
    @ResponseBody
    public Map<String, Object> deleteTrades(@RequestBody Map<String, List<Integer>> request,
                                          HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        // 관리자 권한 체크
        String userId = (String) session.getAttribute("userId");
        if (!"admin".equals(userId)) {
            response.put("success", false);
            response.put("message", "권한이 없습니다.");
            return response;
        }
        
        try {
            List<Integer> ids = request.get("ids");
            tradeService.deleteMultipleTrades(ids);
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", e.getMessage());
        }
        
        return response;
    }
}