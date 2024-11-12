package com.spring.mom.vo;

import java.util.List;
import java.util.Map;

public interface TradeService {
    int insertTrade(TradeVO vo);
    int saveTrade(TradeVO vo);
    void updateTrade(TradeVO vo);
    boolean deleteTrade(int t_no);
    TradeVO getTrade(TradeVO vo);
   
    TradeVO findByTNo(int t_no);
    void increaseCnt(int t_no);
    boolean toggleLike(int t_no, String userId);
    boolean checkLike(int t_no, String userId);
    int getLikeCount(int t_no);
    List<TradeVO> getTradeList(TradeVO vo, String sortCondition);
    List<TradeVO> getTradeList(Map<String, Object> params);
}

