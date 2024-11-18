package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mom.svc.CartService;
import com.spring.mom.vo.CartVO;
import com.spring.mom.vo.ProductVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;


	// 로그인 - 차후 삭제할 데이터
	// @RequestMapping("/login.do")
	// public String login(HttpSession session) {
	// 	session.setAttribute("uId", "admin");
	// 	return "redirect:/index.jsp";
	// }

	// // 로그아웃 - 차후 삭제할 데이터
	// @RequestMapping("/logout.do")
	// public String logout(HttpSession session) {
	// 	session.invalidate();
	// 	return "redirect:/index.jsp";
	// }

	@RequestMapping("/cartList.do")
	public String getcartList(CartVO cvo, Model model, HttpSession session) {
		try {
			cvo.setU_id((String) session.getAttribute("userId"));
			if (cvo.getU_id() == null) {
	        	
	            return "login/login";
	        }
			
			cvo.setC_payment("ready");
//			System.out.println("uid:"+cvo.getU_id());
			List<CartVO> cartList = cartService.getcartList(cvo);
			int carttotal = cartService.carttotal(cvo);
			model.addAttribute("cartList", cartList);
			model.addAttribute("carttotal",carttotal);
//		System.out.println("cartList:" + cartService.getcartList(cvo));
//		System.out.println("carttotal: " + cartService.carttotal(cvo));
			
			return "cart/cartmain";
			
		} catch (NullPointerException e) {
			return "cart/cartmain";
		}
	}

	@RequestMapping("/p_countup.do")
	@ResponseBody
	public Map<String, Object> p_countup(@RequestBody CartVO cvo) {
		Map<String, Object> response = new HashMap<>();
		try {
			// 수량 업데이트
			cartService.c_change(cvo);
//			System.out.println("c_change:" + cartService.c_change(cvo));
			// 가격 업데이트
//			System.out.println("cvo.getC_no():"+cvo.getC_no()); 
			System.out.println("cvo.getP_count():"+cvo.getP_count()); 
			System.out.println("cvo.getP_price():"+cvo.getP_price()); 
			cartService.getcartList(cvo);
			cartService.p_totalup(cvo);
//			 System.out.println("p_totalup:"+cartService.p_totalup(cvo));
			// 업데이트된 총액 가져오기
			int newTotal = cartService.p_total(cvo);
			System.out.println("p_total:"+cartService.p_total(cvo));

			response.put("carttotal", cartService.carttotal(cvo));
			response.put("newTotal", newTotal);
		} catch (Exception e) {
			e.printStackTrace(); // 서버 로그에 예외 출력
			response.put("error", "서버 처리 중 오류가 발생했습니다.");
			return response;
		}

		return response; // JSON 응답으로 newTotal 반환
	}
	@PostMapping("/insertcart.do")
	public ResponseEntity<String> insertCart(@RequestBody Map<String, Object> cartData) {
	    try {
	        // JSON 데이터를 적절히 변환하여 사용
	        String u_id = (String) cartData.get("userId");
	        int p_no = Integer.parseInt(cartData.get("productId").toString());
	        int p_count = Integer.parseInt(cartData.get("quantity").toString());
	        int p_price = Integer.parseInt(cartData.get("price").toString());
	        String p_name = (String) cartData.get("productName");
	        String p_img = (String) cartData.get("imageUrl");
	        String p_callno = (String) cartData.get("p_callno");
	        
	        
	        
	        CartVO cvo = new CartVO();
	        cvo.setU_id(u_id);
	        cvo.setP_no(p_no);
	        cvo.setP_count(p_count);
	        cvo.setP_price(p_price);
	        cvo.setP_name(p_name);
	        cvo.setP_img(p_img);
	        cvo.setP_callno(p_callno);
	        int chk= cartService.cartequals(u_id, p_no);
	        
	        
	         if(chk ==0){
//	        	System.out.println("if문");
	        cartService.insertcart(cvo);
	        }else {
	        	
//	        	System.out.println("else문");
//	        	System.out.println("p_count:"+cvo.getP_count());
	        	cartService.c_change(cvo);
	        	cartService.p_totalup(cvo);
	        }
	        
	        return ResponseEntity.ok("장바구니에 추가되었습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("오류가 발생했습니다.");
	    }
	}
	   // 상세페이지 > 주문하기 데이터 필요 코드
	   @RequestMapping("/insertproduct.do")
	   public String insertProduct(@ModelAttribute("pvo") ProductVO pvo, CartVO cvo, HttpSession session) {
	      
	      System.out.println("pvo: "+pvo);
	      
	       // 세션에서 userId 가져오기
	       String userId = (String) session.getAttribute("userId");
	       cvo.setU_id(userId);
	       
	       // ProductVO의 필드를 CartVO로 설정
	       cvo.setP_no(pvo.getP_no());
	       cvo.setP_count(pvo.getP_count());
	       cvo.setP_price(pvo.getP_discount());
	       cvo.setP_name(pvo.getP_name());
	       cvo.setP_img(pvo.getP_img());
	       cvo.setP_callno(pvo.getP_callno());
	       
	       // CartService에 CartVO 전달
	       cartService.insertproduct(cvo);
	       
	       // 장바구니 목록 페이지로 리다이렉트
	       return "redirect:preparcartList.do";
	   }


//	장바구니 창 물품삭제 메소드
	@RequestMapping(value = "/deletcart.do", method = RequestMethod.GET)
	public String deletcart(Model model, CartVO cvo) {
		System.out.println("cvo: " + cvo);
		
		int[] cNoArrList = cvo.getC_noarr();
//		System.out.println("c_payment:"+cvo.getC_payment());
		// 각 선택된 c_no에 대해 cartService 호출
		for (Integer c_no : cNoArrList) {
			System.out.println("for문 c_no: " + c_no);
			cvo.setC_no(c_no);
			cartService.deletcart(cvo);
}
			
			model.addAttribute("cartList", cartService.getcartList(cvo));
			model.addAttribute("carttotal", cartService.carttotal(cvo));
			return "cart/cartmain";
		
	}
	
			//	장바구니 갯수추가
	    @GetMapping("/cartcount.do")
	    public Map<String, Integer> getCartCount(@RequestParam("u_id")CartVO u_id) {
	    	int cartCount = cartService.cartcount(u_id);
	        Map<String, Integer> response = new HashMap<>();
	        response.put("count", cartCount);
	        return response; // JSON 형식으로 반환
	    }
	    
	}
	
	


