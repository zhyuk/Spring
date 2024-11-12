package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.CommunityDAO;
import com.spring.mom.svc.CommunityService;
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
//		System.out.println("SVC 탐");
		return communityDAO.likeYooka(vo);
	}
	@Override
	public int likeNoriter(Community_noriterVO vo) {
//		System.out.println("SVC 탐");
		return communityDAO.likeNoriter(vo);
	}
	@Override
	public int likeShopping(Community_shoppingVO vo) {
//		System.out.println("SVC 탐");
		return communityDAO.likeShopping(vo);
	}
	
	//싫어요
	@Override
	public int hateYooka(Community_yookaVO vo) {
//		System.out.println("SVC 탐");
		return communityDAO.hateYooka(vo);
	}
	@Override
	public int hateNoriter(Community_noriterVO vo) {
//		System.out.println("SVC 탐");
		return communityDAO.hateNoriter(vo);
	}
	@Override
	public int hateShopping(Community_shoppingVO vo) {
//		System.out.println("SVC 탐");
		return communityDAO.hateShopping(vo);
	}
	
	//좋아요 갯수 조회
	@Override
	public int getLikeYooka(Updown_YookaVO vo) {
		System.out.println("SVC getLikeYooka : " + vo);
		return communityDAO.getLikeYooka(vo);
	}
	@Override
	public int getLikeNoriter(Updown_NoriterVO vo) {
//		System.out.println("SVC getLikeYooka");
		return communityDAO.getLikeNoriter(vo);
	}
	@Override
	public int getLikeShopping(Updown_ShoppingVO vo) {
//		System.out.println("SVC getLikeYooka");
		return communityDAO.getLikeShopping(vo);
	}
	
	//싫어요 갯수 조회
	@Override
	public int getHateYooka(Updown_YookaVO vo) {
//		System.out.println("SVC getHateYooka");
		return communityDAO.getHateYooka(vo);
	}
	@Override
	public int getHateNoriter(Updown_NoriterVO vo) {
//		System.out.println("SVC getHateYooka");
		return communityDAO.getHateNoriter(vo);
	}
	@Override
	public int getHateShopping(Updown_ShoppingVO vo) {
//		System.out.println("SVC getHateYooka");
		return communityDAO.getHateShopping(vo);
	}

	//좋아요 싫어요 정보 저장
	@Override
	public int insertUpDownYooka(Updown_YookaVO vo) {
//		System.out.println("SVC insertUpDown 탔음");
		return communityDAO.insertUpDownYooka(vo);
	}
	@Override
	public int insertUpDownNoriter(Updown_NoriterVO vo) {
//		System.out.println("SVC insertUpDown 탔음");
		return communityDAO.insertUpDownNoriter(vo);
	}
	@Override
	public int insertUpDownShopping(Updown_ShoppingVO vo) {
//		System.out.println("SVC insertUpDown 탔음");
		return communityDAO.insertUpDownShopping(vo);
	}

	@Override
	public List<Community_yookaVO> getYookaAdmin(Community_yookaVO vo) {
		System.out.println("getYookaAdmin svc 입장");
		return communityDAO.getYookaAdmin(vo);
	}

	@Override
	public int updateYookaAdmin(Community_yookaVO vo) {
		System.out.println("updateYookaAdmin svc 입장");
		return communityDAO.updateYookaAdmin(vo);
	}

	@Override
	public int deleteYookaAdmin(Community_yookaVO vo) {
		System.out.println("deleteYookaAdmin svc 입장");
		return communityDAO.deleteYookaAdmin(vo);
	}
	
}

