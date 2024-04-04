package com.shop.bidangol.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("userVO")
public class UserVO {
	private Integer num;					// 회원번호
	private String id;					// 회원아이디
	private String email;				// 회원이메일
	private String password;				// 비밀번호
	private String name;				// 회원명
	private String postcode;				// 우편번호
	private String address1;				// 주소1 (기본)
	private String address2;				// 주소2 (선택)
	
	// 전화번호가 0으로 시작하거나 포함될경우
	// int일떈 오류가 생김!! String으로! 
	private String phone;					// 전화번호
	private String phone2;					// 전화번호 (중간)
	private String phone3;					// 전화번호 (마지막)
	private Date signdate;		// 가입일
	
	private String role;			// 관리자 : admin, 회원 : user
	
}
