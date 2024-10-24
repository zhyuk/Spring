package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.Community_vsDAO;
import com.spring.mom.svc.Community_vsService;
import com.spring.mom.vo.Community_vsVO;

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

}
