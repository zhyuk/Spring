package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.CartVO;

public interface CartService {

	List<CartVO> getcartList(CartVO cvo);
	
	List<CartVO> getpaymenttotalcartList(CartVO cvo);

	CartVO getc_nodata(CartVO cvo);
	
	int cartequals(String u_id, int p_no);
	
	void insertcart(CartVO cvo);
	
	int insertproduct(CartVO cvo);
	
	int cartcount(CartVO cvo);
	
	int paycomplete(CartVO cvo);
	
	void preparinsertcart(CartVO cvo);
	
	void preparallinsertcart(CartVO cvo);

	void deletcart(CartVO cvo);
	
	int p_total(CartVO cvo);
	
	int p_totalup(CartVO cvo);


	int carttotal(CartVO cvo);

	
	int c_change(CartVO cvo);
	
}	
