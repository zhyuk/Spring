package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.FaqDAO;
import com.spring.mom.svc.FaqService;
import com.spring.mom.vo.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDAO;
	
	
	@Override
	public List<FaqVO> searchfaq(FaqVO vo) {
		System.out.println("서비스 임플 searchfaq");
		return faqDAO.searchfaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
		System.out.println("서비스 임플 getFaqList");
		return faqDAO.getFaqList(vo);
	}

	@Override
	public int insertfaq(FaqVO vo) {
		System.out.println("서비스 임플 insertfaq");
	 return  faqDAO.insertfaq(vo);
	}

	@Override
	public void updatefaq(FaqVO vo) {
		System.out.println("서비스 임플 updatefaq");
		faqDAO.updatefaq(vo);
	}

	@Override
	public void deletefaq(FaqVO vo) {
		System.out.println("서비스 임플 deletefaq");
		faqDAO.deletefaq(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {	
		System.out.println("서비스 임플 getFaq");
		return faqDAO.getFaq(vo);
	}

	@Override
	public int countFaq(FaqVO vo) {
		System.out.println("서비스 임플 countFaq");
		return faqDAO.countFaq(vo);
	}

	@Override
	public int countFaqclass(FaqVO vo) {
		
		return faqDAO.countFaqclass(vo);
	}

}
