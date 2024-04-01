package com.shop.bidangol.controller;

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
	public String noticePage(Model model) {
		model.addAttribute("list", noticeService.getNoticeList());
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

	// 공지사항 - 상세 조회
	@GetMapping("/notice/noticeId")
	public void noticeIdPage(Model model, @RequestParam Integer noticeNum) {
		noticeService.viewCount(noticeNum);
		model.addAttribute("noticeInfo", noticeService.getNoticeOne(noticeNum));
	}

	// 공지사항 - 글 수정(페이지 이동)
	@GetMapping("/notice/noticeUpdate")
	public void noticeUpdatePage(Model model, @RequestParam Integer noticeNum) {
		model.addAttribute("noticeInfo", noticeService.getNoticeOne(noticeNum));
	}

	// 공지사항 - 글 수정(수정 메소드)
	@PostMapping("/notice/noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO) {
		noticeService.modifyNotice(noticeVO);
		return "redirect:/notice";
	}

	// 공지사항 - 글 삭제
	@PostMapping("/notice/noticeDelete")
	public String noticeDelete(@RequestParam Integer noticeNum) {
		noticeService.deleteNotice(noticeNum);
		return "redirect:/notice";
	}

}
