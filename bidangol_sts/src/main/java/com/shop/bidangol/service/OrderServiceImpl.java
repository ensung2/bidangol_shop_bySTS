package com.shop.bidangol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.OrderDetailVO;
import com.shop.bidangol.vo.OrderListVO;
import com.shop.bidangol.vo.OrderVO;

@Service
public interface OrderServiceImpl {

	// 주문 정보
	public void orderPage(OrderVO orderVO);

	// 주문 상세 정보
	public void orderPage_details(OrderDetailVO orderDetailVO);

	// 주문 총 갯수
	public Integer orderCount();

	// 주문 리스트
	public List<OrderVO> orderList(OrderVO orderVO);

	// 주문 리스트(페이징)
	public List<OrderVO> orderPaging(Paging page);

	// 주문 상세 조회
	public List<OrderListVO> orderView(OrderVO orderVO);

	// (회원) 주문 취소(삭제)
	public void deleteOrder(OrderVO orderVO);
	public void deleteOrderDetails(OrderDetailVO orderDetailVO);
	
	/* ========================== 관리자 페이지 ============================ */

	// (관리자페이지) 전체 주문 리스트
	public List<OrderVO> adminOrderList();

	// (관리자페이지) 주문 상세 조회
	public List<OrderListVO> adminOrderView(OrderVO orderVO);

	// (관리자페이지) 주문 상태 수정
	public void orderStatusUpdate(OrderVO orderVO);

}
