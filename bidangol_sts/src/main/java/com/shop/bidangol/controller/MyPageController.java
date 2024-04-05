package com.shop.bidangol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.bidangol.service.UserService;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	
	@Autowired
	private UserService userService;

	// mypage 기본화면 (주문/조회)
	@GetMapping({ "/myPage/order", "/myPage" })
	public String myPageOrder(Model model, HttpServletRequest req) throws Exception  {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		if (user != null) {
	        model.addAttribute("userInfo", user);
	        return "myPage/orderCheck";
	    } else {
	        return "redirect:/login"; // 로그인하지 않은 사용자를 로그인 페이지로 리디렉션
	    }
		
	}

	@GetMapping("/myPage/userInfo")
	public String myPageInfo(Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		if (user != null) {
	        model.addAttribute("userInfo", user);
	        return "myPage/userInfo";
	    } else {
	        return "redirect:/login"; // 로그인하지 않은 사용자를 로그인 페이지로 리디렉션
	    }
	}

	// 마이페이지 - 주문번호(noticeNum) 불러오기 (/bidangol/admin/orderCheck?id=orderNum)
	@GetMapping("/myPage/orderId")
	public String noticeUpdatePage() {
		return "myPage/orderId";
	}

}
