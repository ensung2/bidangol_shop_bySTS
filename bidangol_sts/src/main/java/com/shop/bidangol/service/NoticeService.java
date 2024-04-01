package com.shop.bidangol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.NoticeMapper;
import com.shop.bidangol.vo.NoticeVO;
import com.shop.bidangol.vo.UserVO;


@Service
public class NoticeService implements NoticeServiceImpl {

	@Autowired
	private NoticeMapper mapper;

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO) {
		mapper.addNotice(noticeVO);
	}
	
	// 공지사항 리스트
	public List<UserVO> getNoticeList() {
		return mapper.getNoticeList();
	}

	// 공지사항 상세조회
	public NoticeVO getNoticeOne(Integer noticeNum) {
		return mapper.getNoticeOne(noticeNum);
	}
	
	// 공지사항 조회수
	public void viewCount(Integer noticeNum) {
		mapper.viewCount(noticeNum);
	}

	// 공지사항 수정
	public void modifyNotice(NoticeVO noticeVO) {
		mapper.modifyNotice(noticeVO);
	}

	// 문의 삭제
	public void deleteNotice(Integer noticeNum) {
		mapper.deleteNotice(noticeNum);
	}

}
