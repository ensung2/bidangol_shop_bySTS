package com.shop.bidangol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.NoticeMapper;
import com.shop.bidangol.vo.NoticeVO;


@Service
public class NoticeService implements NoticeServiceImpl {

	@Autowired
	private NoticeMapper mapper;

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO) {
		mapper.addNotice(noticeVO);
	}

	// 공지사항 상세조회
	public Map<String, Object> noticeOne(int noticeNum) {
		Map<String, Object> notice = mapper.noticeOne(noticeNum);
		return notice;
	}

	// 공지사항 수정
	public void modifyNotice(NoticeVO noticeVO) {
		mapper.modifyNotice(noticeVO);
	}

	// 문의 삭제
	public void deleteNotice(int noticeNum) {
		mapper.deleteNotice(noticeNum);
	}

}
