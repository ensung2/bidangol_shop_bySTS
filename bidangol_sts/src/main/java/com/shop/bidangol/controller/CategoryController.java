package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {
	
	@GetMapping("/category/01")
	public String bestItemPage() {
		return "category/bestItem";
	}
	
	@GetMapping("/category/02")
	public String dduk01Page() {
		return "category/dduk01";
	}
	
	@GetMapping("/category/03")
	public String dduk02Page() {
		return "category/dduk02";
	}
	
	@GetMapping("/category/04")
	public String ddukCakePage() {
		return "category/ddukCake";
	}

}
