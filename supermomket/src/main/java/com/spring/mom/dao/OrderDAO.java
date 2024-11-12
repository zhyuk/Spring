package com.spring.mom.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate orderDAO;
	
	
	
	public void insertorderList(OrderVO ovo) {
		orderDAO.insert("orderDAO.insertorderList",ovo);
	}
	
	
}
