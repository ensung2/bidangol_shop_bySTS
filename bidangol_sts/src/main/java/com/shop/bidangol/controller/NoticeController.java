package com.shop.bidangol.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.bidangol.service.NoticeService;
import com.shop.bidangol.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	// 공지사항 리스트
	@GetMapping("/notice")
	public String noticePage() {
		return "notice/notice";
	}

	// 공지사항 작성
	@GetMapping("/notice/write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

	// 공지사항 작성(AMDIN만 가능)
	@PostMapping("/notice/write/new")
	public String noticeWrite(@ModelAttribute NoticeVO noticeVO) {
		noticeService.addNotice(noticeVO);
		return "notice/notice";
	}

	// 공지사항 - 글번호(noticeNum) (/bidangol/admin/notice?id=noticeNum)
	@GetMapping("/notice/noticeId")
	public String noticeIdPage(Model model, @RequestParam int noticeNum) {

		Map<String, Object> notice = noticeService.noticeOne(noticeNum);
		model.addAttribute("noticeNum", noticeNum);
		return "notice/noticeId";
	}

	// 공지사항 - 글번호(noticeNum) 내용수정 (/bidangol/admin/notice?id=noticeNum)
	@GetMapping("/notice/noticeUpdate")
	public String noticeUpdatePage() {
		return "notice/noticeUpdate";
	}

}
