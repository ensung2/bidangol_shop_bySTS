package com.shop.bidangol.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private Integer orderDetailsNum;
	private String orderId;				// 주문번호
	private Integer itemNum;			// 상품번호
	private Integer cartCount;			// 주문수량
	
}
