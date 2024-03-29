package com.shop.bidangol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.UserMapper;
import com.shop.bidangol.vo.NoticeVO;
import com.shop.bidangol.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
public interface NoticeServiceImpl {

	// 공지사항 등록
	public void addNotice(NoticeVO noticeVO);

	// 공지사항 상세 조회
	Map<String, Object> noticeOne(int noticeNum);

	// 공지사항 수정
	public void modifyNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	public void deleteNotice(int noticeNum);

}
