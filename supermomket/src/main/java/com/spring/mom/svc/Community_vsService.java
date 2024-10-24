package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.Community_vsVO;

public interface Community_vsService {

	List<Community_vsVO> getBoardList(Community_vsVO vo);
	
	int insertBoard(Community_vsVO vo);
	
	// 글 상세보기
	List<Community_vsVO> getBoardInfo(Community_vsVO vo);
	
	// 글 수정
	int updateBoard(Community_vsVO vo);
}
