package com.spring.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.mom.co.my.order.vo.FormDatavVO;
import com.spring.mom.co.my.order.vo.OrderListDetailVO;
import com.spring.mom.co.my.order.vo.OrderListVO;
import com.spring.mom.co.my.order.vo.ResponseVO;
import com.spring.mom.co.my.order.vo.ResponseVO2;
import com.spring.mom.co.my.order.vo.ResponseVO3;
import com.spring.mom.co.portone.vo.PaymentAnnotationVO;
import com.spring.mom.co.portone.vo.PortOnePayOneDetailVO;
import com.spring.mom.co.portone.vo.PortOnePayRequestVO;
import com.spring.mom.svc.CartService;
import com.spring.mom.svc.OrderService;
import com.spring.mom.vo.CartVO;
import com.spring.mom.vo.OrderVO;
import com.spring.mom.vo.PagingVO;

@Controller
public class PortOnePayController {
		
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	// 상점아이디
//	 private String storeId = "자신의 상점 아이디 값 입력";
	// 연동정보 채널키
	private String channelKey = "channel-key-2ac8602a-e27d-4e62-ad6a-8e29647f720a";
	// 포트원 고객사 식별코드	
	private String impCode = "imp46120053";
	// Rest API Key
	private String imp_key = "2213368787150058";
	// REST API Secret
	private String imp_secret = "jrVP1C5jepXpBGvRqDb37PxkgPJ4hWkpA2Z6aHXO1NUgy85WEMaK17IKDmGgTSoK1LAImhMSYShRq2Ad";

	// portone hostname
	// https://developers.portone.io/api/rest-v1/auth?v=v1
	// [개요] 메뉴의 [PortOne REST API - V1] 에서 V1 API hostname참고
	String hostname = "https://api.iamport.kr";

	@ModelAttribute("portOneNeeds")
	public Map<String, String> getPortOne() {
		Map<String, String> map = new HashMap<>();
		// 상점아이디
		// map.put("storeId", storeId);
		map.put("channelKey", channelKey);
		// 포트원 고객사 식별코드
		map.put("impCode", impCode);

		return map;
	}
	
	
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("ID", "ID");
		conditionMap.put("결제 방식", "STATUS");
		return conditionMap;
	}
	
	

	// 토큰 발급받기(모든 API를 사용할 때, header에 반드시 보내야함)
	// https://developers.portone.io/api/rest-v1/payment?v=v1
	// portone hostname [개요] 메뉴의 [인증 관련 API] 참고
	// 인증 관련 API => 액세스토큰 사용하기 => 속성명 : Authorization , 속성값: Bearer 액세스토큰값
	@RequestMapping("/getTocken")
	public String getTocken() {
		System.out.println("access_token 발급 API");

		String token = "";
		String url = hostname + "/users/getToken";
		String jsonData = "{\"imp_key\":\"" + imp_key + "\",\"imp_secret\":\"" + imp_secret + "\"}";
		try {
			HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url))
					.header("Content-Type", "application/json")
					.method("POST", HttpRequest.BodyPublishers.ofString(jsonData)).build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request,
					HttpResponse.BodyHandlers.ofString());

			String jsonString = response.body(); // 필요한 응답데이터
			// System.out.println("jsonString: "+jsonString);

			// String to JSON으로 변환하기 위한 작업
			// 참고 : https://www.baeldung.com/jackson-deserialize-json-unknown-properties
			ObjectMapper mapper = new ObjectMapper();
			ResponseVO rvo = mapper.readValue(jsonString, ResponseVO.class);
			token = (String) rvo.getResponse().get("access_token");
			// System.out.println("토큰값: " + token);

		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return token;
	}

