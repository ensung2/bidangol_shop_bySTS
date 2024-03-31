package com.shop.bidangol.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeNum;
	private String noticeName;
	private String noticeOption;
	private String noticeContent;
	private int noticeCount;
	private Date noticeDate;

}
