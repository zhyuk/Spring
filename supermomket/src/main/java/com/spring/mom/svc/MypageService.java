package com.spring.mom.svc;

import java.util.List;

import org.springframework.ui.Model;

import com.spring.mom.vo.OrderVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.UserVO;

public interface MypageService {
	
		// 관리자 메뉴 
    	// 페이징 처리된 사용자 목록 조회
	    List<UserVO> getUsersPg(int offset, int limit);
	
	    // 전체 사용자 수 조회
	    int getTotalUserCnt();
	
	    // 검색 조건을 사용하여 사용자 목록 조회
	    List<UserVO> searchUsers(String searchType, String searchKeyword, int offset, int limit);
	
	    // 검색 조건에 따른 사용자 수 조회
	    int getSearchUserCount(String searchType, String searchKeyword);
		
	    
	    
		// 사용자 정보 수정(관리자)
		public void selUser(UserVO uvo);
		
		// 사용자 삭제(관리자)
		public void delUser(UserVO uvo);
		
		// 현재 비밀번호 조회(관리자)
		public UserVO updateAdminChk(UserVO uvo);
		
		// 비밀번호 수정 상세(관리자)
		public UserVO updateAdminDetail(UserVO uvo);
		
		// 비밀번호 암호화
		boolean authenticateUser(String u_id, String password);
		
		// 새 비밀번호로 업데이트(관리자)
		public void setNewAdminPw(UserVO uvo);
		

		
		
		
		
		
		// 사용자 메뉴
		// 주문목록 조회(사용자)
		public List<OrderVO> getBuyList(OrderVO ovo);
		
		// 주문목록 상세조회(사용자)
		public List<OrderVO> getBuyListDetail(OrderVO ovo);
		
		// 리뷰쓰러 가기(사용자)
		public OrderVO goWriteRv(OrderVO ovo);
		
//		// 찜한 상품 조회(사용자)
//		public List<ProductVO> getZzimList(ProductVO pvo);
		
		// 마이페이지 비밀번호 수정 재확인(사용자)
		public UserVO updateMypageChk(UserVO uvo);
		
		// 마이페이지 정보 수정(사용자)
		public UserVO updateMypageDetail(UserVO uvo);
		
		// 마이페이지 정보 수정 - 닉네임 중복 쳌(사용자)
		public int nickCheck(String u_nickname);
		
		// 마이페이지 새 정보 업데이트(사용자)
		public void setNewMypage(UserVO uvo);
		
		// 비밀번호 수정 재확인(사용자)
		public UserVO updatePasswordChk(UserVO uvo);
		
		// 비밀번호 수정 상세(사용자)
		public UserVO updatePasswordDetail(UserVO uvo);
		
		// 새 비밀번호로 업데이트(사용자)
		public void setNewPassword(UserVO uvo);

		// 회원탈퇴(사용자)
		public void taltaeUser(UserVO uvo);




		

		
		

}