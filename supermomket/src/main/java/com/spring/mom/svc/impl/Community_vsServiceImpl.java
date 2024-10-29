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

	@Override
	public List<Community_vsVO> getBoardList(Community_vsVO vo) {
		System.out.println("SVC 클래스 실행");
		return dao.getBoardList(vo);

	}

	@Override
	public int insertBoard(Community_vsVO vo) {
		System.out.println("SVC 클래스 isnertBoard() 실행");
		return dao.insertBoard(vo);
	}

	// 글 상세보기
	@Override
	public List<Community_vsVO> getBoardInfo(Community_vsVO vo) {
		System.out.println("SVC 클래스 getBoardInfo() 실행");
		return dao.getBoardInfo(vo);
	}

	// 글 수정
	@Override
	public int updateBoard(Community_vsVO vo) {
		System.out.println("SVC 클래스 updateBoard() 실행");
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(Community_vsVO vo) {
		System.out.println("SVC 클래스 deleteBoard() 실행");
		return dao.deleteBoard(vo);
	}

	@Override
	public int insertVote(VsimgVO vo) {
		System.out.println("SVC 클래스 insertVote() 실행");
		return dao.insertVote(vo);
	}

	@Override
	public List<Comment_vsVO> getComment(Comment_vsVO vo) {
		System.out.println("SVC 클래스 getComment() 실행");
		return dao.getComment(vo);
	}

	@Override
	public int insertComment(Comment_vsVO vo) {
		System.out.println("SVC 클래스 insertComment() 실행");
		return dao.insertComment(vo);
	}

	@Override
	public int updateComment(Comment_vsVO vo) {
		System.out.println("SVC 클래스 updateComment() 실행");
		return dao.updateComment(vo);
	}

	@Override
	public int deleteComment(Comment_vsVO vo) {
		System.out.println("SVC 클래스 deleteComment() 실행");
		return dao.deleteComment(vo);
	}

	@Override
	public int getLeftVote(VsimgVO vo) {
		System.out.println("SVC 클래스 getLeftVote() 실행");
		return dao.getLeftVote(vo);
	}

	@Override
	public int getRightVote(VsimgVO vo) {
		System.out.println("SVC 클래스 getRightVote() 실행");
		return dao.getRightVote(vo);
	}

}
