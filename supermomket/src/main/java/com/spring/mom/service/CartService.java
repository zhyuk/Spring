package com.spring.mom.service;

import java.util.List;

import com.spring.mom.vo.CartVO;

public interface CartService {

	List<CartVO> getcartList(CartVO cvo);
	
	List<CartVO> getpaymenttotalcartList(CartVO cvo);

	void insertcart(CartVO cvo);
	
	void preparinsertcart(CartVO cvo);
	
	void preparallinsertcart(CartVO cvo);

	int p_total(CartVO cvo);
	
	int p_totalup(CartVO cvo);

	void deletcart(CartVO cvo);

	int carttotal(CartVO cvo);

	
	int c_change(CartVO cvo);
	
}	
