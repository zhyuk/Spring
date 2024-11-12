package com.spring.mom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.OrderVO;
import com.spring.mom.vo.ProductVO;
import com.spring.mom.vo.UserVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 관리자 메뉴
	// 사용자 목록 조회(관리자)
    public List<UserVO> getUsersPg(int offset, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        return mybatis.selectList("MypageDAO.getUsersPg", params);
    }

    public int getTotalUserCnt() {
        return mybatis.selectOne("MypageDAO.getTotalUserCnt");
    }

    public List<UserVO> searchUsers(String searchType, String searchKeyword, int offset, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchType", searchType);
        params.put("searchKeyword", "%" + searchKeyword + "%");
        params.put("offset", offset);
        params.put("limit", limit);
        return mybatis.selectList("MypageDAO.searchUsers", params);
    }

    public int getSearchUserCount(String searchType, String searchKeyword) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchType", searchType);
        params.put("searchKeyword", "%" + searchKeyword + "%");
        return mybatis.selectOne("MypageDAO.getSearchUserCount", params);
    }
	
    
    
    
	// 사용자 정보 수정(관리자)
	public void selUser(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis selUser");
		mybatis.update("MypageDAO.selUser", uvo);
	}
	
	// 사용자 삭제(관리자)
	public void delUser(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis delUser");
		mybatis.update("MypageDAO.delUser", uvo);
	}
	
	// 현재 비밀번호 체크(관리자)
	public UserVO updateAdminChk(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis updateAdminChk");
		return mybatis.selectOne("MypageDAO.updateAdminChk", uvo);
	} 
	
	// 비밀번호 변경 상세페이지(관리자)
	public UserVO updateAdminDetail(String u_id) {
		System.out.println("===>MypageDAO : mybatis updateAdminDetail");
		return mybatis.selectOne("MypageDAO.updateAdminDetail", u_id);
	}
	
	// 새 비밀번호로 업데이트(관리자)
	public void setNewAdminPw(UserVO uvo) {
	    System.out.println("===>MypageDAO : mybatis setNewAdminPw");
	    mybatis.update("MypageDAO.setNewAdminPw", uvo); // 
	}
	
	
	
	
	
	
	
	
	
	// 사용자 메뉴
	// 주문목록 조회
	public List<OrderVO> getBuyList(OrderVO olvo) {
		System.out.println("===>MypageDAO : mybatis getBuyList");
		return mybatis.selectList("MypageDAO.getBuyList", olvo);
	}
	
	// 주문목록 상세조회
	public List<OrderVO> getBuyListDetail(OrderVO olvo) {
		System.out.println("===>MypageDAO : mybatis getBuyListDetail");
		return mybatis.selectList("MypageDAO.getBuyListDetail", olvo);
	}
	
	// 찜한 상품 조회
	public List<ProductVO> getZzimList(ProductVO pvo){
		System.out.println("===>MypageDAO : mybatis getZzimList");
		return mybatis.selectList("MypageDAO.getZzimList", pvo);
	}
	
	// 마이페이지 비밀번호 확인(사용자)
	public UserVO updateMypageChk(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis updateMypageChk");
		return mybatis.selectOne("MypageDAO.updateMypageChk", uvo);
	}
	
	// 마이페이지 정보 수정(사용자)
	public UserVO updateMypageDetail(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis updateMypageDetail");
		return mybatis.selectOne("MypageDAO.updateMypageDetail", uvo);
	}
	
	// 마이페이지 새 정보 업데이트(사용자)
	public void setNewMypage(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis setNewMypage");
		mybatis.update("MypageDAO.setNewMypage", uvo);
	}
//	
//	// 마이페이지 회원 탈퇴(사용자)
////	public void deleteUser(UserVO uvo) {
////		System.out.println("===>MypageDAO : mybatis updateMypage");
////		mybatis.update("MypageDAO.deleteUser", uvo);
////	}
//
	// 비밀번호 수정 조회(사용자)
	public UserVO updatePasswordChk(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis updatePasswordChk");
		return mybatis.selectOne("MypageDAO.updatePasswordChk", uvo);
	}
	
	// 비밀번호 수정 상세(사용자)
	public UserVO updatePasswordDetail(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis updatePasswordDetail");
		return mybatis.selectOne("MypageDAO.updatePasswordDetail", uvo);
	}
	
	// 새 비밀번호로 업데이트(사용자)
	public void setNewPassword(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis setNewPassword");
		mybatis.update("MypageDAO.setNewPassword", uvo);
	}

	public void taltaeUser(UserVO uvo) {
		System.out.println("===>MypageDAO : mybatis taltaeUser");
		mybatis.update("MypageDAO.taltaeUser", uvo);
	}









}
