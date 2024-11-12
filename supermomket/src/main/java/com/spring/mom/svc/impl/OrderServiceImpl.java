package com.spring.mom.svc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.OrderDAO;
import com.spring.mom.svc.OrderService;
import com.spring.mom.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public void insertorderList(OrderVO ovo) {
		orderDAO.insertorderList(ovo);
	}

}
