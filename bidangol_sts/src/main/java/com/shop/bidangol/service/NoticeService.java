package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.NoticeMapper;
import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.NoticeVO;

@Service
public class NoticeService implements NoticeServiceImpl {

	@Autowired
	private NoticeMapper mapper;

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO) {
		mapper.addNotice(noticeVO);
	}

	// 공지사항 리스트
	public List<NoticeVO> getNoticeList() {
		return mapper.getNoticeList();
	}

	// 공지사항 페이징
	public List<NoticeVO> noticePage(Paging cri) {
		return mapper.noticePage(cri);
	}

	// 공지사항 총 갯수
	public Integer noticeCount() {
		return mapper.noticeCount();
	};

	// 공지사항 상세조회
	public NoticeVO getNoticeOne(Integer noticeNum) {
		return mapper.getNoticeOne(noticeNum);
	}

	// 공지사항 조회수
	public int viewCount(Integer noticeNum) {
		return mapper.viewCount(noticeNum);
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
