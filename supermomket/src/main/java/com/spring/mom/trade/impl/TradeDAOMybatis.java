package com.spring.mom.trade.impl;

import java.util.HashMap;
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
	    
	    public int insertTrade(TradeVO vo) {
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
        return mybatis.delete("TradeDAO.deleteTrade", t_no);
    }

    public TradeVO getTrade(TradeVO vo) {
        System.out.println("===>mybatis로 getTrade() 기능처리");
        try {
            return mybatis.selectOne("TradeDAO.getTrade", vo);
        } catch (Exception e) {
            System.out.println("getTrade 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public List<TradeVO> getTradeList(TradeVO vo, String sortCondition) {
        System.out.println("===>mybatis로 getTradeList() 기능처리");
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("vo", vo);
            params.put("sortCondition", sortCondition);
            return mybatis.selectList("TradeDAO.getTradeList", params);
        } catch (Exception e) {
            System.out.println("getTradeList 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

   
    public List<TradeVO> getTradeListWithCategories(Map<String, Object> params) {
        System.out.println("===>mybatis로 getTradeListWithCategories() 기능처리");
        try {
            return mybatis.selectList("TradeDAO.getTradeList", params);
        } catch (Exception e) {
            System.out.println("getTradeListWithCategories 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    
    private void logParams(Map<String, Object> params) {
        System.out.println("검색 파라미터:");
        System.out.println("정렬 조건: " + params.get("sortCondition"));
        System.out.println("카테고리: " + params.get("categories"));
        if (params.get("vo") != null) {
            TradeVO vo = (TradeVO) params.get("vo");
            System.out.println("검색어: " + vo.getSearchKeyword());
        }
    }
    public List<TradeVO> searchTradeList(TradeVO vo) {
        System.out.println("===>mybatis로 searchTradeList() 기능처리");
        try {
            return mybatis.selectList("TradeDAO.searchTradeList", vo);
        } catch (Exception e) {
            System.out.println("searchTradeList 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public TradeVO findByTNo(int t_no) {
        System.out.println("===>mybatis로 findByTNo() 기능처리");
        try {
            return mybatis.selectOne("TradeDAO.getTrade", t_no);
        } catch (Exception e) {
            System.out.println("findByTNo 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public void increaseCnt(int t_no) {
        System.out.println("===>mybatis로 increaseCnt() 기능처리");
        try {
            mybatis.update("TradeDAO.increaseCnt", t_no);
        } catch (Exception e) {
            System.out.println("increaseCnt 에러: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void insertLike(int t_no, String userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("t_no", t_no);
        params.put("userId", userId);
        mybatis.insert("TradeDAO.insertLike", params);
    }

    public void deleteLike(int t_no, String userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("t_no", t_no);
        params.put("userId", userId);
        mybatis.delete("TradeDAO.deleteLike", params);
    }

    public int checkLike(int t_no, String userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("t_no", t_no);
        params.put("userId", userId);
        return mybatis.selectOne("TradeDAO.checkLike", params);
    }

    public int getLikeCount(int t_no) {
        return mybatis.selectOne("TradeDAO.getLikeCount", t_no);
    }

}