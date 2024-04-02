package com.shop.bidangol.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.bidangol.service.ItemService;
import com.shop.bidangol.service.UserService;
import com.shop.bidangol.utils.UploadFileUtils;
import com.shop.bidangol.vo.ItemVO;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@Value("${uploadPath}")
	private String uploadPath;

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

	// 상품 등록폼
	@GetMapping("/admin/adminItem/itemAdd")
	public String adminItemAddForm() {
		return "admin/itemAdd";
	}

	// 상품 등록 전송
	@PostMapping("/admin/adminItem/new")
	public String adminItemNew(@ModelAttribute ItemVO itemVO, @ModelAttribute("file") MultipartFile file) throws Exception {

		// 파일이 저장될 기본 폴더
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file != null && !file.isEmpty()) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		itemVO.setItemImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		itemVO.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		itemService.addItem(itemVO);
		return "admin/adminItem";
	}

}
