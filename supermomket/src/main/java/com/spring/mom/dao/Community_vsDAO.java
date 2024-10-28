package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.VsimgVO;

@Repository
public class Community_vsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Community_vsVO> getBoardList(Community_vsVO vo) {
		System.out.println("DAO 클래스 실행");
		return mybatis.selectList("VsDAO.getBoardList", vo);
	}
	
	public int insertBoard(Community_vsVO vo) {
		System.out.println("DAO 클래스 insertBoard 실행");
		return mybatis.insert("VsDAO.insertBoard", vo);
	}
	
	// 글 상세보기
	public List<Community_vsVO> getBoardInfo(Community_vsVO vo){
		System.out.println("DAO 클래스 실행");
		return mybatis.selectList("VsDAO.getBoardInfo", vo);
	}
	
	// 글 수정
	public int updateBoard(Community_vsVO vo) {
		System.out.println("DAO 클래스 updateBoard 실행");
		return mybatis.update("VsDAO.updateBoard", vo);
	}
	
	// 글 삭제
	public int deleteBoard(Community_vsVO vo) {
		System.out.println("DAO 클래스 deleteBoard 실행");
		return mybatis.delete("VsDAO.deleteBoard", vo);
	}
	
	// 투표결과 저장
	public int insertVote(VsimgVO vo) {
		System.out.println("DAO 클래스 insertVote 실행");
		return mybatis.insert("VsDAO.insertVote", vo);
	}
}
