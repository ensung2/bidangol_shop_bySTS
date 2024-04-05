package com.shop.bidangol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.bidangol.service.ItemService;
import com.shop.bidangol.vo.ItemVO;

@Controller
public class CategoryController {

	@Autowired
	private ItemService itemService;

	// 01 베스트상품 카테고리 (리스트)
	@GetMapping("/category/01")
	public String bestItemPage(Model model) {
		List<ItemVO> itemList = itemService.getBestItem();
	    Integer totalCount = itemList.size();
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("list", itemList);
		return "category/bestItem";
	}

	// 02 찹쌀떡 카테고리 (리스트)
	@GetMapping("/category/02")
	public String dduk01Page(Model model) {
		List<ItemVO> itemList = itemService.getTteok01();
	    Integer totalCount = itemList.size();
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("list", itemList);
		return "category/tteok01";
	}

	// 03 멥쌀떡 카테고리 (리스트)
	@GetMapping("/category/03")
	public String dduk02Page(Model model) {
		List<ItemVO> itemList = itemService.getTteok02();
	    Integer totalCount = itemList.size();
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("list", itemList);
		return "category/tteok02";
	}

	// 04 떡케이크 카테고리 (리스트)
	@GetMapping("/category/04")
	public String ddukCakePage(Model model) {
		List<ItemVO> itemList = itemService.getTteokCake();
	    Integer totalCount = itemList.size();
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("list", itemList);
		return "category/tteokCake";
	}

	/*---------------------------------------------------------------------------*/

	// 01 베스트상품 상품(itemNum)확인 (/bidangol/category/01?itemNum=itemNum)
	@GetMapping("/category/01/itemDetail")
	public String itemDetail01(Model model, @RequestParam Integer itemNum) {
		model.addAttribute("itemInfo", itemService.getItemOne(itemNum));
		return "category/itemDetail";
	}

	// 02 찹쌀떡 상품(itemNum)확인 (/bidangol/category/02?itemNum=itemNum)
	@GetMapping("/category/02/itemDetail")
	public String itemDetail02(Model model, @RequestParam Integer itemNum) {
		model.addAttribute("itemInfo", itemService.getItemOne(itemNum));
		return "category/itemDetail";
	}

	// 03 멥쌀떡 상품(itemNum)확인 (/bidangol/category/03?itemNum=itemNum)
	@GetMapping("/category/03/itemDetail")
	public String itemDetail03(Model model, @RequestParam Integer itemNum) {
		model.addAttribute("itemInfo", itemService.getItemOne(itemNum));
		return "category/itemDetail";
	}

	// 04 떡케이크 상품(itemNum)확인 (/bidangol/category/04?itemNum=itemNum)
	@GetMapping("/category/04/itemDetail")
	public String itemDetail04(Model model, @RequestParam Integer itemNum) {
		model.addAttribute("itemInfo", itemService.getItemOne(itemNum));
		return "category/itemDetail";
	}

}
