package com.shop.bidangol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.bidangol.service.CartService;
import com.shop.bidangol.vo.CartListVO;
import com.shop.bidangol.vo.CartVO;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;


	// 장바구니 추가
	@ResponseBody
	@PostMapping("/cart/addCart")
	public int addCart(CartVO cartVO, HttpSession session) throws Exception {
		int result = 0;
		UserVO userVO = (UserVO) session.getAttribute("user");
		if (userVO != null) {
			cartVO.setId(userVO.getId());
			cartService.addCart(cartVO);
			result = 1;
		}
		return result;
	}

	// 장바구니 리스트
	@GetMapping("/cart/cartPage")
	public void cartPage(Model model, HttpSession session) throws Exception {
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();
		
		List<CartListVO> cartList = cartService.cartList(id);
		model.addAttribute("cartList", cartList);
	}
	
	// 장바구니 (체크박스) 삭제
	@PostMapping("/cart/deleteCart")
	public ResponseEntity<Integer> deleteCart(HttpSession session, @RequestParam(value = "selectCheck[]") List<String> arr, CartVO cartVO) throws Exception {
	    UserVO userVO = (UserVO)session.getAttribute("user");
	    if (userVO == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	    }

	    String id = userVO.getId();
	    int result = 0;

	    cartVO.setId(id);
	    for (String i : arr) {
	        int cartNum = Integer.parseInt(i);
	        cartVO.setCartNum(cartNum);
	        cartService.deleteCart(cartVO);
	    }
	    result = 1;
	    return ResponseEntity.ok(result);
	}

}
