package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.CartMapper;
import com.shop.bidangol.vo.CartListVO;
import com.shop.bidangol.vo.CartVO;

@Service
public class CartService implements CartServiceImpl {

	@Autowired
	private CartMapper mapper;

	// 장바구니 추가
	public void addCart(CartVO cartVO) {
		mapper.addCart(cartVO);
	}

	// 장바구니 리스트
	public List<CartListVO> cartList(String id) {
		return mapper.cartList(id);
	};

	// 장바구니 (체크박스)삭제
	public void deleteCart(CartVO cartVO) {
		mapper.deleteCart(cartVO);
	};

}
