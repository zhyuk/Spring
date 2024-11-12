package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mom.svc.UserService;
import com.spring.mom.vo.TradeService;
import com.spring.mom.vo.TradeVO;
import com.spring.mom.vo.UserVO;

@Controller
public class TradeController {

    @Autowired
    private TradeService tradeService;
    
    @Autowired
    private UserService userService;

    String realPath = "c:/swork/supermomket/src/main/webapp/resources/img/trade/";

    @ModelAttribute("conditionMap")
    public Map<String, String> searchConditionMap() {
        Map<String, String> conditionMap = new HashMap<String, String>();
        conditionMap.put("제목", "T_PRODUCT");
        conditionMap.put("내용", "T_CONTENT");
        return conditionMap;
    }

    @RequestMapping(value = "/trade_modify.do", method = RequestMethod.GET)
    public String modifyTradeForm(@RequestParam("t_no") int t_no, Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login.do";
        }

        TradeVO trade = tradeService.findByTNo(t_no);
        if (trade == null || !trade.getT_writer().equals(userId)) {
            return "redirect:/trade.do";
        }

        model.addAttribute("trade", trade);
        model.addAttribute("selectedCategory", trade.getT_class());
        return "trade/trade_modify";
    }

    @RequestMapping(value = "/trade_modify.do", method = RequestMethod.POST)
    public String modifyTrade(@ModelAttribute TradeVO trade, 
                             @RequestParam(value = "t_image", required = false) MultipartFile[] files,
                             RedirectAttributes redirectAttributes) throws IOException {
        
        TradeVO existingTrade = tradeService.findByTNo(trade.getT_no());
        
        // 파일 처리
        if (files != null && files.length > 0 && !files[0].isEmpty()) {
            List<String> fileNames = new ArrayList<>();
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {  // 빈 파일 체크
                    String fileName = file.getOriginalFilename();
                    file.transferTo(new File(realPath + fileName));
                    fileNames.add(fileName);
                }
            }
            // 파일명들을 쉼표로 구분하여 저장
            trade.setT_img(String.join(",", fileNames));
        } else {
            // 새로운 파일이 없으면 기존 이미지 유지
            trade.setT_img(existingTrade.getT_img());
        }
        
        // 디버깅을 위한 로그
        System.out.println("Uploaded files count: " + (files != null ? files.length : 0));
        System.out.println("Saved image names: " + trade.getT_img());
        
        tradeService.updateTrade(trade);
        redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 수정되었습니다.");
        return "redirect:/trade.do";
    }

    @RequestMapping(value = "/deleteTrade.do", method = RequestMethod.GET)
    public String deleteTrade(@RequestParam("t_no") int t_no, 
                            HttpSession session,
                            RedirectAttributes redirectAttributes) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login.do";
        }

        TradeVO trade = tradeService.findByTNo(t_no);
        if (trade == null || !trade.getT_writer().equals(userId)) {
            redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
            return "redirect:/trade.do";
        }

        if (trade.getT_img() != null) {
            String[] imageFiles = trade.getT_img().split(",");
            for (String fileName : imageFiles) {
                try {
                    File file = new File(realPath + fileName.trim());
                    if (file.exists()) {
                        if (file.delete()) {
                            System.out.println("이미지 파일 삭제 성공: " + fileName);
                        } else {
                            System.out.println("이미지 파일 삭제 실패: " + fileName);
                        }
                    }
                } catch (Exception e) {
                    System.out.println("이미지 파일 삭제 중 오류 발생: " + e.getMessage());
                }
            }
        }
        
        boolean isDeleted = tradeService.deleteTrade(t_no);
        
        if (isDeleted) {
            redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("error", "상품 삭제에 실패했습니다.");
        }
        
        return "redirect:/trade.do";
    }

    @RequestMapping("/trade_detail.do")
    public String getTrade(@RequestParam("t_no") int t_no, Model model, HttpSession session) {
        try {
            // 세션에서 사용자 정보 가져오기
            UserVO user = (UserVO) session.getAttribute("user");
            String userId = user != null ? user.getU_id() : null;
            
            // 상품 정보 조회
            TradeVO trade = tradeService.findByTNo(t_no); // getTrade 대신 findByTNo 사용
            
            if (trade == null) {
                model.addAttribute("errorMessage", "존재하지 않는 상품입니다.");
                return "redirect:/trade.do";
            }
            
            // 조회수 증가
            tradeService.increaseCnt(t_no);
            
            // 작성자 정보 조회
            UserVO writer = userService.getUserById(trade.getT_writer());
            String writerNickname = (writer != null && writer.getU_nickname() != null) 
                                   ? writer.getU_nickname() 
                                   : trade.getT_writer();
            
            // 디버깅
            System.out.println("작성자 ID: " + trade.getT_writer());
            System.out.println("조회된 작성자 정보: " + writer);
            System.out.println("설정된 닉네임: " + writerNickname);
            
            // 이미지 처리
            if (trade.getT_img() != null && !trade.getT_img().isEmpty()) {
                List<String> cleanedImageList = Arrays.stream(trade.getT_img().split(","))
                    .map(String::trim)
                    .filter(img -> !img.isEmpty())
                    .collect(Collectors.toList());
                model.addAttribute("imageList", cleanedImageList);
            }
            
        
            if (userId != null) {
                model.addAttribute("isLiked", tradeService.checkLike(t_no, userId));
            }
          
            model.addAttribute("trade", trade);
            model.addAttribute("writerNickname", writerNickname);
            model.addAttribute("likeCount", tradeService.getLikeCount(t_no));
            
            return "trade/trade_detail";
            
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "상품 정보를 불러오는 중 오류가 발생했습니다.");
            return "redirect:/trade.do";
        }
    }

    @RequestMapping(value = "/trade.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String trade(TradeVO vo, 
                       @RequestParam(required = false, defaultValue = "latest") String sortCondition,
                       @RequestParam(required = false) String categories,
                       Model model) {
        System.out.println("TradeController: trade() 실행");
        System.out.println("정렬 조건: " + sortCondition);
        System.out.println("선택된 카테고리: " + categories); // 디버깅용

        Map<String, Object> params = new HashMap<>();
        params.put("vo", vo);
        params.put("sortCondition", sortCondition);

    
        if (categories != null && !categories.trim().isEmpty()) {
            String[] categoryArray = categories.split(",");
          
            List<String> categoryList = Arrays.stream(categoryArray)
                .filter(cat -> !cat.trim().isEmpty())
                .collect(Collectors.toList());
            
            if (!categoryList.isEmpty()) {
                params.put("categories", categoryList);
                System.out.println("필터링할 카테고리: " + categoryList); 
            }
        }

        List<TradeVO> tradeList = tradeService.getTradeList(params);
        model.addAttribute("tradeList", tradeList);
        model.addAttribute("sortCondition", sortCondition);
        model.addAttribute("selectedCategories", categories);

        return "trade/trade";
    }
   

    @RequestMapping(value = "/trade_write.do", method = RequestMethod.GET)
    public String tradeWriteForm(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            return "redirect:/login.do";
        }
        
        return "trade/trade_write";
    }

    @RequestMapping(value = "/trade_write.do", method = RequestMethod.POST)
    public String tradeWrite(@ModelAttribute TradeVO trade, 
                           HttpSession session,
                           RedirectAttributes redirectAttributes) throws IOException {
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            return "redirect:/login.do";
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        trade.setT_date(sdf.format(new Date()));
        
        // 현재 로그인한 사용자의 ID를 작성자로 설정
        trade.setT_writer(userId);
        
        MultipartFile[] files = trade.getT_image();
        List<String> fileNames = new ArrayList<>();

        for (MultipartFile file : files) {
            if (file != null && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                String uploadPath = realPath;
                File dest = new File(uploadPath + fileName);
                file.transferTo(dest);
                fileNames.add(fileName);
            }
        }

        trade.setT_img(String.join(",", fileNames));

        int newTradeId = tradeService.insertTrade(trade);

        if (newTradeId > 0) {
            redirectAttributes.addAttribute("t_no", newTradeId);
            return "redirect:/trade.do";
        } else {
            return "error";
        }
    }

    
    
    //좋아요 (확인해야됨)
    @RequestMapping(value = "/toggleLike.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> toggleLike(@RequestBody Map<String, Integer> payload, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user != null ? user.getU_id() : null;
        int t_no = payload.get("t_no");
        
        if (userId == null) {
            response.put("error", "로그인이 필요합니다.");
            return response;
        }
        
        boolean isLiked = tradeService.toggleLike(t_no, userId);
        int likeCount = tradeService.getLikeCount(t_no);
        
        response.put("isLiked", isLiked);
        response.put("likeCount", likeCount);
        
        return response;
    }
}