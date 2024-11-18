package com.spring.mom.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.CartDAO;
import com.spring.mom.dao.OrderDAO;
import com.spring.mom.svc.CartService;
import com.spring.mom.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public List<CartVO> getcartList(CartVO cvo) {
		return cartDAO.getcartList(cvo);
	}
	
	@Override
	public List<CartVO> getpaymenttotalcartList(CartVO cvo) {
		return cartDAO.getpaymenttotalcartList(cvo);
	}
	
	
	@Override
	public CartVO getc_nodata(CartVO cvo) {
		return cartDAO.getc_nodata(cvo);
	}
	@Override
	public int cartequals(String u_id, int p_no) {
		return cartDAO.cartequals(u_id,p_no);
	}

	@Override
	public int carttotal(CartVO cvo) {
//		System.out.println("서비스 임플 carttotal");
		return cartDAO.carttotal(cvo);
	}
	@Override
	public int insertproduct(CartVO cvo) {
//		System.out.println("서비스 임플 insertproduct");
		return cartDAO.insertproduct(cvo);
	}

	

	@Override
	public void insertcart(CartVO cvo) {
		cartDAO.insertcart(cvo);
	}
	@Override
	public void preparinsertcart(CartVO cvo) {
		cartDAO.preparinsertcart(cvo);
	}
	@Override
	public void preparallinsertcart(CartVO cvo) {
		cartDAO.preparallinsertcart(cvo);
	}

	@Override
	public int p_total(CartVO cvo) {
		return  cartDAO.p_total(cvo);
	}
	
	@Override
	public int p_totalup(CartVO cvo) {
		return  cartDAO.p_totalup(cvo);
	}

	@Override
	public void deletcart(CartVO cvo) {
		cartDAO.deletcart(cvo);
	}

	@Override
	public int c_change(CartVO cvo) {
		return cartDAO.c_change(cvo);
	}

	@Override
	public int paycomplete(CartVO cvo) {
		 return cartDAO.paycomplete(cvo);
		
	}

	@Override
	public int cartcount(CartVO cvo) {
		return cartDAO.cartcount(cvo);
	}

	
	

}
