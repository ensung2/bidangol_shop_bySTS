package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String loginPage() {
		return "login/loginPage";
	}
	
	@GetMapping("/signUp/success")
	public String successPage() {
		return "login/signSuccess";
	}
	
	@GetMapping("/signUp")
	public String signUpPage() {
		return "login/signUp";
	}

}
