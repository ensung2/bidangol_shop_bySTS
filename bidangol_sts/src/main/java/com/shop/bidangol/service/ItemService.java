package com.shop.bidangol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.bidangol.mapper.ItemMapper;
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

	// 상품(아이템) 상세조회
	public Map<String, Object> getItemOne(int ItemNum) {
		Map<String, Object> Item = mapper.getItemOne(ItemNum);
		return Item;
	}

	// 상품(아이템) 수정
	public void modifyItem(ItemVO ItemVO) {
		mapper.modifyItem(ItemVO);
	}

	// 상품(아이템) 삭제
	public void deleteItem(int ItemNum) {
		mapper.deleteItem(ItemNum);
	}

}