//	결제화면창이동 메소드
	@RequestMapping(value = "/preparcartList.do", method = RequestMethod.GET)
	public String preparcartList(CartVO cvo, Model model,HttpSession session) {
		cvo.setC_payment("preparation");
		cvo.setU_id((String) session.getAttribute("userId"));
		if (cvo.getU_id() == null) {
        	
            return "login/login";
        }
		
		model.addAttribute("paymentcartList", cartService.getpaymenttotalcartList(cvo));
		model.addAttribute("paymenttotal", cartService.carttotal(cvo));

		return "cart/cartPayment_page";
	}
//	장바구니 선택 이동
	@RequestMapping(value = "/preparinsertcart.do")
	public String preparinsertcart(Model model, CartVO cvo) {
//		System.out.println("cvo: " + cvo);

		
		
		int[] cNoArrList = cvo.getC_noarr();
		// 각 선택된 c_no에 대해 cartService 호출
		if(cNoArrList!=null) {
		for (Integer c_no : cNoArrList) {
//			System.out.println("for문 c_no: " + c_no);
			cvo.setC_no(c_no);

			cartService.preparinsertcart(cvo);
		}
//		System.out.println("for문 통과: ");
//		// 모델에 데이터 추가
		model.addAttribute("paymentcartList", cartService.getpaymenttotalcartList(cvo));
		model.addAttribute("paymenttotal", cartService.carttotal(cvo));
		
		String url = "cart/cartPayment_page";
		return url;
		}else {
			String url = "redirect:cartList.do";
			return url;
		}
		
	}

//	장바구니 품목 전부 이동
	@RequestMapping("/preparallinsertcart.do")
	public String preparallinsertcart(@RequestParam String u_id, CartVO cvo, Model model, HttpSession session) {
		cvo.setU_id((String) session.getAttribute("userId"));
		if (cvo.getU_id() == null) {
        	
            return "login/login";
        }
		
		int[] cNoArrList = cvo.getC_noarr();
		if(cNoArrList!=null) {
		for (Integer c_no : cNoArrList) {
//			System.out.println("for문 c_no: " + c_no);
			cvo.setC_no(c_no);
			cartService.preparallinsertcart(cvo);
		}
//		System.out.println("allinsert cvo:"+cvo);

		cvo.setC_payment("preparation");
		model.addAttribute("paymentcartList", cartService.getpaymenttotalcartList(cvo));
		model.addAttribute("paymenttotal", cartService.carttotal(cvo));
		return "cart/cartPayment_page";
	}	else {
		String url = "redirect:cartList.do";
		return url;}
	}
