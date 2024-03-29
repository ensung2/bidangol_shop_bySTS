package com.shop.bidangol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.bidangol.mapper.UserMapper;
import com.shop.bidangol.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
public class UserService implements UserServiceImpl {

	@Autowired
	private UserMapper mapper;

	// 회원가입
	public void joinUser(UserVO userVO) {
		mapper.joinUser(userVO);
	}

	// 회원정보 상세조회
	public UserVO getUserOne(String id) {
		UserVO userVO = mapper.getUserOne(id);
		return userVO;
	}

}
