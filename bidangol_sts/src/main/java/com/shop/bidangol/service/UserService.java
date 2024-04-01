package com.shop.bidangol.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.UserMapper;
import com.shop.bidangol.vo.UserVO;

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
	public UserVO loginCheck(String id, String password) {
		Map<String, String> credentials = new HashMap<>();
		credentials.put("id", id);
		credentials.put("password", password);
		return mapper.loginCheck(credentials);
	}

}
