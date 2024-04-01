package com.shop.bidangol.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO);
	
	// 공지사항 리스트
	public List<NoticeVO> getNoticeList();

	// 공지사항 상세 조회
	public NoticeVO getNoticeOne(Integer noticeNum);

	// 공지사항 수정
	public void modifyNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	public void deleteNotice(Integer noticeNum);
	
	// 공지사항 조회수
	public int viewCount(Integer noticeNum);
}
