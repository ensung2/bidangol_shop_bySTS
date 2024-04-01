package com.shop.bidangol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.bidangol.service.ItemService;
import com.shop.bidangol.service.UserService;
import com.shop.bidangol.vo.ItemVO;

@Controller
public class AdminController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	// 관리자 페이지(default) - 유저관리 (리스트)
	@GetMapping({ "/admin", "/admin/adminUser" })
	public String adminPage(Model model) {
		model.addAttribute("list", userService.getUserList());
		return "admin/adminUser";
	}
	
	// 관리자 페이지 - 주문관리 (리스트)
	@GetMapping("/admin/adminOrder")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	
	// 관리자 페이지 - 상품관리 (리스트)
	@GetMapping("/admin/adminItem")
	public String adminItem(Model model) {
		model.addAttribute("list", itemService.getItemList());
		return "admin/adminItem";
	}
	
	/*------------------------------------------------------------------------------*/
	
	// 관리자페이지 - 유저(userNum)정보 (/bidangol/admin/userInfo?id=id)
	@GetMapping("/admin/userInfo")
	public void adminUserInfo(Model model, @RequestParam String id) {
		model.addAttribute("userInfo", userService.getUserOne(id));
	}

	// 관리자페이지 - 주문(orderNum)확인 (/bidangol/admin/adminOrder?id=orderNum)
	@GetMapping("/admin/orderInfo")
	public String adminOrderNum() {
		return "admin/orderInfo";
	}

	// 관리자페이지 - 상품(itemNum)확인 (/bidangol/admin/itemInfo?itemNum=itemNum)
	@GetMapping("/admin/itemInfo")
	public void adminItemInfo(Model model, @RequestParam Integer itemNum) {
		model.addAttribute("itemInfo", itemService.getItemOne(itemNum));
	}

	@GetMapping("/admin/adminItem/itemAdd")
	public String adminItemAdd() {
		return "admin/itemAdd";
	}

	@PostMapping("/admin/adminItem/new")
	public String adminItemNew(@ModelAttribute ItemVO itemVO) {
		itemService.addItem(itemVO);
		return "admin/adminItem";
	}
}
