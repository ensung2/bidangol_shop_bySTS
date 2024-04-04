package com.shop.bidangol.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpSession;

@Service
public interface UserServiceImpl {

	// 회원가입
	public void joinUser(UserVO userVO);

	// (관리자페이지) 회원 리스트
	public List<UserVO> getUserList();

	// 회원정보 상세 조회
	public UserVO getUserOne(String id);

	// 로그인
	public UserVO signIn(UserVO userVO);
	
	// 로그아웃
	public void signOut(HttpSession session);

}
