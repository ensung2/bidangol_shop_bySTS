package com.shop.bidangol.service;

import org.springframework.stereotype.Service;

import com.shop.bidangol.vo.OrderDetailVO;
import com.shop.bidangol.vo.OrderVO;

@Service
public interface OrderServiceImpl {

	// 주문 정보
	public void orderPage(OrderVO orderVO);
	
	// 주문 상세 정보
	public void orderPage_details(OrderDetailVO orderDetailVO);

}
