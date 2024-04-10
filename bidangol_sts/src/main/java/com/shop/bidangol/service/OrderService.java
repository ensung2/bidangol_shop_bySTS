package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.OrderMapper;
import com.shop.bidangol.vo.OrderDetailVO;
import com.shop.bidangol.vo.OrderVO;

@Service
public class OrderService implements OrderServiceImpl {

	@Autowired
	private OrderMapper mapper;

	// 주문 정보
	public void orderPage(OrderVO orderVO) {
		mapper.orderPage(orderVO);
	};

	// 주문 정보
	public void orderPage_details(OrderDetailVO orderDetailVO) {
		mapper.orderPage_details(orderDetailVO);
	};
}
