package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.ItemMapper;
import com.shop.bidangol.utils.Paging;
import com.shop.bidangol.vo.ItemVO;

@Service
public class ItemService implements ItemServiceImpl {

	@Autowired
	private ItemMapper mapper;

	// 상품(아이템) 등록
	public void addItem(ItemVO ItemVO) {
		mapper.addItem(ItemVO);
	}

	// 상품(아이템) 리스트
	public List<ItemVO> getItemList() {
		return mapper.getItemList();
	}

	// 01 bestItem 리스트
	public List<ItemVO> getBestItem() {
		return mapper.getBestItem();
	}

	// 02 찹쌀떡 리스트
	public List<ItemVO> getTteok01() {
		return mapper.getTteok01();
	}

	// 03 멥쌀떡 리스트
	public List<ItemVO> getTteok02() {
		return mapper.getTteok02();
	}

	// 04 떡케이크 리스트
	public List<ItemVO> getTteokCake() {
		return mapper.getTteokCake();
	}
	
	/*========================================================*/
	
	// 01 bestItem 아이템 갯수
	public Integer getCountBest() {
		return mapper.getCountBest();
	}
		
	// 02 찹쌀떡 아이템 갯수
	public Integer getCountTteok01() {
		return mapper.getCountTteok01();
	}
		
	// 03 멥쌀떡 아이템 갯수
	public Integer getCountTteok02() {
		return mapper.getCountTteok02();
	}
		
	// 04 떡케이크 아이템 갯수
	public Integer getCountTteokCake() {
		return mapper.getCountTteokCake();
	}
	
	
	/*========================================================*/
	
	
	// 상품(아이템) 리스트 + 페이징
	public List<ItemVO> itemPage(Paging page) {
		return mapper.itemPage(page);
	}
	
	// 상품(아이템) 총 갯수
	public Integer itemCount() {
		return mapper.itemCount();
	}
	
	// 상품(아이템) 상세조회
	public ItemVO getItemOne(Integer ItemNum) {
		return mapper.getItemOne(ItemNum);
	}

	// 상품(아이템) 수정
	public void modifyItem(ItemVO ItemVO) {
		mapper.modifyItem(ItemVO);
	}

	// 상품(아이템) 삭제
	public void deleteItem(Integer ItemNum) {
		mapper.deleteItem(ItemNum);
	}

}
