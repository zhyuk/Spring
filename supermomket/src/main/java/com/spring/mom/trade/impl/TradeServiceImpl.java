package com.spring.mom.trade.impl;

import java.util.Arrays;
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
	    public boolean updateTradeStatus(int t_no, String status) {
	        try {
	            // 상태값 검증
	            if (!Arrays.asList("SELLING", "RESERVED", "COMPLETED").contains(status)) {
	                System.out.println("잘못된 상태값: " + status);
	                return false;
	            }
	            
	            TradeVO trade = new TradeVO();
	            trade.setT_no(t_no);
	            trade.setT_status(status);
	            
	            System.out.println("상태 업데이트 시도: t_no=" + t_no + ", status=" + status);
	            
	            boolean result = tradeDAO.updateTradeStatus(trade);
	            System.out.println("상태 업데이트 결과: " + result);
	            
	            return result;
	        } catch (Exception e) {
	            System.out.println("상태 업데이트 중 에러 발생: " + e.getMessage());
	            e.printStackTrace();
	            return false;
	        }
	    }

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
    public List<TradeVO> getTradeList(Map<String, Object> params) {
        System.out.println("TradeService: getTradeList() with pagination 실행");
        try {
            // 페이지네이션 파라미터 로깅
            int offset = (int) params.getOrDefault("offset", 0);
            int pageSize = (int) params.getOrDefault("pageSize", 12);
            System.out.println("Offset: " + offset + ", PageSize: " + pageSize);
            
            return tradeDAO.getTradeList(params);
        } catch (Exception e) {
            System.out.println("getTradeList 에러: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
	
	
	   @Override
	   public TradeVO findByTNo(int t_no) {
	       TradeVO trade = tradeDAO.findByTNo(t_no);
	       System.out.println("조회된 거래 상태: " + trade.getT_status());
	       return trade;
	   }

	
	   @Override
	    public List<TradeVO> getTradesByStatus(String status) {
	        try {
	            return tradeDAO.getTradesByStatus(status);
	        } catch (Exception e) {
	            System.out.println("getTradesByStatus 에러: " + e.getMessage());
	            e.printStackTrace();
	            return null;
	        }
	    }
	    
	    @Override
	    public boolean deleteMultipleTrades(List<Integer> ids) {
	        try {
	            int result = tradeDAO.deleteMultipleTrades(ids);
	            return result > 0;
	        } catch (Exception e) {
	            System.out.println("deleteMultipleTrades 에러: " + e.getMessage());
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    @Override
	    public List<TradeVO> getTradesForAdmin(Map<String, Object> params) {
	        try {
	            return tradeDAO.getTradesForAdmin(params);
	        } catch (Exception e) {
	            System.out.println("getTradesForAdmin 에러: " + e.getMessage());
	            e.printStackTrace();
	            return null;
	        }
	    }
	    
	    @Override
	    public int getTotalTradeCount(Map<String, Object> params) {
	        System.out.println("TradeService: getTotalTradeCount() 실행");
	        try {
	            return tradeDAO.getTotalTradeCount(params);
	        } catch (Exception e) {
	            System.out.println("getTotalTradeCount 에러: " + e.getMessage());
	            e.printStackTrace();
	            return 0;
	        }
	    }

	    
	    @Override
	    public int getTotalTradesCount(Map<String, Object> params) {
	        try {
	            return tradeDAO.getTotalTradesCount(params);
	        } catch (Exception e) {
	            System.out.println("getTotalTradesCount 에러: " + e.getMessage());
	            e.printStackTrace();
	            return 0;
	        }
	    }
	    
	    @Override
	    public List<TradeVO> searchTradeList(Map<String, Object> params) {
	        System.out.println("TradeService: searchTradeList() 실행");
	        try {
	            TradeVO vo = (TradeVO) params.get("vo");
	            String sortCondition = (String) params.get("sortCondition");
	            List<String> categories = (List<String>) params.get("categories");
	            
	            // 검색 조건 로깅
	            System.out.println("검색어: " + (vo != null ? vo.getSearchKeyword() : "없음"));
	            System.out.println("정렬 조건: " + sortCondition);
	            System.out.println("카테고리: " + categories);
	            
	            return tradeDAO.getTradeList(params);
	        } catch (Exception e) {
	            System.out.println("searchTradeList 에러: " + e.getMessage());
	            e.printStackTrace();
	            return null;
	        }
	    }
	    
	    @Override
	    public Map<String, Integer> getCategoryCount(Map<String, Object> params) {
	        System.out.println("TradeService: getCategoryCount() 실행");
	        try {
	            // 카테고리별 상품 수를 조회하는 로직 구현
	            // 이 부분은 DAO에 해당 메서드를 추가해야 합니다
	            return null; // 임시 반환
	        } catch (Exception e) {
	            System.out.println("getCategoryCount 에러: " + e.getMessage());
	            e.printStackTrace();
	            return new HashMap<>();
	        }
	    }
	    
	    @Override
	    public Map<String, Long> getTradeStatistics() {
	        return tradeDAO.getTradeStatistics();
	    }
}