package com.spring.mom.svc;

import java.util.List;

import com.spring.mom.vo.OrderVO;

public interface OrderService {
	
	public void insertorderList(OrderVO ovo);
	
	public List<OrderVO> getoderlist(OrderVO ovo);
	
	public List<OrderVO> adminorderList(OrderVO ovo);
	
	public List<OrderVO> getcartdatalist(OrderVO ovo);

	public String getmerchant_uid(OrderVO ovo);
	
	public List<OrderVO> getdetail(OrderVO ovo);
	
	public int insertorderdetail(OrderVO ovo);

	public int productstockup(OrderVO ovo);
	
	public int countorderlist(OrderVO ovo);
	
	public int productstockdown(OrderVO ovo);
	
	public void paycancel(OrderVO ovo);

}
