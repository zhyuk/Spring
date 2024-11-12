package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;
import com.spring.mom.vo.Community_yookaVO;
import com.spring.mom.vo.Updown_YookaVO;

public interface CommentService {

	
	// 댓글 조회
	List<Comment_yookaVO> getCommentYookaList(Comment_yookaVO vo);

	List<Comment_noriterVO> getCommentNoriterList(Comment_noriterVO vo);

	List<Comment_shoppingVO> getCommentShoppingList(Comment_shoppingVO vo);

	// 댓글 등록
	int insertCommentYooka(Comment_yookaVO vo);

	int insertCommentNoriter(Comment_noriterVO vo);

	int insertCommentShopping(Comment_shoppingVO vo);

	// 댓글 수정
	int updateCommentYooka(Comment_yookaVO vo);

	int updateCommentNoriter(Comment_noriterVO vo);

	int updateCommentShopping(Comment_shoppingVO vo);

	// 댓글 삭제
	int deleteCommentYooka(Comment_yookaVO vo);

	int deleteCommentNoriter(Comment_noriterVO vo);

	int deleteCommentShopping(Comment_shoppingVO vo);

	// 대댓글 등록
	int insertReplyYooka(Comment_yookaVO vo);

	int insertReplyNoriter(Comment_noriterVO vo);

	int insertReplyShopping(Comment_shoppingVO vo);

	// 대댓글 수정
	int updateReplyYooka(Comment_yookaVO vo);

	int updateReplyNoriter(Comment_noriterVO vo);

	int updateReplyShopping(Comment_shoppingVO vo);

	// 대댓글 삭제
	int deleteReplyYooka(Comment_yookaVO vo);

	int deleteReplyNoriter(Comment_noriterVO vo);

	int deleteReplyShopping(Comment_shoppingVO vo);

	// 댓글 총 갯수(대댓글 포함)
	public int replyCntYooka(Comment_yookaVO vo);


	

}
