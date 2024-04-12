package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.OrderMapper;
import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.OrderDetailVO;
import com.shop.bidangol.vo.OrderListVO;
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

	// 주문 총 갯수
	public Integer orderCount() {
		return mapper.orderCount();
	};

	// 주문 리스트
	public List<OrderVO> orderList(OrderVO orderVO) {
		return mapper.orderList(orderVO);
	};

	// 주문 리스트(페이징)
	public List<OrderVO> orderPaging(Paging page) {
		return mapper.orderPaging(page);
	}

	// 주문 상세 조회
	public List<OrderListVO> orderView(OrderVO orderVO) {
		return mapper.orderView(orderVO);
	};

	// (관리자페이지) 전체 주문 리스트
	public List<OrderVO> adminOrderList() {
		return mapper.adminOrderList();
	};

	// (관리자페이지) 주문 상세 조회
	public List<OrderListVO> adminOrderView(OrderVO orderVO) {
		return mapper.adminOrderView(orderVO);
	};

	// (관리자페이지) 주문 상태 수정
	public void orderStatusUpdate(OrderVO orderVO) {
		mapper.orderStatusUpdate(orderVO);
	};
}
