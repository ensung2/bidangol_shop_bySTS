package com.shop.bidangol.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.ItemVO;

@Service
public interface ItemServiceImpl {

	// 상품(아이템) 등록
	public void addItem(ItemVO ItemVO);

	// 상품(아이템) 리스트
	public List<ItemVO> getItemList();

	// 01 bestItem 리스트
	public List<ItemVO> getBestItem();

	// 02 찹쌀떡 리스트
	public List<ItemVO> getTteok01();

	// 03 멥쌀떡 리스트
	public List<ItemVO> getTteok02();

	// 04 떡케이크 리스트
	public List<ItemVO> getTteokCake();
	
	
	// 01 bestItem 아이템 갯수
	public Integer getCountBest();
		
	// 02 찹쌀떡 아이템 갯수
	public Integer getCountTteok01();
			
	// 03 멥쌀떡 아이템 갯수
	public Integer getCountTteok02();
			
	// 04 떡케이크 아이템 갯수
	public Integer getCountTteokCake();
		
		
	
	// 상품(아이템) 리스트 + 페이징
	public List<ItemVO> itemPage(Paging page);
	
	// 상품(아이템) 총 갯수
	public Integer itemCount();

	// 상품(아이템) 상세정보
	public ItemVO getItemOne(Integer ItemNum);

	// 상품(아이템) 수정
	public void modifyItem(ItemVO ItemVO);

	// 상품(아이템) 삭제
	public void deleteItem(Integer ItemNum);

}
