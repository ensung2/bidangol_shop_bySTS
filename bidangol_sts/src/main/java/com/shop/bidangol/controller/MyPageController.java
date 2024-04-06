package com.shop.bidangol.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.bidangol.service.UserService;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;

	// 마이페이지 기본화면 (주문/조회)
	@GetMapping({ "/myPage/order", "/myPage" })
	public String myPageOrder(Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("userInfo", user);
			return "myPage/orderCheck";
		} else {
			return "redirect:/login"; // 로그인하지 않은 사용자를 로그인 페이지로 리디렉션
		}

	}

	// 마이페이지 - 주문번호(noticeNum) 불러오기 (/bidangol/admin/orderCheck?id=orderNum)
	@GetMapping("/myPage/orderId")
	public String noticeUpdatePage() {
		return "myPage/orderId";
	}

	/*
	 * =============================================================================
	 * ==
	 */

	// 마이페이지 - 회원정보
	@GetMapping("/myPage/userInfo")
	public String myPageInfo(Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("userInfo", user);
			return "myPage/userInfo";
		} else {
			return "redirect:/login";
		}
	}

	// 마이페이지 - 회원정보 수정
	@PostMapping("/myPage/modifyUser")
	public String modifyUser(UserVO userVO, HttpSession session, HttpServletRequest request, Model model) {
	    UserVO currentUser = (UserVO) session.getAttribute("user");
	    String currentPassword = request.getParameter("password");

	    if (currentUser != null && currentPassword != null) {
	        // 사용자가 입력한 현재 비밀번호와 DB에 저장된 비밀번호 비교
	        boolean passwordMatch = passEncoder.matches(currentPassword, currentUser.getPassword());

	        if (passwordMatch) {
	            // 비밀번호가 일치하면 회원 정보 수정 진행
	            userService.modifyUser(userVO);
	            // 수정된 정보를 다시 불러옴
	            UserVO updatedUser = userService.getUserOne(userVO.getId()); // 예시로 사용자 ID를 이용해 사용자 정보를 가져오는 메서드 호출
	            // 세션에 업데이트된 사용자 정보 저장
	            session.setAttribute("user", updatedUser);
	            return "redirect:/myPage/userInfo";
	        }
	    }

	    return "redirect:/home"; // 사용자 정보가 없거나 현재 비밀번호가 없을 경우 사용자 정보 페이지로 리다이렉트
	}
	
	// 비밀번호 확인
	@PostMapping("/myPage/checkPassword")
	@ResponseBody
	public Map<String, Boolean> checkPassword(@RequestParam("password") String currentPassword, HttpSession session) {
	    Map<String, Boolean> response = new HashMap<>();
	    UserVO currentUser = (UserVO) session.getAttribute("user");
	    
	    if (currentUser != null && currentPassword != null) {
	        boolean passwordMatch = passEncoder.matches(currentPassword, currentUser.getPassword());
	        response.put("success", passwordMatch);
	    } else {
	        response.put("success", false);
	    }
	    
	    return response;
	}
	
	// 마이페이지 - 회원탈퇴 (삭제)
	@PostMapping("/myPage/deleteUser")
	public String deleteUser(HttpSession session) {
	    UserVO currentUser = (UserVO) session.getAttribute("user");
	    if (currentUser != null) {
	        userService.deleteUser(currentUser.getId()); // 현재 사용자의 아이디로 회원 삭제
	        session.invalidate(); // 세션 무효화
	    }
	    return "redirect:/login";
	}
}
