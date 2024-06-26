package com.shop.bidangol.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.UserVO;

@Mapper
public interface UserMapper {

	// 회원가입
	public void joinUser(UserVO userVO);

	// (관리자페이지) 회원 리스트
	public List<UserVO> getUserList();

	// 회원정보 상세조회
	public UserVO getUserOne(String id);
	
	// 회원정보 리스트(페이징)
	public List<UserVO> userPage(Paging page);
	
	// 회원 총 명수
	public Integer userCount();

	// 로그인
	public UserVO signIn(UserVO userVO);

	// 회원정보 수정
	public void modifyUser(UserVO userVO);

	// 회원정보 삭제(탈퇴)
	public void deleteUser(String id);
}
