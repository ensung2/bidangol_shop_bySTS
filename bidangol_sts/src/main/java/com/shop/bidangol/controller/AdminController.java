package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	// 관리자 페이지 기본 - 유저관리
	@GetMapping({ "/admin", "/admin/adminUser" })
	public String adminPage() {
		return "admin/adminUser";
	}

	@GetMapping("/admin/adminOrder")
	public String adminOrder() {
		return "admin/adminOrder";
	}

	@GetMapping("/admin/adminItem")
	public String adminItem() {
		return "admin/adminItem";
	}

	// 관리자페이지 - 유저(userNum)정보 (/bidangol/admin/adminUser?id=userNum)
	@GetMapping("/admin/userInfo")
	public String adminUserNum() {
		return "admin/userInfo";
	}

	// 관리자페이지 - 주문(orderNum)확인 (/bidangol/admin/adminOrder?id=orderNum)
	@GetMapping("/admin/orderInfo")
	public String adminOrderNum() {
		return "admin/orderInfo";
	}

	// 관리자페이지 - 상품(itemNum)확인 (/bidangol/admin/adminItem?id=itemNum)
	@GetMapping("/admin/itemInfo")
	public String adminItemNum() {
		return "admin/itemInfo";
	}

	@GetMapping("/admin/adminItem/itemAdd")
	public String adminItemAdd() {
		return "admin/itemAdd";
	}
}
