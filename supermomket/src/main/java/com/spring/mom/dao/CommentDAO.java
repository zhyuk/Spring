package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;
import com.spring.mom.vo.Community_yookaVO;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

		
	// 댓글 목록
	public List<Comment_yookaVO> getCommentYookaList(Comment_yookaVO vo) {
//		System.out.println("CommentYookaList 등록 : " + vo);
		return mybatis.selectList("CommentDAO.getCommentYookaList", vo);
	}
	public List<Comment_noriterVO> getCommentNoriterList(Comment_noriterVO vo) {
//		System.out.println("CommentYookaList 등록 : " + vo);
		return mybatis.selectList("CommentDAO.getCommentNoriterList", vo);
	}
	public List<Comment_shoppingVO> getCommentShoppingList(Comment_shoppingVO vo) {
//		System.out.println("CommentYookaList 등록 : " + vo);
		return mybatis.selectList("CommentDAO.getCommentShoppingList", vo);
	}

	// 댓글 등록
	public int insertCommentYooka(Comment_yookaVO vo) {
		return mybatis.insert("CommentDAO.insertCommentYooka", vo);
	}
	public int insertCommentNoriter(Comment_noriterVO vo) {
		return mybatis.insert("CommentDAO.insertCommentNoriter", vo);
	}
	public int insertCommentShopping(Comment_shoppingVO vo) {
		return mybatis.insert("CommentDAO.insertCommentShopping", vo);
	}

	// 댓글 수정
	public int updateCommentYooka(Comment_yookaVO vo) {
		return mybatis.update("CommentDAO.updateCommentYooka", vo);
	}
	public int updateCommentNoriter(Comment_noriterVO vo) {
		return mybatis.update("CommentDAO.updateCommentNoriter", vo);
	}
	public int updateCommentShopping(Comment_shoppingVO vo) {
		return mybatis.update("CommentDAO.updateCommentShopping", vo);
	}

	// 댓글 삭제
	public int deleteCommentYooka(Comment_yookaVO vo) {
		return mybatis.delete("CommentDAO.deleteCommentYooka", vo);
	}
	public int deleteCommentNoriter(Comment_noriterVO vo) {
		return mybatis.delete("CommentDAO.deleteCommentNoriter", vo);
	}
	public int deleteCommentShopping(Comment_shoppingVO vo) {
		return mybatis.delete("CommentDAO.deleteCommentShopping", vo);
	}

	// 대댓글 등록
	public int insertReplyYooka(Comment_yookaVO vo) {
//		System.out.println("대댓글등록 다오입장");
		return mybatis.insert("CommentDAO.insertReplyYooka", vo);
	}
	public int insertReplyNoriter(Comment_noriterVO vo) {
//		System.out.println("대댓글등록 다오입장");
		return mybatis.insert("CommentDAO.insertReplyNoriter", vo);
	}
	public int insertReplyShopping(Comment_shoppingVO vo) {
//		System.out.println("대댓글등록 다오입장");
		return mybatis.insert("CommentDAO.insertReplyShopping", vo);
	}

	// 대댓글 수정
	public int updateReplyYooka(Comment_yookaVO vo) {
		return mybatis.update("CommentDAO.updateReplyYooka", vo);
	}
	public int updateReplyNoriter(Comment_noriterVO vo) {
		return mybatis.update("CommentDAO.updateReplyNoriter", vo);
	}
	public int updateReplyShopping(Comment_shoppingVO vo) {
		return mybatis.update("CommentDAO.updateReplyShopping", vo);
	}

	// 대댓글 삭제
	public int deleteReplyYooka(Comment_yookaVO vo) {
		return mybatis.delete("CommentDAO.deleteCommentYooka", vo);
	}
	public int deleteReplyNoriter(Comment_noriterVO vo) {
		return mybatis.delete("CommentDAO.deleteCommentNoriter", vo);
	}
	public int deleteReplyShopping(Comment_shoppingVO vo) {
		return mybatis.delete("CommentDAO.deleteCommentShopping", vo);
	}
	
	// 전체 댓글수
	public int replyCntYooka(Comment_yookaVO vo) {
//		System.out.println("replyCntYooka DAO: "+ vo);
		return mybatis.selectOne("CommentDAO.replyCntYooka", vo);
	}
}
