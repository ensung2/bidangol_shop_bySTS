package com.shop.bidangol.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;		// 게시글 총 갯수
	 private int startPage;		// 페이지 시작번호
	 private int endPage;		// 페이지 끝번호
	 private boolean prev;		// 이전 페이지 이동
	 private boolean next;		// 다음 페이지 이동

	 private int displayPageNum = 5;

	 private Paging page;
	 
	 public void setPage(Paging page) {
	  this.page = page;
	 }

	 public void setTotalCount(int totalCount) {
	  this.totalCount = totalCount;
	  calcData();
	 }

	 public int getTotalCount() {
	  return totalCount;
	 }

	 public int getStartPage() {
	  return startPage;
	 }

	 public int getEndPage() {
	  return endPage;
	 }

	 public boolean isPrev() {
	  return prev;
	 }

	 public boolean isNext() {
	  return next;
	 }

	 public int getDisplayPageNum() {
	  return displayPageNum;
	 }

	 public Paging getPage() {
	  return page;
	 }
	 
	 private void calcData() {
		    endPage = (int) (Math.ceil(totalCount / (double) page.getPerPageNum()));
		    startPage = ((endPage - 1) / displayPageNum) * displayPageNum + 1;

		    int tempEndPage = startPage + displayPageNum - 1;
		    if (tempEndPage > endPage) {
		        tempEndPage = endPage;
		    }

		    prev = startPage > 1;
		    next = endPage < tempEndPage;
		}


	 
	 public String makeQuery(int page)
	 {
	    UriComponents uriComponents =
	      UriComponentsBuilder.newInstance()
	      .queryParam("page", page)
	      .build();
	      
	    return uriComponents.toUriString();
	 }

}
