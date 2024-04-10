package com.shop.bidangol.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	
	private Integer cartNum;		// 장바구니 번호
	private String id;				// 회원아이디
	private Integer itemNum;		// 아이템 번호
	private Integer cartCount;		// 장바구니 아이템 갯수
	private String itemImg;			// 아이템 이미지
	private Date addDate;			// 장바구니 담은 날짜
	
}
