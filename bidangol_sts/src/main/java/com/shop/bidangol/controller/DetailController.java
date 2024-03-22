package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DetailController {
	
	@GetMapping("/category/01/detail")
	public String itemDetailPage() {
		return "category/itemDetail";
	}
	

}
