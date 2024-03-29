package com.shop.bidangol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.UserMapper;
import com.shop.bidangol.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
public interface UserServiceImpl {

	// 회원가입
	public void joinUser(UserVO userVO);

	// 회원정보 상세 조회
	UserVO getUserOne(String id);

}
