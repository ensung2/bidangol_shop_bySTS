package com.shop.bidangol.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO);

	// 공지사항 상세 조회
	Map<String, Object> noticeOne(int noticeNum);

	// 공지사항 수정
	public void modifyNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	public void deleteNotice(int noticeNum);
}
