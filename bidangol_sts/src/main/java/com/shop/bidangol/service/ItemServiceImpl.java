package com.shop.bidangol.service;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.shop.bidangol.vo.ItemVO;
import com.shop.bidangol.vo.NoticeVO;

@Service
public interface ItemServiceImpl {

	// 상품(아이템) 등록
	public void addItem(ItemVO ItemVO);

	// 상품(아이템) 리스트
	public List<ItemVO> getItemList();
	
	// 상품(아이템) 상세정보
	public ItemVO getItemOne(Integer ItemNum);

	// 상품(아이템) 수정
	public void modifyItem(ItemVO ItemVO);

	// 상품(아이템) 삭제
	public void deleteItem(Integer ItemNum);

}
