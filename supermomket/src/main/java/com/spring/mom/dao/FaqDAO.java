package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.FaqVO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate faqmybatis;

	// 검색 기능
	public List<FaqVO> searchfaq(FaqVO vo) {
		System.out.println("searchfaq 메소드실행");

		return faqmybatis.selectList("FaqDAO.searchfaq", vo);
	}

	public int countFaqclass(FaqVO vo) {
		System.out.println("countFaqclass 메소드실행");
		return faqmybatis.selectOne("FaqDAO.countFaqclass", vo);
	}

	public FaqVO getFaq(FaqVO vo) {
		System.out.println("getFaq 메소드실행");

		return (FaqVO) faqmybatis.selectOne("FaqDAO.getFaq", vo);
	}

	public List<FaqVO> getFaqList(FaqVO vo) {
		System.out.println("getFaqList 메소드실행");

		return faqmybatis.selectList("FaqDAO.getFaqList", vo);
	}

	public int insertfaq(FaqVO vo) {
		System.out.println("insertfaq 메소드실행");

		return faqmybatis.insert("FaqDAO.insertfaq", vo);
	}

	public void updatefaq(FaqVO vo) {
		System.out.println("updatefaq 메소드실행");
		faqmybatis.update("FaqDAO.updatefaq", vo);
	}

	public void deletefaq(FaqVO vo) {
		System.out.println("searchfaq 메소드실행");
		faqmybatis.delete("FaqDAO.deletefaq", vo);
	}

	public int countFaq(FaqVO vo) {
		System.out.println("countFaq 메소드실행");
		return faqmybatis.selectOne("FaqDAO.countFaq", vo);
	}

}
