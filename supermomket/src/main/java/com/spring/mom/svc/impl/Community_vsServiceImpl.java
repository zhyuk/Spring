package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.Community_vsDAO;
import com.spring.mom.svc.Community_vsService;
import com.spring.mom.vo.Comment_vsVO;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.VsimgVO;

@Service
public class Community_vsServiceImpl implements Community_vsService {

	@Autowired
	private Community_vsDAO dao;

	// 관리자용 글 목록 조회
	@Override
	public List<Community_vsVO> getBoardAdmin(Community_vsVO vo) {
//		System.out.println("SVC 클래스 getBoardAdmin() 실행");
		return dao.getBoardAdmin(vo);
	}
	
	// 관리자용 글 수정
	@Override
	public int updateBoardAdmin(Community_vsVO vo) {
//		System.out.println("SVC 클래스 updateBoardAdmin() 실행");
		return dao.updateBoardAdmin(vo);
	}
	
	// 글 목록 조회
	@Override
	public List<Community_vsVO> getBoardList(Community_vsVO vo) {
//		System.out.println("SVC 클래스 getBoardList() 실행");
		return dao.getBoardList(vo);
	}

	// 글 갯수 조회
	@Override
	public int countBoard(Community_vsVO vo) {
//		System.out.println("SVC 클래스 countBoard() 실행");
		return dao.countBoard(vo);
	}
	
	// 글 상세보기
	@Override
	public List<Community_vsVO> getBoardInfo(Community_vsVO vo) {
//		System.out.println("SVC 클래스 getBoardInfo() 실행");
		return dao.getBoardInfo(vo);
	}
	
	// 글 작성
	@Override
	public int insertBoard(Community_vsVO vo) {
//		System.out.println("SVC 클래스 isnertBoard() 실행");
		return dao.insertBoard(vo);
	}

	// 글 수정
	@Override
	public int updateBoard(Community_vsVO vo) {
//		System.out.println("SVC 클래스 updateBoard() 실행");
		return dao.updateBoard(vo);
	}

	// 글 삭제
	@Override
	public int deleteBoard(Community_vsVO vo) {
//		System.out.println("SVC 클래스 deleteBoard() 실행");
		return dao.deleteBoard(vo);
	}
	
	// 투표정보 저장
	@Override
	public int insertVote(VsimgVO vo) {
//		System.out.println("SVC 클래스 insertVote() 실행");
		return dao.insertVote(vo);
	}

	// 투표정보 조회
	@Override
	public int getLeftVote(VsimgVO vo) {
//		System.out.println("SVC 클래스 getLeftVote() 실행");
		return dao.getLeftVote(vo);
	}

	// 투표정보 조회
	@Override
	public int getRightVote(VsimgVO vo) {
//		System.out.println("SVC 클래스 getRightVote() 실행");
		return dao.getRightVote(vo);
	}

	// 모든 투표결과 삭제
	@Override
	public int deleteAllVote(VsimgVO vo) {
//		System.out.println("SVC 클래스 deleteAllVote() 실행");
		return dao.deleteAllVote(vo);
	}

	// 댓글 조회
	@Override
	public List<Comment_vsVO> getComment(Comment_vsVO vo) {
//		System.out.println("SVC 클래스 getComment() 실행");
		return dao.getComment(vo);
	}

	// 댓글 작성
	@Override
	public int insertComment(Comment_vsVO vo) {
//		System.out.println("SVC 클래스 insertComment() 실행");
		return dao.insertComment(vo);
	}

	// 댓글 수정
	@Override
	public int updateComment(Comment_vsVO vo) {
//		System.out.println("SVC 클래스 updateComment() 실행");
		return dao.updateComment(vo);
	}

	// 댓글 삭제
	@Override
	public int deleteComment(Comment_vsVO vo) {
//		System.out.println("SVC 클래스 deleteComment() 실행");
		return dao.deleteComment(vo);
	}

	// 모든 댓글 삭제
	@Override
	public int deleteAllComment(Comment_vsVO vo) {
//		System.out.println("SVC 클래스 deleteAllComment() 실행");
		return dao.deleteAllComment(vo);
	}


}
