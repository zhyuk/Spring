package com.spring.mom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate cartmybatis;
	
	public List<CartVO> getcartList(CartVO cvo) {
		return cartmybatis.selectList("CartDAO.getcartList",cvo);
		}
	public List<CartVO> getpaymenttotalcartList(CartVO cvo) {
		return cartmybatis.selectList("CartDAO.getpaymenttotalcartList",cvo);}
	
	public CartVO getc_nodata(CartVO cvo) {
		return cartmybatis.selectOne("CartDAO.getc_nodata",cvo);
	}
	public int cartequals(String u_id, int p_no) {
		  Map<String, Object> params = new HashMap<>();
	        params.put("u_id", u_id);
	        params.put("p_no", p_no);
		return cartmybatis.selectOne("CartDAO.cartequals",params);
	}
	public void insertcart(CartVO cvo) {
		cartmybatis.insert("CartDAO.insertcart",cvo);
	}
	
	public int insertproduct(CartVO cvo) {
		return cartmybatis.insert("CartDAO.insertproduct",cvo);
	}
	public int paycomplete(CartVO cvo) {
		return cartmybatis.update("CartDAO.paycomplete",cvo);
	}
	public int carttotal(CartVO cvo) {
//		System.out.println("토탈"+cvo);
		return  cartmybatis.selectOne("CartDAO.carttotal",cvo);
	}
	public void preparinsertcart(CartVO cvo) {
		cartmybatis.update("CartDAO.preparinsertcart",cvo);
	}
	public void preparallinsertcart(CartVO cvo) {
		cartmybatis.update("CartDAO.preparinsertcart",cvo);
	}
			
	public int p_total(CartVO cvo) {
		return cartmybatis.selectOne("CartDAO.p_total",cvo);
	}
	public int p_totalup(CartVO cvo) {
		return cartmybatis.update("CartDAO.p_totalup",cvo);
	}
	public int c_change(CartVO cvo) {
		return cartmybatis.update("CartDAO.c_change",cvo);
	}
	
	public void deletcart(CartVO cvo) {
		cartmybatis.delete("CartDAO.deletcart",cvo);
	}
	public int cartcount(CartVO cvo) {
		return cartmybatis.selectOne("CartDAO.cartcount",cvo);
	}

	
}
