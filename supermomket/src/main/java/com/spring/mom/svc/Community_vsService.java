package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.Comment_vsVO;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.VsimgVO;

public interface Community_vsService {

	List<Community_vsVO> getBoardList(Community_vsVO vo);
	
	int insertBoard(Community_vsVO vo);
	
	// 글 상세보기
	List<Community_vsVO> getBoardInfo(Community_vsVO vo);
	
	// 글 수정
	int updateBoard(Community_vsVO vo);
	
	// 글 삭제
	int deleteBoard(Community_vsVO vo);
	
	// 왼쪽 투표수 조회
	int getLeftVote(VsimgVO vo);
	
	// 오른쪽 투표수 조회
	int getRightVote(VsimgVO vo);
	
	// 투표결과 저장
	int insertVote(VsimgVO vo);
	
	// 댓글 조회
	List<Comment_vsVO> getComment(Comment_vsVO vo);
	
	// 댓글 작성
	int insertComment(Comment_vsVO vo);
	
	// 댓글 수정
	int updateComment(Comment_vsVO vo);
	
	// 댓글 삭제
	int deleteComment(Comment_vsVO vo);
}
