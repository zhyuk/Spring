package com.spring.mom.trade.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.TradeVO;

@Repository
public class TradeDAOMybatis {

    @Autowired
    private SqlSessionTemplate mybatis;
    
    // 기본 CRUD 메서드
    public boolean updateTradeStatus(TradeVO vo) {
        System.out.println("===>mybatis updateTradeStatus() 기능처리");
        try {
            int result = mybatis.update("TradeDAO.updateTradeStatus", vo);
            System.out.println("상태 업데이트 결과: " + result + ", 새로운 상태: " + vo.getT_status());
            return result > 0;
        } catch (Exception e) {
            System.out.println("updateTradeStatus 에러:" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public int insertTrade(TradeVO vo) {
        System.out.println("===>mybatis insertTrade() 기능처리");
        return mybatis.insert("TradeDAO.insertTrade", vo);
    }

    public void updateTrade(TradeVO vo) {
        System.out.println("===>mybatis updateTrade() 기능처리");
        try {
            mybatis.update("TradeDAO.updateTrade", vo);
        } catch (Exception e) {
            System.out.println("updateTrade 에러: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public int deleteTrade(int t_no) {
        System.out.println("===>mybatis deleteTrade() 기능처리");
        return mybatis.delete("TradeDAO.deleteTrade", t_no);
    }

    public TradeVO getTrade(TradeVO vo) {
        System.out.println("===>mybatis getTrade() 기능처리");
        return mybatis.selectOne("TradeDAO.getTrade", vo);
    }

    // 페이지네이션 관련 메서드
    public List<TradeVO> getTradeList(Map<String, Object> params) {
        System.out.println("===>mybatis getTradeList() 기능처리");
        logParams(params);
        return mybatis.selectList("TradeDAO.getTradeListPaging", params);
    }

    public int getTotalTradeCount(Map<String, Object> params) {
        System.out.println("===>mybatis getTotalTradeCount() 기능처리");
        return mybatis.selectOne("TradeDAO.getTotalTradeCount", params);
    }

    // 관리자용 메서드
    public List<TradeVO> getTradesForAdmin(Map<String, Object> params) {
        System.out.println("===>mybatis getTradesForAdmin() 기능처리");
        return mybatis.selectList("TradeDAO.getTradesForAdmin", params);
    }

    public int getTotalTradesCount(Map<String, Object> params) {
        System.out.println("===>mybatis getTotalTradesCount() 기능처리");
        return mybatis.selectOne("TradeDAO.getTotalTradesCount", params);
    }

    public int deleteMultipleTrades(List<Integer> ids) {
        System.out.println("===>mybatis deleteMultipleTrades() 기능처리");
        return mybatis.delete("TradeDAO.deleteMultipleTrades", ids);
    }

    public List<TradeVO> getTradesByStatus(String status) {
        System.out.println("===>mybatis getTradesByStatus() 기능처리");
        return mybatis.selectList("TradeDAO.getTradesByStatus", status);
    }

    public Map<String, Long> getTradeStatistics() {
        System.out.println("===>mybatis getTradeStatistics() 기능처리");
        return mybatis.selectOne("TradeDAO.getTradeStatistics");
    }

    public TradeVO findByTNo(int t_no) {
        System.out.println("===>mybatis로 findByTNo() 기능처리");
        try {
            TradeVO vo = new TradeVO();
            vo.setT_no(t_no);
            return mybatis.selectOne("TradeDAO.getTrade", vo);
        } catch (Exception e) {
            System.out.println("findByTNo 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    // 조회수 증가
    public void increaseCnt(int t_no) {
        System.out.println("===>mybatis increaseCnt() 기능처리");
        mybatis.update("TradeDAO.increaseCnt", t_no);
    }

    // 유틸리티 메서드
    private void logParams(Map<String, Object> params) {
        System.out.println("검색 파라미터:");
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}