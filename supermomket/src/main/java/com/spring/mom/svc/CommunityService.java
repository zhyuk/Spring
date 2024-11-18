package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;
import com.spring.mom.vo.Community_noriterVO;
import com.spring.mom.vo.Community_shoppingVO;
import com.spring.mom.vo.Community_yookaVO;
import com.spring.mom.vo.Updown_NoriterVO;
import com.spring.mom.vo.Updown_ShoppingVO;
import com.spring.mom.vo.Updown_YookaVO;

public interface CommunityService {
	
	
	// 글 등록
	void insertYooka(Community_yookaVO vo);

	void insertNoriter(Community_noriterVO nvo);

	void insertShopping(Community_shoppingVO svo);

	// 글 수정
	void updateYooka(Community_yookaVO vo);

	void updateNoriter(Community_noriterVO vo);

	void updateShopping(Community_shoppingVO vo);

	// 글 삭제
	void deleteYooka(Community_yookaVO vo);

	void deleteNoriter(Community_noriterVO vo);

	void deleteShopping(Community_shoppingVO vo);

	// 글 목록
	List<Community_yookaVO> getYookaList(Community_yookaVO vo);

	List<Community_noriterVO> getNoriterList(Community_noriterVO vo);

	List<Community_shoppingVO> getShoppingList(Community_shoppingVO vo);

	// 글 상세
	Community_yookaVO getYooka(Community_yookaVO vo);

	Community_noriterVO getNoriter(Community_noriterVO vo);

	Community_shoppingVO getShopping(Community_shoppingVO vo);

	// 게시물 총 갯수
	public int countYooka(Community_yookaVO vo);

	public int countNoriter(Community_noriterVO vo);

	public int countShopping(Community_shoppingVO vo);

	// 조회수
	void updateCntYooka(Community_yookaVO vo);

	void updateCntNoriter(Community_noriterVO vo);

	void updateCntShopping(Community_shoppingVO vo);

	// 추천
	public int likeYooka(Community_yookaVO vo);

	public int likeNoriter(Community_noriterVO vo);

	public int likeShopping(Community_shoppingVO vo);

	// 추천 갯수
	public int getLikeYooka(Updown_YookaVO vo);

	public int getLikeNoriter(Updown_NoriterVO vo);

	public int getLikeShopping(Updown_ShoppingVO vo);

	// 비추천
	public int hateYooka(Community_yookaVO vo);

	public int hateNoriter(Community_noriterVO vo);

	public int hateShopping(Community_shoppingVO vo);

	// 비추천 갯수
	public int getHateYooka(Updown_YookaVO vo);

	public int getHateNoriter(Updown_NoriterVO vo);

	public int getHateShopping(Updown_ShoppingVO vo);

	// 추천 비추천 여부 저장
	int insertUpDownYooka(Updown_YookaVO vo);

	int insertUpDownNoriter(Updown_NoriterVO vo);

	int insertUpDownShopping(Updown_ShoppingVO vo);
	
	//관리자 목록리스트
	List<Community_yookaVO> getYookaAdmin(Community_yookaVO vo);
	List<Comment_yookaVO> getYookaAdminCom(Comment_yookaVO vo);
	List<Comment_yookaVO> getYookaAdminCmno(Comment_yookaVO vo);
	
	List<Community_noriterVO> getNoriterAdmin(Community_noriterVO vo);
	List<Comment_noriterVO> getNoriterAdminCom(Comment_noriterVO vo);
	List<Comment_noriterVO> getNoriterAdminCmno(Comment_noriterVO vo);
	
	List<Community_shoppingVO> getShoppingAdmin(Community_shoppingVO vo);
	List<Comment_shoppingVO> getShoppingAdminCom(Comment_shoppingVO vo);
	List<Comment_shoppingVO> getShoppingAdminCmno(Comment_shoppingVO vo);
	
	
	//관리자 글 수정
	int updateYookaAdmin(Community_yookaVO vo);
	int updateNoriterAdmin(Community_noriterVO vo);
	int updateShoppingAdmin(Community_shoppingVO vo);
	
	//관리자 글 삭제
	int deleteYookaAdmin(Community_yookaVO vo);
	int deleteNoriterAdmin(Community_noriterVO vo);
	int deleteShoppingAdmin(Community_shoppingVO vo);
	
	//관리자 댓글 삭제
	int deleteYookaComDel(Comment_yookaVO vo);
	int deleteNoriterComDel(Comment_noriterVO vo);
	int deleteShoppingComDel(Comment_shoppingVO vo);

}
