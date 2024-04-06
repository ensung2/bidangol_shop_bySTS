package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shop.bidangol.mapper.UserMapper;
import com.shop.bidangol.vo.UserVO;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService implements UserServiceImpl {

	@Autowired
	private UserMapper mapper;

	// 회원가입
	public void joinUser(UserVO userVO) {
		mapper.joinUser(userVO);
	}

	// (관리자페이지) 회원 리스트
	public List<UserVO> getUserList() {
		return mapper.getUserList();
	}

	// 회원정보 상세조회
	public UserVO getUserOne(String id) {
		return mapper.getUserOne(id);

	}

	// 로그인
	public UserVO signIn(UserVO userVO) {
		return mapper.signIn(userVO);
	}

	// 로그아웃
	public void signOut(HttpSession session) {
		session.invalidate();
	}

	// 회원정보 수정
	public void modifyUser(UserVO userVO) {
		mapper.modifyUser(userVO);
	};

	// 회원정보 삭제(탈퇴)
	public void deleteUser(String id) {
		mapper.deleteUser(id);
	};

}
