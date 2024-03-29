package com.shop.bidangol.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("userVO")
public class UserVO {
	
	private int num;					// 회원번호
	private String id;					// 회원아이디
	private String email;				// 회원이메일
	private String password;				// 비밀번호
	private String name;				// 회원명
	private String postcode;				// 우편번호
	private String address1;				// 주소1 (기본)
	private String address2;				// 주소2 (선택)
	private String phone;					// 전화번호
	private int signdate;		// 가입일
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getSigndate() {
		return signdate;
	}
	public void setSigndate(int signdate) {
		this.signdate = signdate;
	}
	@Override
	public String toString() {
		return "UserVO [num=" + num + ", id=" + id + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", postcode=" + postcode + ", address1=" + address1 + ", address2=" + address2 + ", phone=" + phone
				+ ", signdate=" + signdate + "]";
	}
	

}
