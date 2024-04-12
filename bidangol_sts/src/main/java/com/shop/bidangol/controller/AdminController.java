package com.shop.bidangol.controller;

import java.io.File;
import java.util.List;

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
import com.shop.bidangol.service.OrderService;
import com.shop.bidangol.service.UserService;
import com.shop.bidangol.utils.PageMaker;
import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.utils.UploadFileUtils;
import com.shop.bidangol.vo.ItemVO;
import com.shop.bidangol.vo.OrderListVO;
import com.shop.bidangol.vo.OrderVO;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@Value("${uploadPath}")
	private String uploadPath;

	// 관리자 페이지(default) - 유저관리 (리스트)
	/*
	 * @GetMapping({ "/admin", "/admin/adminUser" }) public String adminPage(Model
	 * model) {
	 * 
	 * model.addAttribute("list", userService.getUserList()); return
	 * "admin/adminUser"; }
	 */

	// 관리자 페이지(default) - 유저관리 (리스트 + 페이징)
	@GetMapping({ "/admin", "/admin/adminUser" })
	public String adminPage(@ModelAttribute("page") Paging page, Model model) throws Exception {
		List<UserVO> list = userService.userPage(page);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(userService.userCount());
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminUser";
	}

	// 관리자 페이지 - 주문관리 (리스트)
	/*
	 * @GetMapping("/admin/adminOrder") public String adminOrder() { return
	 * "admin/adminOrder"; }
	 */

	// 관리자 페이지 - 주문관리 (리스트+페이징)
	@GetMapping("/admin/adminOrder")
	public String adminOrder(@ModelAttribute("page") Paging page, Model model) throws Exception {

		List<OrderVO> orderList = orderService.orderPaging(page);
		model.addAttribute("list", orderList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(orderService.orderCount());
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminOrder";
	}

	// 관리자 페이지 - 상품관리 (리스트)
	/*
	 * @GetMapping("/admin/adminItem") public String adminItem(Model model) {
	 * model.addAttribute("list", itemService.getItemList()); return
	 * "admin/adminItem"; }
	 */

	// 관리자 페이지 - 상품관리 (리스트+페이징)
	@GetMapping("/admin/adminItem")
	public String adminItem(@ModelAttribute("page") Paging page, Model model) {
		List<ItemVO> list = itemService.itemPage(page);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(itemService.itemCount());
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminItem";
	}

	/*------------------------------------------------------------------------------*/

	// 관리자페이지 - 유저(userNum)정보 (/bidangol/admin/userInfo?id=id)
	@GetMapping("/admin/userInfo")
	public void adminUserInfo(Model model, @RequestParam String id) {
		model.addAttribute("userInfo", userService.getUserOne(id));
	}

	// 관리자페이지 - 주문(orderId)확인 (/bidangol/admin/orderId?id=orderId)
	@GetMapping("/admin/orderInfo")
	public void adminOrderInfo(@RequestParam("id") String orderId, OrderVO orderVO,
			Model model) throws Exception {

		orderVO.setOrderId(orderId);
		List<OrderListVO> orderView = orderService.adminOrderView(orderVO);
		
		model.addAttribute("orderView", orderView);
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
	public String adminItemNew(@ModelAttribute ItemVO itemVO, @ModelAttribute("file") MultipartFile file)
			throws Exception {

		// 1) 이미지 업로드
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
		itemVO.setThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		// 2) 상품 등록
		itemService.addItem(itemVO);
		return "admin/adminItem";
	}

	// 상품 수정(페이지 이동)
	@GetMapping("/admin/itemModify")
	public void itemModifyPage(Model model, @RequestParam Integer itemNum) {
		model.addAttribute("itemInfo", itemService.getItemOne(itemNum));
	}

	// 상품 수정(수정 메소드)
	@PostMapping("/admin/itemModify")
	public String itemModify(ItemVO itemVO, MultipartFile file, HttpServletRequest req) throws Exception {
		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("itemImg")).delete();
			new File(uploadPath + req.getParameter("thumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			itemVO.setItemImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			itemVO.setThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			itemVO.setItemImg(req.getParameter("itemImg"));
			itemVO.setThumbImg(req.getParameter("thumbImg"));

		}
		itemService.modifyItem(itemVO);
		return "redirect:/admin/adminItem";
	}

	// 상품 삭제
	@PostMapping("/admin/itemDelete")
	public String itemDelete(@RequestParam Integer itemNum, MultipartFile file, HttpServletRequest req)
			throws Exception {
		if (file != null) {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("itemImg")).delete();
			new File(uploadPath + req.getParameter("thumbImg")).delete();
		}
		itemService.deleteItem(itemNum);
		return "redirect:/admin/adminItem";
	}

}
