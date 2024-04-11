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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
		String pass = passEncoder.encode(inputPass);
		userVO.setPassword(pass);
		userService.joinUser(userVO);
		return "Index";
	}

	// 회원가입 성공시 페이지
	@GetMapping("/signUp/success")
	public String successPage(@RequestParam String id, Model model) {
		model.addAttribute("userVO", new UserVO());
		return "login/signSuccess";
	}

	// 로그인 시도
	@PostMapping("/login/action")
	public String signIn(UserVO userVO, HttpServletRequest req) throws Exception {
		UserVO login = userService.signIn(userVO);
		HttpSession session = req.getSession();
		
		// 1) 사용자 로그인 정보 확인
		if(login != null) {
			// 2) 비밀번호 일치 확인
	        boolean passMatch = passEncoder.matches(userVO.getPassword(), login.getPassword());
	        // 3) 비밀번호 일치시 세션에 사용자 정보 저장
	        if(passMatch) {
	            session.setAttribute("user", login);
	            return "redirect:/home";
	        }
	    }
	    // 실패시 로그인페이지로 리디렉션
	    session.setAttribute("user", null);
		return "/login/loginPage";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String signOut(HttpSession session) throws Exception{
		userService.signOut(session);
		return "redirect:/";
	}
	

}
