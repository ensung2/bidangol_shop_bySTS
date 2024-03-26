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
	
	// 공지사항 - 글번호(noticeNum) (/bidangol/admin/notice?id=noticeNum)
	@GetMapping("/notice/noticeId")
	public String noticeIdPage() {
		return "notice/noticeId";
	}
	
	// 공지사항 - 글번호(noticeNum) 내용수정 (/bidangol/admin/notice?id=noticeNum)
	@GetMapping("/notice/noticeUpdate")
	public String noticeUpdatePage() {
		return "notice/noticeUpdate";
	}

}
