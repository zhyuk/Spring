package com.spring.mom.svc.impl;

import java.util.List;

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

	@Override
	public List<OrderVO> getoderlist(OrderVO ovo) {
		return orderDAO.getoderlist(ovo);
	}
	
	@Override
	public List<OrderVO> adminorderList(OrderVO ovo) {
		return orderDAO.adminorderList(ovo);
	}

	@Override
	public List<OrderVO> getdetail(OrderVO ovo) {
		return orderDAO.getdetail(ovo);
	}
	@Override
	public String getmerchant_uid(OrderVO ovo) {
		return orderDAO.getmerchant_uid(ovo);
	}
	
	@Override
	public List<OrderVO> getcartdatalist(OrderVO ovo) {
		return orderDAO.getcartdatalist(ovo);
	}

	@Override
	public int insertorderdetail(OrderVO ovo) {
		return orderDAO.insertorderdetail(ovo);
	}
	
	@Override
	public int productstockup(OrderVO ovo) {
		return orderDAO.productstockup(ovo);
	}
	
	@Override
	public int productstockdown(OrderVO ovo) {
		return orderDAO.productstockdown(ovo);
	}
	
	@Override
	public void paycancel(OrderVO ovo) {
		orderDAO.paycancel(ovo);
	}

	@Override
	public int countorderlist(OrderVO ovo) {
		return orderDAO.countorderlist(ovo);
	}

}
