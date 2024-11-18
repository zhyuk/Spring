package com.spring.mom.vo;

import java.util.List;
import java.util.Map;

public interface TradeService {
	  boolean updateTradeStatus(int t_no, String status);
	    int insertTrade(TradeVO vo);
	    int saveTrade(TradeVO vo);
	    void updateTrade(TradeVO vo);
	    void increaseCnt(int t_no);
	    boolean deleteTrade(int t_no);
	    TradeVO getTrade(TradeVO vo);
	    TradeVO findByTNo(int t_no);
	    // 페이지네이션 관련 메서드
	    List<TradeVO> getTradeList(Map<String, Object> params);
	    int getTotalTradeCount(Map<String, Object> params); 
	    
	    // 검색 관련 메서드
	    List<TradeVO> searchTradeList(Map<String, Object> params);
	    Map<String, Integer> getCategoryCount(Map<String, Object> params);
	    
	    // 관리자용 메서드
	    List<TradeVO> getTradesByStatus(String status);
	    boolean deleteMultipleTrades(List<Integer> ids);
	    List<TradeVO> getTradesForAdmin(Map<String, Object> params);
	    int getTotalTradesCount(Map<String, Object> params);
	    Map<String, Long> getTradeStatistics();
}

