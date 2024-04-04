package com.shop.bidangol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.bidangol.service.UserService;
import com.shop.bidangol.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	// 로그인 페이지 진입
	@GetMapping("/login")
	public String loginPage() {
		return "login/loginPage";
	}

	// 회원가입 페이지 진입
	@GetMapping("/signUp")
	public String signUpPage() {
		return "login/signUp";
	}

	// 회원가입
	@PostMapping("/signUp/joinUser")
	public String joinUser(@ModelAttribute UserVO userVO) {
		
		  String inputPass = userVO.getPassword();
		  String pass = passEncoder.encode(inputPass); userVO.setPassword(pass);
		 
		userService.joinUser(userVO);
		return "Index";
	}

	// 회원가입 성공시 페이지
	@GetMapping("/signUp/success")
	public String successPage(@RequestParam String id, Model model) {
		model.addAttribute("userVO", new UserVO());
		return "login/signSuccess";
	}

	// 정보입력 후 로그인 시도
	@PostMapping("/login/action")
	@ResponseBody
	public String login(@RequestParam("id") String id, @RequestParam("password") String password) {
		UserVO userVO = userService.loginCheck(id, password);
		if (id != null) {
			return "success";
		} else {
			return "failure";
		}
	}

}
