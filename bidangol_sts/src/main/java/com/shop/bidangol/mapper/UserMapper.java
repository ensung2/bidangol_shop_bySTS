package com.shop.bidangol.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.vo.UserVO;

@Mapper
public interface UserMapper {

	// 회원가입
	public void joinUser(UserVO userVO);

	// 회원정보 상세조회
	UserVO getUserOne(String id);
}
