package com.shop.bidangol.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.shop.bidangol.vo.UserVO;

@Mapper
public interface UserMapper {

	// 회원가입
	public void joinUser(UserVO userVO);

	// (관리자페이지) 회원 리스트
	public List<UserVO> getUserList();

	// 회원정보 상세조회
	public UserVO getUserOne(String id);

	// 로그인
	UserVO loginCheck(Map<String, String> credentials);
}
