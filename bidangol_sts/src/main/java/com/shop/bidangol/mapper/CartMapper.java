package com.shop.bidangol.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.vo.CartListVO;
import com.shop.bidangol.vo.CartVO;

@Mapper
public interface CartMapper {

	// 장바구니 추가
	public void addCart(CartVO cartVO);

	// 장바구니 리스트
	public List<CartListVO> cartList(String id);
	
	// 장바구니 (체크박스)삭제
	public void deleteCart(CartVO cartVO);
	
	// (주문 후) 장바구니 비우기
	public void cartAllDelete(String id);
}
