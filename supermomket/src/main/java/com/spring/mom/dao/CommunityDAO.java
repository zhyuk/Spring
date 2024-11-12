package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.Community_noriterVO;
import com.spring.mom.vo.Community_shoppingVO;
import com.spring.mom.vo.Community_yookaVO;
import com.spring.mom.vo.Updown_NoriterVO;
import com.spring.mom.vo.Updown_ShoppingVO;
import com.spring.mom.vo.Updown_YookaVO;

@Repository
public class CommunityDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 글등록
	public void insertYooka(Community_yookaVO vo) {
//		System.out.println("insertyooka 등록 vo :" + vo);

		mybatis.insert("CommunityDAO.insertYooka", vo);
	}

	public void insertNoriter(Community_noriterVO nvo) {
		System.out.println("insertNoriter 등록 vo :" + nvo);

		mybatis.insert("CommunityDAO.insertNoriter", nvo);
	}

	public void insertShopping(Community_shoppingVO svo) {
//		System.out.println("insertShopping 등록 vo :" + svo);

		mybatis.insert("CommunityDAO.insertShopping", svo);
	}

	// 글수정
	public void updateYooka(Community_yookaVO vo) {
//		System.out.println("updateyooka 실행");
		mybatis.update("CommunityDAO.updateYooka", vo);
	}

	public void updateNoriter(Community_noriterVO vo) {
//		System.out.println("updateNoriter 실행");
		mybatis.update("CommunityDAO.updateNoriter", vo);
	}

	public void updateShopping(Community_shoppingVO vo) {
//		System.out.println("updateShopping 실행");
		mybatis.update("CommunityDAO.updateShopping", vo);
	}

	// 글삭제
	public void deleteYooka(Community_yookaVO vo) {
//		System.out.println("deleteyooka 실행");
		mybatis.delete("CommunityDAO.deleteYooka", vo);
	}

	public void deleteNoriter(Community_noriterVO vo) {
//		System.out.println("deleteNoriter 실행");
		mybatis.delete("CommunityDAO.deleteNoriter", vo);
	}

	public void deleteShopping(Community_shoppingVO vo) {
//		System.out.println("deleteShopping 실행");
		mybatis.delete("CommunityDAO.deleteShopping", vo);
	}

	// 글상세
	public Community_yookaVO getYooka(Community_yookaVO vo) {
//		System.out.println("yooka 상세페이지");
		return (Community_yookaVO) mybatis.selectOne("CommunityDAO.getYooka", vo);
	}

	public Community_noriterVO getNoriter(Community_noriterVO vo) {
//		System.out.println("noriter 상세페이지");
		return (Community_noriterVO) mybatis.selectOne("CommunityDAO.getNoriter", vo);
	}

	public Community_shoppingVO getShopping(Community_shoppingVO vo) {
//		System.out.println("shopping 상세페이지");
		return (Community_shoppingVO) mybatis.selectOne("CommunityDAO.getShopping", vo);
	}

	// 글목록
	public List<Community_yookaVO> getYookaList(Community_yookaVO vo) {
//		System.out.println("yookaList 목록실행");
		return mybatis.selectList("CommunityDAO.getYookaList", vo);
	}

	public List<Community_noriterVO> getNoriterList(Community_noriterVO vo) {
//		System.out.println("NoriterList 목록실행");
		return mybatis.selectList("CommunityDAO.getNoriterList", vo);
	}

	public List<Community_shoppingVO> getShoppingList(Community_shoppingVO vo) {
//		System.out.println("shoppingList 목록실행");
		return mybatis.selectList("CommunityDAO.getShoppingList", vo);
	}

	// 전체페이지수
	public int countYooka(Community_yookaVO vo) {
//		System.out.println("countYooka 실행");
		return mybatis.selectOne("CommunityDAO.countYooka", vo);
	}

	public int countNoriter(Community_noriterVO vo) {
//		System.out.println("countNoriter 실행");
		return mybatis.selectOne("CommunityDAO.countNoriter", vo);
	}

	public int countShopping(Community_shoppingVO vo) {
//		System.out.println("countShopping 실행");
		return mybatis.selectOne("CommunityDAO.countShopping", vo);
	}

	// 조회수
	public void updateCntYooka(Community_yookaVO vo) {
		System.out.println("Yooka조회수 측정");
		mybatis.update("CommunityDAO.updateCntYooka", vo);
	}

	public void updateCntNoriter(Community_noriterVO vo) {
//		System.out.println("Noriter조회수 측정");
		mybatis.update("CommunityDAO.updateCntNoriter", vo);
	}

	public void updateCntShopping(Community_shoppingVO vo) {
//		System.out.println("Shopping조회수 측정");
		mybatis.update("CommunityDAO.updateCntShopping", vo);
	}

	// 추천
	public int likeYooka(Community_yookaVO vo) {
//		System.out.println("DAO 탐");
		return mybatis.update("CommunityDAO.likeYooka", vo);
	}

	public int likeNoriter(Community_noriterVO vo) {
//		System.out.println("DAO 탐");
		return mybatis.update("CommunityDAO.likeNoriter", vo);
	}

	public int likeShopping(Community_shoppingVO vo) {
//		System.out.println("DAO 탐");
		return mybatis.update("CommunityDAO.likeNoriter", vo);
	}

	// 비추천
	public int hateYooka(Community_yookaVO vo) {
//		System.out.println("DAO 탐");
		return mybatis.update("CommunityDAO.hateYooka", vo);
	}

	public int hateNoriter(Community_noriterVO vo) {
//		System.out.println("DAO 탐");
		return mybatis.update("CommunityDAO.hateNoriter", vo);
	}

	public int hateShopping(Community_shoppingVO vo) {
//		System.out.println("DAO 탐");
		return mybatis.update("CommunityDAO.hateShopping", vo);
	}

	// 추천 갯수
	public int getLikeYooka(Updown_YookaVO vo) {
		System.out.println("DAO getLikeYooka()" + vo);
		return mybatis.selectOne("CommunityDAO.getLikeYooka", vo);
	}

	public int getLikeNoriter(Updown_NoriterVO vo) {
//		System.out.println("DAO getLikeNoriter()");
		return mybatis.selectOne("CommunityDAO.getLikeNoriter", vo);
	}

	public int getLikeShopping(Updown_ShoppingVO vo) {
//		System.out.println("DAO getLikeShopping()");
		return mybatis.selectOne("CommunityDAO.getLikeShopping", vo);
	}

	// 비추천 갯수
	public int getHateYooka(Updown_YookaVO vo) {
//		System.out.println("DAO getHateYooka()");
		return mybatis.selectOne("CommunityDAO.getHateYooka", vo);
	}
	public int getHateNoriter(Updown_NoriterVO vo) {
//		System.out.println("DAO getHateNoriter()");
		return mybatis.selectOne("CommunityDAO.getHateNoriter", vo);
	}
	public int getHateShopping(Updown_ShoppingVO vo) {
//		System.out.println("DAO getHateShopping()");
		return mybatis.selectOne("CommunityDAO.getHateShopping", vo);
	}

	// 추천 비추천 저장
	public int insertUpDownYooka(Updown_YookaVO vo) {
//		System.out.println("추천 비추천 저장 탔음");
		if (mybatis.selectOne("CommunityDAO.getUpDownYooka", vo) == null) {
//			System.out.println("둘다 안찍음");
			return mybatis.insert("CommunityDAO.insertUpDownYooka", vo);
		} else {
//			System.out.println("수정 탔음");
			return mybatis.update("CommunityDAO.updateUpDownYooka", vo);
		}
	}
	public int insertUpDownNoriter(Updown_NoriterVO vo) {
//		System.out.println("추천 비추천 저장 탔음");
		if (mybatis.selectOne("CommunityDAO.getUpDownNoriter", vo) == null) {
//			System.out.println("둘다 안찍음");
			return mybatis.insert("CommunityDAO.insertUpDownNoriter", vo);
		} else {
//			System.out.println("수정 탔음");
			return mybatis.update("CommunityDAO.updateUpDownNoriter", vo);
		}
	}
	public int insertUpDownShopping(Updown_ShoppingVO vo) {
//		System.out.println("추천 비추천 저장 탔음");
		if (mybatis.selectOne("CommunityDAO.getUpDownShopping", vo) == null) {
//			System.out.println("둘다 안찍음");
			return mybatis.insert("CommunityDAO.insertUpDownShopping", vo);
		} else {
//			System.out.println("수정 탔음");
			return mybatis.update("CommunityDAO.updateUpDownShopping", vo);
		}
	}
	
	public List<Community_yookaVO> getYookaAdmin(Community_yookaVO vo){
		System.out.println("getYookaAdmin dao 입장");
		return mybatis.selectList("CommunityDAO.getYookaAdmin",vo);
	}
	
	public int updateYookaAdmin(Community_yookaVO vo) {
		System.out.println("updateYookaAdmin dao 입장");
		return mybatis.update("CommunityDAO.updateYookaAdmin", vo);
	}

	public int deleteYookaAdmin(Community_yookaVO vo) {
		System.out.println("deleteYookaAdmin dao 입장");
		return mybatis.delete("CommunityDAO.deleteYookaAdmin", vo);
	}
}
