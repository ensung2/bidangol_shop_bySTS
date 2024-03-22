package com.shop.bidangol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping("/notice")
	public String noticePage() {
		return "notice/notice";
	}
	
	@GetMapping("/notice/write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

}