//	결재화면 준비창 물품삭제 메소드
	@RequestMapping(value = "/deletpaycart.do", method = RequestMethod.POST)
	@ResponseBody
	public String deletpaycart(@RequestBody CartVO cvo, Model model, HttpSession session) {
	    // 세션에서 userId를 가져와 추가 검증
	
	    String sessionUserId = (String) session.getAttribute("userId");
	    if (!sessionUserId.equals(cvo.getU_id())) {
	        return "error"; // 세션의 userId와 일치하지 않는 경우
	    }

	    // cvo 객체에서 c_no, p_no, u_id 값을 사용하여 삭제 로직 처리
	    System.out.println("삭제 요청 - c_no: " + cvo.getC_no() + ", p_no: " + cvo.getP_no() + ", u_id: " + cvo.getU_id());
	    cartService.deletcart(cvo);

	    // 성공 메시지 반환
	    return "success";
	}
	
	

	// 결제 후 결제한 내역 받아오기
	@RequestMapping(value = "/preparcartList.do", method = RequestMethod.POST)
	public String pay(@RequestBody FormDatavVO fvo, OrderVO ovo, OrderListDetailVO odvo, CartVO cvo, RedirectAttributes redirectAttributes ,HttpSession session) throws JsonMappingException, JsonProcessingException {
		cvo.setU_id((String) session.getAttribute("userId"));
		if (cvo.getU_id() == null) {
        	
            return "login/login";
        }
		
		// PortOnePayRequestVO에서 주요 결제 정보를 가져와 OrderListVO에 설정
	    PortOnePayRequestVO pvo = fvo.getPvo();
	    System.out.println("pvo :" +pvo);

		
		// mydata를 통해 추가 데이터 설정
	    String mydata = (String) fvo.getMydata();
	    System.out.println("mydata:" + mydata);
	
	    if (pvo != null) {
	        ovo.setImp_uid(pvo.getImp_uid());
	        ovo.setMerchant_uid(pvo.getMerchant_uid());
	        ovo.setPaid_at(pvo.getPaid_at());
	        ovo.setO_pay_type(pvo.getPay_method());
	        ovo.setO_total_price(pvo.getPaid_amount());
	        ovo.setO_address(pvo.getBuyer_addr());
	        ovo.setO_receiver_contact(pvo.getBuyer_tel());
	        ovo.setO_receiver(pvo.getBuyer_name());
	        ovo.setO_status(pvo.getStatus());
	        ovo.setMerchant_uid(pvo.getMerchant_uid());
	        ovo.setImp_uid(pvo.getImp_uid());
	        ovo.setBuyer_email(pvo.getBuyer_email());
	    }else {
	    	return  "redirect:preparcartList.do";
	    }
	    
	    ObjectMapper mapper = new ObjectMapper();
	    List<ResponseVO3> list = Arrays.asList(mapper.readValue(mydata, ResponseVO3[].class));

	  
	    for (ResponseVO3 vo3 : list) {
	        Map<String, Object> dataMap = new HashMap<>();

	        switch (vo3.getName()) {
	            case "c_no":
	                if (vo3.getValue() instanceof String) {
	                    try {
	                        int c_no = Integer.parseInt((String) vo3.getValue());
	                        ovo.setC_no(c_no);
	                        dataMap.put("c_no", c_no);
	                    } catch (NumberFormatException e) {
	                        System.out.println("c_no 값을 Integer로 변환하는데 실패했습니다: " + vo3.getValue());
	                    }
	                }
	                break;

	            case "u_id":
	                if (vo3.getValue() instanceof String) {
	                    String u_id = (String) vo3.getValue();
	                    cvo.setU_id(u_id);
	                    ovo.setU_id(u_id);
	                    dataMap.put("u_id", u_id);
	                }
	                break;

	            case "p_no":
	                if (vo3.getValue() instanceof String) {
	                    try {
	                        int p_no = Integer.parseInt((String) vo3.getValue());
	                        ovo.setP_no(p_no);
	                        dataMap.put("p_no", p_no);
	                    } catch (NumberFormatException e) {
	                        System.out.println("p_no 값을 Integer로 변환하는데 실패했습니다: " + vo3.getValue());
	                    }
	                }
	                break;


	            case "p_price":
	                if (vo3.getValue() instanceof String) {
	                    try {
	                        int p_price = Integer.parseInt((String) vo3.getValue());
	                        ovo.setP_price(p_price);
	                        dataMap.put("p_price", p_price);
	                    } catch (NumberFormatException e) {
	                        System.out.println("p_total 값을 Integer로 변환하는데 실패했습니다: " + vo3.getValue());
	                    }
	                }
	                break;

	            case "p_name":
	                if (vo3.getValue() instanceof String) {
	                    String p_name = (String) vo3.getValue();
	                    ovo.setP_name(p_name);
	                    dataMap.put("p_name", p_name);
	                }
	                break;

	            case "p_img":
	                if (vo3.getValue() instanceof String) {
	                    String p_img = (String) vo3.getValue();
	                    ovo.setP_img(p_img);
	                    dataMap.put("p_img", p_img);
	                }
	                break;
	            case "p_count":
	            	if (vo3.getValue() instanceof String) {
	            		try {
	            			int p_count = Integer.parseInt((String) vo3.getValue());
	            			ovo.setP_count(p_count);
	            			dataMap.put("p_count", p_count);
	            		} catch (NumberFormatException e) {
	            			System.out.println("p_count 값을 Integer로 변환하는데 실패했습니다: " + vo3.getValue());
	            		}
	            	}
	            	break;
	        }  
	        System.out.println("dataMap: "+dataMap);
	        			if(dataMap.get("p_count") !=null) {
	        			  orderService.insertorderdetail(ovo); 
	        			  orderService.productstockdown(ovo); 
	        			  dataMap =null;
	        			}
	        
	        
	        
	    }
	    
	
	    
//	    System.out.println("ovo:" + ovo);

	    	//결제가 완료됬을경우
	    	if(pvo.getError_msg() ==null) {

	            cartService.paycomplete(cvo);
	            orderService.insertorderList(ovo);
	        
    }	
	    
	    
	    return "pay/payList";
	}



	@RequestMapping(value = "/payMenu.do", method = RequestMethod.GET)
	public String payMenu() {
		return "pay/payList";
	}

	// https://developers.portone.io/api/rest-v1/payment?v=v1 => 결제관련API
	// 결제내역 단건조회 API : get /payments/{imp_uid}
	@RequestMapping(value = "/payDetail", method = RequestMethod.POST)
	@ResponseBody
	public Object payDetail(@RequestParam(value = "imp_uid") String imp_uid) {
		System.out.println("결제내역 단건조회 API 시작");
		// 성공(ok) 실패(no)여부
		String url = hostname + "/payments/" + imp_uid;
		int code = -1;
		PortOnePayOneDetailVO vo = null;

		try {
			HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url))
					.headers("Content-Type", "application/json", "Authorization", "Bearer " + getTocken())
					.method("GET", HttpRequest.BodyPublishers.ofString("{}")).build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request,
					HttpResponse.BodyHandlers.ofString());
			String jsonString = response.body(); // 필요한 응답데이터
			// System.out.println("jsonString: "+jsonString);

			// String to JSON으로 변환하기 위한 작업
			// 참고 : https://www.baeldung.com/jackson-deserialize-json-unknown-properties
			ObjectMapper mapper = new ObjectMapper();
			ResponseVO rvo = mapper.readValue(jsonString, ResponseVO.class);
			// System.out.println(rvo.getResponse());

			code = rvo.getCode();
			// System.out.println("code: "+rvo.getCode());

			if (code > -1) {
				vo = mapper.convertValue(rvo.getResponse(), PortOnePayOneDetailVO.class);
				// System.out.println("vo: "+vo);
			}

		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}

		if (code > -1) {
			return vo;
		} else {
			return "no";
		}

	}

	// 결제내역 복수조회 API
	@RequestMapping("/paySelList")
	@ResponseBody
	public Object payList(FormDatavVO vo) {
		System.out.println("결제내역 복수조회 API");

		String url = hostname + "/payments";
		String impUidArrStr = "";
		String merchantUidArrStr = "";
		String[] impUidArr = vo.getImpUidArr();
		String[] merchantUidArr = vo.getMerchantUidArr();
		String queryString = "";
		int code = -1;

		if (impUidArr != null) {
			url += "?";
			for (int i = 0; i < impUidArr.length; i++) {
				if (i == impUidArr.length - 1)
					impUidArrStr += "imp_uid[]=" + impUidArr[i];
				else
					impUidArrStr += impUidArrStr += "imp_uid[]=" + impUidArr[i] + "&";
			}
		}

		if (impUidArr != null && merchantUidArr != null)
			impUidArrStr += "&";

		if (merchantUidArr != null) {
			if (impUidArr == null)
				url += "?";
			for (int i = 0; i < merchantUidArr.length; i++) {
				if (i == merchantUidArr.length - 1)
					merchantUidArrStr += "merchant_uid[]=" + merchantUidArr[i];
				else
					merchantUidArrStr += "merchant_uid[]=" + merchantUidArr[i] + "&";
			}
		}
		queryString = impUidArrStr + merchantUidArrStr;
		System.out.println("url: " + url + queryString);

		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url + queryString))
				.headers("Content-Type", "application/json", "Authorization", "Bearer " + getTocken())
				.method("GET", HttpRequest.BodyPublishers.ofString("")).build();

		ArrayList<Object> arr = null;
		try {
			HttpResponse<String> response = HttpClient.newHttpClient().send(request,
					HttpResponse.BodyHandlers.ofString());
			String jsonString = response.body();

			ObjectMapper mapper = new ObjectMapper();
			ResponseVO2 rvo = mapper.readValue(jsonString, ResponseVO2.class);
			// System.out.println("rvo.getResponse(): "+rvo.getResponse());
			code = rvo.getCode();
			if (code > -1) {
				arr = rvo.getResponse();
				// System.out.println("arr: "+arr);

				for (Object obj : arr) {
					PaymentAnnotationVO pvo = mapper.convertValue(obj, PaymentAnnotationVO.class);
					System.out.println("pvo: " + pvo);

				}
			}

		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (code > -1)
			return arr;
		else
			return "no";
	}

	// 결제취소 API
	@RequestMapping("/payCancel")
	@ResponseBody
	public int payCancel(PortOnePayOneDetailVO vo ,OrderVO ovo) {
		int code = -1;
		String url = hostname + "/payments/cancel";
		String query ="{\"merchant_uid\" : \"" + vo.getMerchant_uid() + "\"}";
		System.out.println("query: "+query);

		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url)).headers("Content-Type", "application/json", "Authorization", "Bearer " + getTocken()).method("POST", HttpRequest.BodyPublishers.ofString(query)).build();

		try {
			HttpResponse<String> response = HttpClient.newHttpClient().send(request,
					HttpResponse.BodyHandlers.ofString());
			String jsonString = response.body(); // 필요한 응답데이터
			System.out.println("jsonString: " + jsonString);

			// String to JSON으로 변환하기 위한 작업
			// 참고 : https://www.baeldung.com/jackson-deserialize-json-unknown-properties
			ObjectMapper mapper = new ObjectMapper();
			ResponseVO rvo = mapper.readValue(jsonString, ResponseVO.class);
			 System.out.println(rvo.getMessage());

			code = rvo.getCode();
			// System.out.println("code: "+rvo.getCode());

			if (code > -1) {
				vo = mapper.convertValue(rvo.getResponse(), PortOnePayOneDetailVO.class);
				orderService.paycancel(ovo);
				// System.out.println("vo: "+vo);
				code = 0;
			}

		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}

		return code;
	}

	
	//주문 목록 어드민 리스트
	@RequestMapping("/adminorderList.do")
	public String adminorderList(@RequestParam(value="nowPage", required = false) String nowPage,PagingVO pv,
			OrderVO ovo ,Model model) {
//		public String adminorderList(@RequestParam String u_id , OrderVO ovo , Model model , HttpSession session) {
//		if(session.getAttribute("userId")=="admin") {
//			return "";
//		}
		String cntPerPage = "20";
		if (ovo.getSearchCondition() == null) {
			ovo.setSearchCondition("ID");
			
		}
		else {
			ovo.setSearchCondition(ovo.getSearchCondition());
		}
		if (ovo.getSearchKeyword() == null)
			ovo.setSearchKeyword("");
		else
			ovo.setSearchKeyword(ovo.getSearchKeyword());

		int total = orderService.countorderlist(ovo); 
		if (nowPage == null) {
			nowPage = "1"; 
		}
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		System.out.println("pagingVO: "+pv);
		ovo.setStart(pv.getStart());
		ovo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("adminlist",orderService.adminorderList(ovo));
		model.addAttribute("searchCondition", ovo.getSearchCondition());
		model.addAttribute("searchKeyword", ovo.getSearchKeyword());
		
		
		
		
		return "cart/cartadminlist";
	}
	
	
	
	
	
	
}
