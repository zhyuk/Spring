package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mom.svc.MypageService;
import com.spring.mom.vo.OrderVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.UserVO;

@Controller
public class MypageController {

    @Autowired
    private MypageService mypageService;

    // 관리자 메뉴
    @RequestMapping(value = "/userList.do", method = RequestMethod.GET)
    public String getUserList(
        @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
        @RequestParam(value = "searchType", required = false) String searchType,
        @RequestParam(value = "page", defaultValue = "1") int page,
        Model model) {

        int itemsPerPage = 10; // 페이지당 항목 수
        int offset = (page - 1) * itemsPerPage;

        List<UserVO> userList;
        int totalItems;

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            userList = mypageService.searchUsers(searchType, searchKeyword, offset, itemsPerPage);
            totalItems = mypageService.getSearchUserCount(searchType, searchKeyword);
        } else {
            userList = mypageService.getUsersPg(offset, itemsPerPage);
            totalItems = mypageService.getTotalUserCnt();
        }

        model.addAttribute("userList", userList);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("currentPage", page);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("searchType", searchType);

        return "mypage/mypage_getUserList";
    }
    
    // 사용자 정보 수정(관리자)
    @RequestMapping(value = "/selUser.do", method = RequestMethod.POST)
    public String selUser(
		@RequestParam("userId") String userId,
        @RequestParam("u_name") String uName,
        @RequestParam("u_nickname") String uNickname,
        @RequestParam("u_address") String uAddress,
        @RequestParam("u_pno") String uPno,
        @RequestParam("u_email") String uEmail) {
    	
        UserVO uvo = new UserVO();
        
        uvo.setU_id(userId);
        uvo.setU_name(uName);
        uvo.setU_nickname(uNickname);
        uvo.setU_address(uAddress);
        uvo.setU_pno(uPno);
        uvo.setU_email(uEmail);

        mypageService.selUser(uvo);
        
        return "redirect:userList.do";
    }
    
    // 회원 삭제(관리자) - ok
    @RequestMapping("/delUser.do")
    public String delUser(@RequestParam("userId") String userId, HttpSession session) {
        UserVO uvo = new UserVO();
        uvo.setU_id(userId);
        mypageService.delUser(uvo);
        return "redirect:userList.do";
    }
    
    // 관리자 비밀번호 확인(관리자) - ok
    @RequestMapping("/updateAdmin.do")
    public String updateAdminChk(HttpSession session) {
    	
    	session.getAttribute("userId");
    	
    	return "mypage/adminPage";
    }
    
    // 관리자 비밀번호 수정 상세(관리자) - ok
    @RequestMapping(value = "/updateAdminDetail.do", method = RequestMethod.POST)
    public String updateAdminDetail(UserVO uvo, HttpSession session, Model model) {
    	
    	uvo.setU_id((String)session.getAttribute("userId"));
    	boolean isAuthenticated = mypageService.authenticateUser(uvo.getU_id(), uvo.getU_pw());
    	
    	if(isAuthenticated) {
    		model.addAttribute("checkYn", "Y");
    		mypageService.updateAdminDetail(uvo);
    		
    		return "mypage/adminPage_edit";
    	}else {
    		model.addAttribute("checkYn", "N");
    		model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
    		
    		return "mypage/adminPage"; 
    	}
    }
    
    // 관리자 새 비밀번호로 업데이트(관리자) - ok(수정 완료 시 alert 띄우기 할 것)
    @RequestMapping(value = "/setNewAdminPw.do", method = RequestMethod.POST)
    public String setNewAdminPw(@RequestParam String n_pw, HttpSession session) {
        String userId = (String) session.getAttribute("userId");

        UserVO uvo = new UserVO();
        uvo.setU_id(userId);
        uvo.setU_pw(n_pw);

        mypageService.setNewAdminPw(uvo);

        return "redirect:index.jsp";
    }
    
    
    
    
    
    
    
    
    
    
    // 사용자 메뉴
    // 주문 목록 보기(사용자)
    @RequestMapping("/buyList.do")
    public String getBuyList(OrderVO olvo, Model model, HttpSession session) {
    	String userId = (String)session.getAttribute("userId");
    	
        if (userId == null) {
        	
            return "login/login";
        }
        
        olvo.setU_id(userId);
        List<OrderVO> buyList = mypageService.getBuyList(olvo);
        
//        System.out.println("주문목록1: " + buyList);
        model.addAttribute("buyList", buyList);
        
    	return "mypage/mypage_buyList";
    }
    
    // 주문목록 상세 보기(사용자)
    @RequestMapping("/buyListDetail.do")
    public String getBuyListDetail(@RequestParam(value = "o_no", required = false, defaultValue = "0") int o_no, OrderVO olvo, Model model, HttpSession session) {
    	String userId = (String)session.getAttribute("userId");
    	
        olvo.setU_id(userId);
        olvo.setC_no(o_no);
        List<OrderVO> buyListDetail = mypageService.getBuyListDetail(olvo);
        
        model.addAttribute("buyListDetail", buyListDetail);
//        System.out.println("마이페이지 olvo.get아이디: "+ olvo.getU_id());
//        System.out.println("주문상세목록1: " + model);
//        System.out.println("주문 번호(o_no): " + olvo.getO_no());
        
    	return "mypage/mypage_buyList_detail";
    }
    
    // 찜 상품 목록 조회(사용자)
    @RequestMapping("/zzimList.do")
    public String getZzimList(ProductVO pvo, Model model) {
    	
        model.addAttribute("zzimList", mypageService.getZzimList(pvo));
        
        return "mypage/mypage_zzimList";
    }

    // 마이페이지 비밀번호 조회(사용자)
    @RequestMapping(value = "/updateMypage.do")
    public String updateMypageChk(HttpSession session, UserVO uvo) {
    	
        String userId = (String)session.getAttribute("userId");
        
//        mypageService.updateMypageChk(uvo);
//        System.out.println("컨트롤러: " + (String) session.getAttribute("userId"));
        
        return "mypage/mypage_updateMypage";
    }
    
    // 마이페이지 정보 수정(사용자)
    @RequestMapping(value = "/updateMypage_detail.do", method = RequestMethod.POST)
    public String updateMypageDetail(UserVO uvo, Model model, HttpSession session) {
        uvo.setU_id((String) session.getAttribute("userId"));

        boolean isAuthenticated = mypageService.authenticateUser(uvo.getU_id(), uvo.getU_pw());

        if (isAuthenticated) {
            model.addAttribute("mypageDetail", mypageService.updateMypageDetail(uvo));
            model.addAttribute("checkYn", "Y");
//            System.out.println("지금바로 여기 uvo: " + uvo);
//            System.out.println("요기조기 model : " + model);
            
            return "mypage/mypage_updateMypage_detail";
        } else {
    		model.addAttribute("checkYn", "N");
    		model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
    	}
            return "mypage/mypage_updateMypage";
    }

    // 마이페이지 새 정보 업데이트(사용자)
    @RequestMapping(value = "/setNewMypage.do", method = RequestMethod.POST)
    public String setNewMypage(UserVO uvo) {
    
		mypageService.setNewMypage(uvo);
//    	System.out.println("내 정보 업데이트 완료");
    	return "redirect:index.jsp";
    }
    
    // 비밀번호 수정 조회(사용자) - ok
    @RequestMapping("/updatePassword.do")
    public String updatePasswordChk(HttpSession session, UserVO uvo) {
    	
    	session.getAttribute("userId");
    	mypageService.updatePasswordChk(uvo);
    	
    	return "mypage/mypage_updatePassword";
    }
    
    // 비밀번호 수정 상세(사용자)
    @RequestMapping(value = "/updatePassword_detail.do", method = RequestMethod.POST)
    public String updatePasswordDetail(UserVO uvo, HttpSession session, Model model) {
        uvo.setU_id((String) session.getAttribute("userId"));

        boolean isAuthenticated = mypageService.authenticateUser(uvo.getU_id(), uvo.getU_pw());

        if (isAuthenticated) {
            model.addAttribute("checkYn", "Y");
            mypageService.updatePasswordDetail(uvo);
            
            return "mypage/mypage_updatePassword_detail";
        } else {
            model.addAttribute("checkYn", "N");
            model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            
            return "mypage/mypage_updatePassword";
        }
    }
    
    // 새 비밀번호로 업데이트(사용자)
    @RequestMapping(value = "/setNewPassword.do", method = RequestMethod.POST)
    public String setNewPassword(@RequestParam String n_pw, HttpSession session) {
    	String userId = (String) session.getAttribute("userId");
    	 
        UserVO uvo = new UserVO();
        uvo.setU_id(userId);
        uvo.setU_pw(n_pw);

        mypageService.setNewAdminPw(uvo);

        return "redirect:index.jsp";
    }
    
    // 마이페이지 회원탈퇴(사용자)
    @RequestMapping(value="/taltaeUser.do", method = RequestMethod.POST)
    public String taltaeUser(HttpSession session, UserVO uvo, HttpServletRequest request) {
    	String userId = (String) session.getAttribute("userId");
    	
    	uvo.setU_id(userId);
    	mypageService.taltaeUser(uvo);
    	
    	session.invalidate();
    	
    	HttpSession newSession = request.getSession(true);
    	newSession.setAttribute("errorMessage", "탈퇴가 완료되었습니다.");
    	
    	return "redirect:/index.jsp";
    }
    
    
    
}
