package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate orderDAO;
	
//	오더리스트 정보
	public List<OrderVO> getoderlist(OrderVO ovo){
		return orderDAO.selectList("orderDAO.getoderlist",ovo);
	}
//	회원 상품 구매/취소 정보
	public List<OrderVO> adminorderList(OrderVO ovo){
		return orderDAO.selectList("orderDAO.adminorderList",ovo);
	}
//	디테일 정보
	public List<OrderVO> getcartdatalist(OrderVO ovo){
		return orderDAO.selectList("orderDAO.getcartdatalist",ovo);
	}	
//	디테일 페이지 내부 프로덕트정보
	public List<OrderVO> getdetail(OrderVO ovo){
		return orderDAO.selectList("orderDAO.getdetail",ovo);
	}	
//	디테일 페이지에 사용 머천아이디 정보
	public String getmerchant_uid(OrderVO ovo){
		return orderDAO.selectOne("orderDAO.getmerchant_uid",ovo);
	}	
	
	public void insertorderList(OrderVO ovo) {
		orderDAO.insert("orderDAO.insertorderList",ovo);
	}
	public int insertorderdetail(OrderVO ovo) {
		return orderDAO.insert("orderDAO.insertorderdetail",ovo);
	}
	public int productstockup(OrderVO ovo) {
		return orderDAO.update("orderDAO.productstockup",ovo);
	}
	
	public int productstockdown(OrderVO ovo) {
		return orderDAO.update("orderDAO.productstockdown",ovo);
	}
	public void paycancel(OrderVO ovo) {
		orderDAO.update("orderDAO.paycancel",ovo);
	}
	
	public int countorderlist(OrderVO ovo) {
		return orderDAO.selectOne("orderDAO.countorderlist",ovo);
	}
	
}
