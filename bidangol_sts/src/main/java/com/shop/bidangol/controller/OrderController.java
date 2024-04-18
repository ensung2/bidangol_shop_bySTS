package com.shop.bidangol.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.bidangol.service.CartService;
import com.shop.bidangol.service.OrderService;
import com.shop.bidangol.vo.CartListVO;
import com.shop.bidangol.vo.OrderDetailVO;
import com.shop.bidangol.vo.OrderListVO;
import com.shop.bidangol.vo.OrderVO;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	// 주문 페이지 (장바구니 리스트에서 넘어옴)
	@GetMapping("/order/orderPage")
	public void orderPage(Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();
		List<CartListVO> cartList = cartService.cartList(id);
		model.addAttribute("cartList", cartList);
		model.addAttribute("userInfo", userVO);
	}
	
	/*
	 * // 상세페이지에서 바로주문
	 * 
	 * @GetMapping("/order/orderPage2") public String orderPage(HttpSession session,
	 * Model model, @RequestParam("itemNum") Integer itemNum) { UserVO userVO =
	 * (UserVO) session.getAttribute("user"); String id = userVO.getId(); // 상품 정보
	 * 조회 및 모델에 추가 ItemVO item = itemService.getItemOne(itemNum);
	 * model.addAttribute("item", item); model.addAttribute("userInfo", userVO);
	 * return "/order/orderPage2"; }
	 */



	// 주문 메서드
	/* @RequestMapping(value="/order/orderResult", method = RequestMethod.POST) */
	@PostMapping("/order/orderPage")
	public String orderPage(HttpSession session, OrderVO orderVO, OrderDetailVO orderDetailVO,
			RedirectAttributes redirectAttributes) throws Exception {
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "-" + subNum;

		orderVO.setOrderId(orderId);
		orderVO.setId(id);

		orderService.orderPage(orderVO);

		orderDetailVO.setOrderId(orderId);
		orderService.orderPage_details(orderDetailVO);

		cartService.cartAllDelete(id);
		
		
		// 리디렉션 시 주문 번호를 파라미터로 전달
	    redirectAttributes.addAttribute("orderId", orderId);

		return "redirect:/order/orderResult";
	}

	// 주문 결과 확인
	@GetMapping("/order/orderResult")
	public void orderResult(HttpSession session, @RequestParam("orderId") String orderId,
			OrderVO orderVO, Model model) throws Exception {
		
		UserVO user = (UserVO)session.getAttribute("user");
		String id = user.getId();
		
		orderVO.setId(id);
		orderVO.setOrderId(orderId);
		
		List<OrderListVO> orderView = orderService.orderView(orderVO);
		model.addAttribute("orderView",orderView);
		model.addAttribute("userInfo", user);
	}

}
