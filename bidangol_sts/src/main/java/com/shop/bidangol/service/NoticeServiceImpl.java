package com.shop.bidangol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.NoticeVO;

@Service
public interface NoticeServiceImpl {

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO);

	// 공지사항 리스트
	public List<NoticeVO> getNoticeList();

	// 공지사항 페이징
	public List<NoticeVO> noticePage(Paging page);

	// 공지사항 총 갯수
	public Integer noticeCount();

	// 공지사항 조회수
	public int viewCount(Integer noticeNum);

	// 공지사항 상세 조회
	public NoticeVO getNoticeOne(Integer noticeNum);

	// 공지사항 수정
	public void modifyNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	public void deleteNotice(Integer noticeNum);

}
