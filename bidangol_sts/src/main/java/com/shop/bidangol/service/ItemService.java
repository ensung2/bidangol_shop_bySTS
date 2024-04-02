package com.shop.bidangol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.ItemMapper;
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
