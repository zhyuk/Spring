package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;
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

		mybatis.insert("CommunityDAO.insertYooka", vo);
	}

	public void insertNoriter(Community_noriterVO nvo) {

		mybatis.insert("CommunityDAO.insertNoriter", nvo);
	}

	public void insertShopping(Community_shoppingVO svo) {

		mybatis.insert("CommunityDAO.insertShopping", svo);
	}

	// 글수정
	public void updateYooka(Community_yookaVO vo) {
		mybatis.update("CommunityDAO.updateYooka", vo);
	}

	public void updateNoriter(Community_noriterVO vo) {
		mybatis.update("CommunityDAO.updateNoriter", vo);
	}

	public void updateShopping(Community_shoppingVO vo) {
		mybatis.update("CommunityDAO.updateShopping", vo);
	}

	// 글삭제
	public void deleteYooka(Community_yookaVO vo) {
		mybatis.delete("CommunityDAO.deleteYooka", vo);
	}

	public void deleteNoriter(Community_noriterVO vo) {
		mybatis.delete("CommunityDAO.deleteNoriter", vo);
	}

	public void deleteShopping(Community_shoppingVO vo) {
		mybatis.delete("CommunityDAO.deleteShopping", vo);
	}

	// 글상세
	public Community_yookaVO getYooka(Community_yookaVO vo) {
		return (Community_yookaVO) mybatis.selectOne("CommunityDAO.getYooka", vo);
	}

	public Community_noriterVO getNoriter(Community_noriterVO vo) {
		return (Community_noriterVO) mybatis.selectOne("CommunityDAO.getNoriter", vo);
	}

	public Community_shoppingVO getShopping(Community_shoppingVO vo) {
		return (Community_shoppingVO) mybatis.selectOne("CommunityDAO.getShopping", vo);
	}

	// 글목록
	public List<Community_yookaVO> getYookaList(Community_yookaVO vo) {
		return mybatis.selectList("CommunityDAO.getYookaList", vo);
	}

	public List<Community_noriterVO> getNoriterList(Community_noriterVO vo) {
		return mybatis.selectList("CommunityDAO.getNoriterList", vo);
	}

	public List<Community_shoppingVO> getShoppingList(Community_shoppingVO vo) {
		return mybatis.selectList("CommunityDAO.getShoppingList", vo);
	}

	// 전체페이지수
	public int countYooka(Community_yookaVO vo) {
		return mybatis.selectOne("CommunityDAO.countYooka", vo);
	}

	public int countNoriter(Community_noriterVO vo) {
		return mybatis.selectOne("CommunityDAO.countNoriter", vo);
	}

	public int countShopping(Community_shoppingVO vo) {
		return mybatis.selectOne("CommunityDAO.countShopping", vo);
	}

	// 조회수
	public void updateCntYooka(Community_yookaVO vo) {
		mybatis.update("CommunityDAO.updateCntYooka", vo);
	}

	public void updateCntNoriter(Community_noriterVO vo) {
		mybatis.update("CommunityDAO.updateCntNoriter", vo);
	}

	public void updateCntShopping(Community_shoppingVO vo) {
		mybatis.update("CommunityDAO.updateCntShopping", vo);
	}

	// 추천
	public int likeYooka(Community_yookaVO vo) {
		return mybatis.update("CommunityDAO.likeYooka", vo);
	}

	public int likeNoriter(Community_noriterVO vo) {
		return mybatis.update("CommunityDAO.likeNoriter", vo);
	}

	public int likeShopping(Community_shoppingVO vo) {
		return mybatis.update("CommunityDAO.likeNoriter", vo);
	}

	// 비추천
	public int hateYooka(Community_yookaVO vo) {
		return mybatis.update("CommunityDAO.hateYooka", vo);
	}

	public int hateNoriter(Community_noriterVO vo) {
		return mybatis.update("CommunityDAO.hateNoriter", vo);
	}

	public int hateShopping(Community_shoppingVO vo) {
		return mybatis.update("CommunityDAO.hateShopping", vo);
	}

	// 추천 갯수
	public int getLikeYooka(Updown_YookaVO vo) {
		return mybatis.selectOne("CommunityDAO.getLikeYooka", vo);
	}

	public int getLikeNoriter(Updown_NoriterVO vo) {
		return mybatis.selectOne("CommunityDAO.getLikeNoriter", vo);
	}

	public int getLikeShopping(Updown_ShoppingVO vo) {
		return mybatis.selectOne("CommunityDAO.getLikeShopping", vo);
	}

	// 비추천 갯수
	public int getHateYooka(Updown_YookaVO vo) {
		return mybatis.selectOne("CommunityDAO.getHateYooka", vo);
	}
	public int getHateNoriter(Updown_NoriterVO vo) {
		return mybatis.selectOne("CommunityDAO.getHateNoriter", vo);
	}
	public int getHateShopping(Updown_ShoppingVO vo) {
		return mybatis.selectOne("CommunityDAO.getHateShopping", vo);
	}

	// 추천 비추천 저장
	public int insertUpDownYooka(Updown_YookaVO vo) {
		if (mybatis.selectOne("CommunityDAO.getUpDownYooka", vo) == null) {
			return mybatis.insert("CommunityDAO.insertUpDownYooka", vo);
		} else {
			return mybatis.update("CommunityDAO.updateUpDownYooka", vo);
		}
	}
	public int insertUpDownNoriter(Updown_NoriterVO vo) {
		if (mybatis.selectOne("CommunityDAO.getUpDownNoriter", vo) == null) {
			return mybatis.insert("CommunityDAO.insertUpDownNoriter", vo);
		} else {
			return mybatis.update("CommunityDAO.updateUpDownNoriter", vo);
		}
	}
	public int insertUpDownShopping(Updown_ShoppingVO vo) {
		if (mybatis.selectOne("CommunityDAO.getUpDownShopping", vo) == null) {
			return mybatis.insert("CommunityDAO.insertUpDownShopping", vo);
		} else {
			return mybatis.update("CommunityDAO.updateUpDownShopping", vo);
		}
	}
	//관리자 목록 리스트
	public List<Community_yookaVO> getYookaAdmin(Community_yookaVO vo){
		return mybatis.selectList("CommunityDAO.getYookaAdmin",vo);
	}
	public List<Community_noriterVO> getNoriterAdmin(Community_noriterVO vo){
		return mybatis.selectList("CommunityDAO.getNoriterAdmin",vo);
	}
	public List<Community_shoppingVO> getShoppingAdmin(Community_shoppingVO vo){
		return mybatis.selectList("CommunityDAO.getShoppingAdmin",vo);
	}
	
	//관리자 댓글 리스트
	public List<Comment_yookaVO> getYookaAdminCom(Comment_yookaVO vo){
		return mybatis.selectList("CommunityDAO.getYookaAdminCom",vo);
	}
	public List<Comment_noriterVO> getNoriterAdminCom(Comment_noriterVO vo){
		return mybatis.selectList("CommunityDAO.getNoriterAdminCom",vo);
	}
	public List<Comment_shoppingVO> getShoppingAdminCom(Comment_shoppingVO vo){
		return mybatis.selectList("CommunityDAO.getShoppingAdminCom",vo);
	}
	
	//해당 글번호의 댓글리스트
	public List<Comment_yookaVO> getYookaAdminCmno(Comment_yookaVO vo){
		return mybatis.selectList("CommunityDAO.getYookaAdminCmno",vo);
	}
	public List<Comment_noriterVO> getNoriterAdminCmno(Comment_noriterVO vo){
		return mybatis.selectList("CommunityDAO.getNoriterAdminCmno",vo);
	}
	public List<Comment_shoppingVO> getShoppingAdminCmno(Comment_shoppingVO vo){
		return mybatis.selectList("CommunityDAO.getShoppingAdminCmno",vo);
	}
	
	//관리자 글 수정
	public int updateYookaAdmin(Community_yookaVO vo) {
		return mybatis.update("CommunityDAO.updateYookaAdmin", vo);
	}
	public int updateNoriterAdmin(Community_noriterVO vo) {
		return mybatis.update("CommunityDAO.updateNoriterAdmin", vo);
	}
	public int updateShoppingAdmin(Community_shoppingVO vo) {
		return mybatis.update("CommunityDAO.updateShoppingAdmin", vo);
	}
	//관리자 글 삭제
	public int deleteYookaAdmin(Community_yookaVO vo) {
		return mybatis.delete("CommunityDAO.deleteYookaAdmin", vo);
	}
	public int deleteNoriterAdmin(Community_noriterVO vo) {
		return mybatis.delete("CommunityDAO.deleteNoriterAdmin", vo);
	}
	public int deleteShoppingAdmin(Community_shoppingVO vo) {
		return mybatis.delete("CommunityDAO.deleteShoppingAdmin", vo);
	}
	//관리자 댓글 삭제
	public int deleteYookaComDel(Comment_yookaVO vo) {
		return mybatis.delete("CommunityDAO.deleteYookaComDel", vo);
	}
	public int deleteNoriterComDel(Comment_noriterVO vo) {
		return mybatis.delete("CommunityDAO.deleteNoriterComDel", vo);
	}
	public int deleteShoppingComDel(Comment_shoppingVO vo) {
		return mybatis.delete("CommunityDAO.deleteShoppingComDel", vo);
	}
}
