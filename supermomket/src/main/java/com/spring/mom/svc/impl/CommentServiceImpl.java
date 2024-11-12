package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.CommentDAO;
import com.spring.mom.svc.CommentService;
import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	// 댓글 조회
	@Override
	public List<Comment_yookaVO> getCommentYookaList(Comment_yookaVO vo) {
//		System.out.println("commentService 실행 :" + vo);
		return commentDAO.getCommentYookaList(vo);
	}
	@Override
	public List<Comment_noriterVO> getCommentNoriterList(Comment_noriterVO vo) {
//		System.out.println("commentService 실행 :" + vo);
		return commentDAO.getCommentNoriterList(vo);
	}
	@Override
	public List<Comment_shoppingVO> getCommentShoppingList(Comment_shoppingVO vo) {
//		System.out.println("commentService 실행 :" + vo);
		return commentDAO.getCommentShoppingList(vo);
	}

	// 댓글 등록
	@Override
	public int insertCommentYooka(Comment_yookaVO vo) {
//		System.out.println("commentinsertyooka 실행 :" + vo);
		int result = 0;
		if (vo.getCo_no2() != null) {
			result = commentDAO.insertCommentYooka(vo);
		} else {

			vo.setCo_no2(null);
			result = commentDAO.insertCommentYooka(vo);
		}

		return result;
	}
	@Override
	public int insertCommentNoriter(Comment_noriterVO vo) {
//		System.out.println("commentinsertyooka 실행 :" + vo);
		int result = 0;
		if (vo.getCo_no2() != null) {
			result = commentDAO.insertCommentNoriter(vo);
		} else {
			
			vo.setCo_no2(null);
			result = commentDAO.insertCommentNoriter(vo);
		}
		
		return result;
	}
	@Override
	public int insertCommentShopping(Comment_shoppingVO vo) {
//		System.out.println("commentinsertyooka 실행 :" + vo);
		int result = 0;
		if (vo.getCo_no2() != null) {
			result = commentDAO.insertCommentShopping(vo);
		} else {
			
			vo.setCo_no2(null);
			result = commentDAO.insertCommentShopping(vo);
		}
		
		return result;
	}

	// 댓글 수정
	@Override
	public int updateCommentYooka(Comment_yookaVO vo) {
//		System.out.println("댓글수정 서비스impl입장" + vo);
		int result = commentDAO.updateCommentYooka(vo);
		return result;
	}
	@Override
	public int updateCommentNoriter(Comment_noriterVO vo) {
//		System.out.println("댓글수정 서비스impl입장" + vo);
		int result = commentDAO.updateCommentNoriter(vo);
		return result;
	}
	@Override
	public int updateCommentShopping(Comment_shoppingVO vo) {
//		System.out.println("댓글수정 서비스impl입장" + vo);
		int result = commentDAO.updateCommentShopping(vo);
		return result;
	}

	// 댓글 삭제
	@Override
	public int deleteCommentYooka(Comment_yookaVO vo) {
//		System.out.println("댓글삭제 서비스impl입장" + vo);
		int result = commentDAO.deleteCommentYooka(vo);
		return result;
	}
	@Override
	public int deleteCommentNoriter(Comment_noriterVO vo) {
//		System.out.println("댓글삭제 서비스impl입장" + vo);
		int result = commentDAO.deleteCommentNoriter(vo);
		return result;
	}
	@Override
	public int deleteCommentShopping(Comment_shoppingVO vo) {
//		System.out.println("댓글삭제 서비스impl입장" + vo);
		int result = commentDAO.deleteCommentShopping(vo);
		return result;
	}

	// 대댓글 등록
	@Override
	public int insertReplyYooka(Comment_yookaVO vo) {
//		System.out.println("육아 대댓글 실행 :" + vo);
		int result = commentDAO.insertReplyYooka(vo);
		;
		return result;
	}
	@Override
	public int insertReplyNoriter(Comment_noriterVO vo) {
//		System.out.println("육아 대댓글 실행 :" + vo);
		int result = commentDAO.insertReplyNoriter(vo);
		;
		return result;
	}
	@Override
	public int insertReplyShopping(Comment_shoppingVO vo) {
//		System.out.println("육아 대댓글 실행 :" + vo);
		int result = commentDAO.insertReplyShopping(vo);
		;
		return result;
	}

	// 대댓글 수정
	@Override
	public int updateReplyYooka(Comment_yookaVO vo) {
//		System.out.println("대댓글수정 서비스impl입장" + vo);
		int result = commentDAO.updateReplyYooka(vo);
		return result;
	}
	@Override
	public int updateReplyNoriter(Comment_noriterVO vo) {
//		System.out.println("대댓글수정 서비스impl입장" + vo);
		int result = commentDAO.updateReplyNoriter(vo);
		return result;
	}
	@Override
	public int updateReplyShopping(Comment_shoppingVO vo) {
//		System.out.println("대댓글수정 서비스impl입장" + vo);
		int result = commentDAO.updateReplyShopping(vo);
		return result;
	}

	// 대댓글 삭제
	@Override
	public int deleteReplyYooka(Comment_yookaVO vo) {
//		System.out.println("댓글삭제 서비스impl입장" + vo);
		int result = commentDAO.deleteReplyYooka(vo);
		return result;
	}
	@Override
	public int deleteReplyNoriter(Comment_noriterVO vo) {
//		System.out.println("댓글삭제 서비스impl입장" + vo);
		int result = commentDAO.deleteReplyNoriter(vo);
		return result;
	}
	@Override
	public int deleteReplyShopping(Comment_shoppingVO vo) {
//		System.out.println("댓글삭제 서비스impl입장" + vo);
		int result = commentDAO.deleteReplyShopping(vo);
		return result;
	}
	
	// 전체 댓글수
	@Override
	public int replyCntYooka(Comment_yookaVO vo) {
//		System.out.println("전체 댓글수 Impl: " + vo);
		return commentDAO.replyCntYooka(vo);
	}
}