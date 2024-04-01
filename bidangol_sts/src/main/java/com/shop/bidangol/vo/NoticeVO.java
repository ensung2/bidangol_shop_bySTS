package com.shop.bidangol.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private Integer noticeNum;
	private String noticeName;
	private String noticeOption;
	private String noticeContent;
	private Integer noticeCount;
	private Date noticeDate;

}
