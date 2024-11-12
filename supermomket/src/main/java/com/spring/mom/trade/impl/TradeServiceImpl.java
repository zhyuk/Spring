package com.spring.mom.trade.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.vo.TradeService;
import com.spring.mom.vo.TradeVO;

@Service("tradeService")
public class TradeServiceImpl implements TradeService {
	
	@Autowired
	private TradeDAOMybatis tradeDAO;

	@Override
	public int insertTrade(TradeVO vo) {
		System.out.println("TradeService: insertTrade() 실행");
		return tradeDAO.insertTrade(vo);
	}

	// 새로운 메서드 추가
	@Override
	public int saveTrade(TradeVO vo) {
		System.out.println("TradeService: saveTrade() 실행");
		return this.insertTrade(vo);
	}

	@Override
	public void updateTrade(TradeVO vo) {
		System.out.println("TradeService: updateTrade() 실행");
		tradeDAO.updateTrade(vo);
		
	}
	
	@Override
	public void increaseCnt(int t_no) {
	    tradeDAO.increaseCnt(t_no);
	}

	 @Override
	    public boolean deleteTrade(int t_no) {
	        // 삭제된 행 수가 0보다 크면 성공
	        return tradeDAO.deleteTrade(t_no) > 0; 
	    }

	@Override
	public TradeVO getTrade(TradeVO vo) {
		System.out.println("TradeService: getTrade() 실행");
		return tradeDAO.getTrade(vo);
	}
	
	  @Override
	    public List<TradeVO> getTradeList(TradeVO vo, String sortCondition) {
	        return tradeDAO.getTradeList(vo, sortCondition);
	    }
    
	   @Override
	    public List<TradeVO> getTradeList(Map<String, Object> params) {
	        return tradeDAO.getTradeListWithCategories(params);
	    }
	
	
	@Override
	public TradeVO findByTNo(int t_no) {
		return tradeDAO.findByTNo(t_no);
	}

	@Override
	public boolean toggleLike(int t_no, String userId) {
		// 이미 찜했는지 확인
		if (checkLike(t_no, userId)) {
			// 찜 되어있으면 삭제
			tradeDAO.deleteLike(t_no, userId);
			return false;
		} else {
			// 찜 안되어있으면 추가
			tradeDAO.insertLike(t_no, userId);
			return true;
		}
	}

	@Override
	public boolean checkLike(int t_no, String userId) {
		return tradeDAO.checkLike(t_no, userId) > 0;
	}

	@Override
	public int getLikeCount(int t_no) {
		return tradeDAO.getLikeCount(t_no);
	}
}