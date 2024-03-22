package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
	
	// mypage 기본화면 (주문/조회)
	@GetMapping("/myPage/order")
	public String myPageOrder() {
		return "myPage/orderCheck";
	}
	
	@GetMapping("/myPage/userInfo")
	public String myPageInfo() {
		return "myPage/userInfo";
	}

}
