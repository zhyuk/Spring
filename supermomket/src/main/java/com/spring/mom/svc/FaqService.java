package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.FaqVO;

public interface FaqService {
	List<FaqVO> searchfaq(FaqVO vo);
  
	List<FaqVO> getFaqList(FaqVO vo);
	
	int insertfaq(FaqVO vo);
	
	void updatefaq(FaqVO vo);
	
	void deletefaq(FaqVO vo);

	FaqVO getFaq(FaqVO vo);

	int countFaq(FaqVO vo);

	int countFaqclass(FaqVO vo);
	
	
}
