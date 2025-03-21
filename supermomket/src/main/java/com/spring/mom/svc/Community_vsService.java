package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.Comment_vsVO;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.VsimgVO;

public interface Community_vsService {

	// 관리자용 글 목록 조회
	List<Community_vsVO> getBoardAdmin(Community_vsVO vo);
	
	// 관리자용 글 수정
	int updateBoardAdmin(Community_vsVO vo);
	
	// 글 전체목록 조회
	List<Community_vsVO> getBoardList(Community_vsVO vo);
	
	// 글 상세보기
	List<Community_vsVO> getBoardInfo(Community_vsVO vo);
	
	// 글 갯수 조회
	int countBoard(Community_vsVO vo);
	
	// 글 작성
	int insertBoard(Community_vsVO vo);
	
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
	
	// 모든 투표결과 삭제
	int deleteAllVote(VsimgVO vo);
	
	// 댓글 갯수 조회
	int countComment(Comment_vsVO vo);
	
	// 댓글 조회
	List<Comment_vsVO> getComment(Comment_vsVO vo);
	
	// 댓글 작성
	int insertComment(Comment_vsVO vo);
	
	// 댓글 수정
	int updateComment(Comment_vsVO vo);
	
	// 댓글 삭제
	int deleteComment(Comment_vsVO vo);
	
	// 모든 댓글 삭제
	int deleteAllComment(Comment_vsVO vo);
	
	// 답글 작성
	int insertRecomment(Comment_vsVO vo);
}
