package com.shop.bidangol.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {
	
	private String orderId;		// 주문번호
	private String id;			// 주문자 아이디
	private String name;		// 주문자 이름
	private String email;		// 주문자 이메일
	private String postcode;	// 우편번호
	private String address1;	// 주소1 (기본)
	private String address2;	// 주소1 (기본)
	private String phone;		// 전화번호
	private String phone2;		// 전화번호 (중간)
	private String phone3;		// 전화번호 (마지막)
	private String memo;		// 배송메세지
	private Integer orderTotal;	// 총 주문금액
	private String bank;		// 무통장입금-은행정보
	private Date orderDate;		// 주문날짜
	private String orderStatus;	// 주문상태 (관리자페이지에서 수정)
	
	private Integer orderDetailsNum;
	private Integer itemNum;			// 상품번호
	private Integer cartCount;			// 주문수량
	
	private String itemName;
	private Integer itemPrice;
	private Integer itemSize;
	private String itemImg;	
	
}
