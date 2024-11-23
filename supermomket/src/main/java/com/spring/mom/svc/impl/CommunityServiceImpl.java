package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.CommunityDAO;
import com.spring.mom.svc.CommunityService;
import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;
import com.spring.mom.vo.Community_noriterVO;
import com.spring.mom.vo.Community_shoppingVO;
import com.spring.mom.vo.Community_yookaVO;
import com.spring.mom.vo.Updown_NoriterVO;
import com.spring.mom.vo.Updown_ShoppingVO;
import com.spring.mom.vo.Updown_YookaVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	// 글 목록
	@Override
	public List<Community_yookaVO> getYookaList(Community_yookaVO vo) {
		return communityDAO.getYookaList(vo);
	}

	@Override
	public List<Community_noriterVO> getNoriterList(Community_noriterVO vo) {
		return communityDAO.getNoriterList(vo);
	}

	@Override
	public List<Community_shoppingVO> getShoppingList(Community_shoppingVO vo) {
		return communityDAO.getShoppingList(vo);
	}
	
	// 전체 글 수
	@Override
	public int countYooka(Community_yookaVO vo) {
		return communityDAO.countYooka(vo);
	}

	@Override
	public int countNoriter(Community_noriterVO vo) {
		return communityDAO.countNoriter(vo);
	}

	@Override
	public int countShopping(Community_shoppingVO vo) {
		return communityDAO.countShopping(vo);
	}

	// 글 상세조회
	@Override
	public Community_yookaVO getYooka(Community_yookaVO vo) {
		return communityDAO.getYooka(vo);
	}

	@Override
	public Community_noriterVO getNoriter(Community_noriterVO vo) {
		return communityDAO.getNoriter(vo);
	}

	@Override
	public Community_shoppingVO getShopping(Community_shoppingVO vo) {
		return communityDAO.getShopping(vo);
	}

	// 조회수
	@Override
	public void updateCntYooka(Community_yookaVO vo) {
		communityDAO.updateCntYooka(vo);
	}

	@Override
	public void updateCntNoriter(Community_noriterVO vo) {
		communityDAO.updateCntNoriter(vo);
	}

	@Override
	public void updateCntShopping(Community_shoppingVO vo) {
		System.out.println("조회수 : " + vo);
		communityDAO.updateCntShopping(vo);
	}
	
	// 글등록
	@Override
	public void insertYooka(Community_yookaVO vo) {
		communityDAO.insertYooka(vo);
	}

	@Override
	public void insertNoriter(Community_noriterVO vo) {
		communityDAO.insertNoriter(vo);

	}
	
	@Override
	public void insertShopping(Community_shoppingVO vo) {
		communityDAO.insertShopping(vo);

	}
	
	// 글수정
	@Override
	public void updateYooka(Community_yookaVO vo) {
		communityDAO.updateYooka(vo);

	}

	@Override
	public void updateNoriter(Community_noriterVO vo) {
		communityDAO.updateNoriter(vo);
	}

	@Override
	public void updateShopping(Community_shoppingVO vo) {
		communityDAO.updateShopping(vo);
	}

	// 글삭제
	@Override
	public void deleteYooka(Community_yookaVO vo) {
		communityDAO.deleteYooka(vo);

	}

	@Override
	public void deleteNoriter(Community_noriterVO vo) {
		communityDAO.deleteNoriter(vo);

	}

	@Override
	public void deleteShopping(Community_shoppingVO vo) {
		communityDAO.deleteShopping(vo);

	}
	
	//좋아요
	@Override
	public int likeYooka(Community_yookaVO vo) {
		return communityDAO.likeYooka(vo);
	}
	@Override
	public int likeNoriter(Community_noriterVO vo) {
		return communityDAO.likeNoriter(vo);
	}
	@Override
	public int likeShopping(Community_shoppingVO vo) {
		return communityDAO.likeShopping(vo);
	}
	
	//싫어요
	@Override
	public int hateYooka(Community_yookaVO vo) {
		return communityDAO.hateYooka(vo);
	}
	@Override
	public int hateNoriter(Community_noriterVO vo) {
		return communityDAO.hateNoriter(vo);
	}
	@Override
	public int hateShopping(Community_shoppingVO vo) {
		return communityDAO.hateShopping(vo);
	}
	
	//좋아요 갯수 조회
	@Override
	public int getLikeYooka(Updown_YookaVO vo) {
		return communityDAO.getLikeYooka(vo);
	}
	@Override
	public int getLikeNoriter(Updown_NoriterVO vo) {
		return communityDAO.getLikeNoriter(vo);
	}
	@Override
	public int getLikeShopping(Updown_ShoppingVO vo) {
		return communityDAO.getLikeShopping(vo);
	}
	
	//싫어요 갯수 조회
	@Override
	public int getHateYooka(Updown_YookaVO vo) {
		return communityDAO.getHateYooka(vo);
	}
	@Override
	public int getHateNoriter(Updown_NoriterVO vo) {
		return communityDAO.getHateNoriter(vo);
	}
	@Override
	public int getHateShopping(Updown_ShoppingVO vo) {
		return communityDAO.getHateShopping(vo);
	}

	//좋아요 싫어요 정보 저장
	@Override
	public int insertUpDownYooka(Updown_YookaVO vo) {
		return communityDAO.insertUpDownYooka(vo);
	}
	@Override
	public int insertUpDownNoriter(Updown_NoriterVO vo) {
		return communityDAO.insertUpDownNoriter(vo);
	}
	@Override
	public int insertUpDownShopping(Updown_ShoppingVO vo) {
		return communityDAO.insertUpDownShopping(vo);
	}

	//관리자 목록 리스트
	@Override
	public List<Community_yookaVO> getYookaAdmin(Community_yookaVO vo) {
		System.out.println("getYookaAdmin svc 입장");
		return communityDAO.getYookaAdmin(vo);
	}
	@Override
	public List<Community_noriterVO> getNoriterAdmin(Community_noriterVO vo) {
		System.out.println("getNoriterAdmin svc 입장");
		return communityDAO.getNoriterAdmin(vo);
	}
	@Override
	public List<Community_shoppingVO> getShoppingAdmin(Community_shoppingVO vo) {
		System.out.println("getShoppingAdmin svc 입장");
		return communityDAO.getShoppingAdmin(vo);
	}
	
	//관리자 댓글 리스트
	@Override
	public List<Comment_yookaVO> getYookaAdminCom(Comment_yookaVO vo) {
		return communityDAO.getYookaAdminCom(vo);
	}
	@Override
	public List<Comment_noriterVO> getNoriterAdminCom(Comment_noriterVO vo) {
		return communityDAO.getNoriterAdminCom(vo);
	}
	@Override
	public List<Comment_shoppingVO> getShoppingAdminCom(Comment_shoppingVO vo) {
		return communityDAO.getShoppingAdminCom(vo);
	}
	@Override
	public List<Comment_yookaVO> getYookaAdminCmno(Comment_yookaVO vo) {
		System.out.println("service : " + vo);
		return communityDAO.getYookaAdminCmno(vo);
	}
	@Override
	public List<Comment_noriterVO> getNoriterAdminCmno(Comment_noriterVO vo) {
		System.out.println("service : " + vo);
		return communityDAO.getNoriterAdminCmno(vo);
	}
	@Override
	public List<Comment_shoppingVO> getShoppingAdminCmno(Comment_shoppingVO vo) {
		System.out.println("service : " + vo);
		return communityDAO.getShoppingAdminCmno(vo);
	}
	
	//관리자 글 수정
	@Override
	public int updateYookaAdmin(Community_yookaVO vo) {
		System.out.println("updateYookaAdmin svc 입장");
		return communityDAO.updateYookaAdmin(vo);
	}
	@Override
	public int updateNoriterAdmin(Community_noriterVO vo) {
		System.out.println("updateNoriterAdmin svc 입장");
		return communityDAO.updateNoriterAdmin(vo);
	}
	@Override
	public int updateShoppingAdmin(Community_shoppingVO vo) {
		System.out.println("updateShoppingAdmin svc 입장");
		return communityDAO.updateShoppingAdmin(vo);
	}

	//관리자 글 삭제
	@Override
	public int deleteYookaAdmin(Community_yookaVO vo) {
		System.out.println("deleteYookaAdmin svc 입장");
		return communityDAO.deleteYookaAdmin(vo);
	}
	@Override
	public int deleteNoriterAdmin(Community_noriterVO vo) {
		System.out.println("deleteNoriterAdmin svc 입장");
		return communityDAO.deleteNoriterAdmin(vo);
	}
	@Override
	public int deleteShoppingAdmin(Community_shoppingVO vo) {
		System.out.println("deleteShoppingAdmin svc 입장");
		return communityDAO.deleteShoppingAdmin(vo);
	}
	
	//관리자 댓글 삭제
	@Override
	public int deleteYookaComDel(Comment_yookaVO vo) {
		System.out.println("deleteYookaComDel svc 입장");
		return communityDAO.deleteYookaComDel(vo);
	}
	@Override
	public int deleteNoriterComDel(Comment_noriterVO vo) {
		System.out.println("deleteNoriterComDel svc 입장");
		return communityDAO.deleteNoriterComDel(vo);
	}
	@Override
	public int deleteShoppingComDel(Comment_shoppingVO vo) {
		System.out.println("deleteShoppingComDel svc 입장");
		return communityDAO.deleteShoppingComDel(vo);
	}

	
	
}

