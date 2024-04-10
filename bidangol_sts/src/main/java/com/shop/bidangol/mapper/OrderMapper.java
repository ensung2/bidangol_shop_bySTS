package com.shop.bidangol.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.vo.OrderDetailVO;
import com.shop.bidangol.vo.OrderVO;

@Mapper
public interface OrderMapper {

	// 주문 정보
	public void orderPage(OrderVO orderVO);

	// 주문 상세 정보
	public void orderPage_details(OrderDetailVO orderDetailVO);
}
