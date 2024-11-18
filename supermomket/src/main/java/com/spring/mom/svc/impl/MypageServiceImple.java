package com.spring.mom.svc.impl;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.mom.dao.MypageDAO;
import com.spring.mom.svc.MypageService;
import com.spring.mom.vo.OrderVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.UserVO;

@Service("MypageService")
public class MypageServiceImple implements MypageService{
	
	@Autowired
	private MypageDAO mpDAO;
		
	
	// 관리자 메뉴
	// 사용자 목록 조회
    @Override
    public List<UserVO> getUsersPg(int offset, int limit) {
        return mpDAO.getUsersPg(offset, limit);
    }

    @Override
    public int getTotalUserCnt() {
        return mpDAO.getTotalUserCnt();
    }

    @Override
    public List<UserVO> searchUsers(String searchType, String searchKeyword, int offset, int limit) {
        return mpDAO.searchUsers(searchType, searchKeyword, offset, limit);
    }

    @Override
    public int getSearchUserCount(String searchType, String searchKeyword) {
        return mpDAO.getSearchUserCount(searchType, searchKeyword);
    }
    
    
    
	
	// 사용자 정보 수정(관리자)
	@Override
	public void selUser(UserVO uvo) {
		mpDAO.selUser(uvo);
	};
	
	// 사용자 삭제(관리자)
	@Override
	public void delUser(UserVO uvo) {
		mpDAO.delUser(uvo);
	};
	
	// 비밀번호 확인(관리자)
	@Override
	public UserVO updateAdminChk(UserVO uvo) {
		return mpDAO.updateAdminChk(uvo);
	};
	
	// 비밀번호 변경 상세페이지(관리자)
	@Override
	public UserVO updateAdminDetail(UserVO uvo) {
		return mpDAO.updateAdminDetail(uvo.getU_id());
	}
	
	@Override
	public boolean authenticateUser(String u_id, String password) {
	    UserVO uvo = mpDAO.updateAdminDetail(u_id);
	    
	    if (uvo == null) {
	        return false;
	    }

	    return BCrypt.checkpw(password, uvo.getU_pw());
	}

	// 새 비밀번호로 업데이트(관리자)
	@Override
	public void setNewAdminPw(UserVO uvo) {

		String hashedPassword = BCrypt.hashpw(uvo.getU_pw(), BCrypt.gensalt());
	    uvo.setU_pw(hashedPassword);
	    
	    mpDAO.setNewAdminPw(uvo);
	}
	
	
	
	
	
	
	// 사용자 메뉴
	// 주문목록 조회(사용자)
	@Override
	public List<OrderVO> getBuyList(OrderVO ovo){
		return mpDAO.getBuyList(ovo);
	};
	

	// 주문목록 상세조회(사용자)
	@Override
	public List<OrderVO> getBuyListDetail(OrderVO ovo) {
		return mpDAO.getBuyListDetail(ovo);
	};
	
	// 리뷰 쓰러 가기(사용자)
	public OrderVO goWriteRv(OrderVO ovo) {
		return mpDAO.goWriteRv(ovo);
	};
//	// 찜한 상품 조회(사용자)
//	@Override
//	public List<ProductVO> getZzimList(ProductVO pvo){
//		return mpDAO.getZzimList(pvo);
//	};
	
	// 마이페이지 현재 비밀번호 조회(사용자)
	@Override
	public UserVO updateMypageChk(UserVO uvo) {
		return mpDAO.updateMypageChk(uvo);
	};
	
	// 마이페이지 정보 수정(사용자)
	@Override
	public UserVO updateMypageDetail(UserVO uvo) {
		return mpDAO.updateMypageDetail(uvo);
	};
	
	// 마이페이지 정보 수정 - 닉네임 중복 쳌(사용자)
	@Override
	public int nickCheck(String u_nickname) {
//		System.out.println("요기야요기impl : " + u_nickname);
		return mpDAO.nickCheck(u_nickname);
	}
	
	// 마이페이지 새 정보 업데이트(사용자)
	@Override
	public void setNewMypage(UserVO uvo) {
		mpDAO.setNewMypage(uvo);
	};
	
	// 비밀번호 수정 재확인(사용자)
	@Override
	public UserVO updatePasswordChk(UserVO uvo) {
		return mpDAO.updatePasswordChk(uvo);
	}
	
	//  비밀번호 상세(사용자)
	@Override
	public UserVO updatePasswordDetail(UserVO uvo) {
		return mpDAO.updatePasswordDetail(uvo);
	}

	// 새 비밀번호로 업데이트(사용자)
	@Override
	public void setNewPassword(UserVO uvo) {
		mpDAO.setNewPassword(uvo);
	}
	
	// 회원탈퇴(사용자)
	@Override
	public void taltaeUser(UserVO uvo) {
		mpDAO.taltaeUser(uvo);
	}






}
