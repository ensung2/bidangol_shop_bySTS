package com.shop.bidangol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop.bidangol.service.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping({"/home", "/"})
	public String homePage(Model model) {
		model.addAttribute("list", noticeService.getNoticeList());
		return "Index";
	}

}
