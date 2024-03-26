package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	
	
	@GetMapping("/order/orderNum")
	public String orderPage() {
		return "/order/orderPage";
	}
	
	@GetMapping("/order/orderResult")
	public String orderResult() {
		return "/order/orderResult";
	}
}
