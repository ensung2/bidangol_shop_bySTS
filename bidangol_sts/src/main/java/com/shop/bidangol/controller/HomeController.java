package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping({"/home", "/"})
	public String homePage() {
		return "Index";
	}
	
	@GetMapping("/notice")
	public String noticePage() {
		return "notice";
	}

}
