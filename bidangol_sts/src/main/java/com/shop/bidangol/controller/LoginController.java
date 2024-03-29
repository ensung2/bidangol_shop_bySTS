package com.shop.bidangol.controller;

import java.io.UnsupportedEncodingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.bidangol.service.UserService;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public String loginPage(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String id = null;

		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("id".equals(c.getName())) {
					id = c.getValue();
					break;
				}
			}
		}
		if (id != null) {
			request.setAttribute("id", id);
		}

		return "login/loginPage";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate(); // 세션종료

		return "redirect:/Index";
	}

	@GetMapping("/signUp/success")
	public String successPage(@RequestParam String id, Model model) {

		model.addAttribute("userVO", new UserVO());
		return "login/signSuccess";
	}

	@GetMapping("/signUp")
	public String signUpPage() {
		return "login/signUp";
	}

	// 회원가입
	@PostMapping("/signUp/joinUser")
	public String joinUser(@ModelAttribute UserVO userVO) {
		userService.joinUser(userVO);
		return "Index";
	}

}
