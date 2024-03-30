package com.shop.bidangol.service;

import java.util.Map;
import org.springframework.stereotype.Service;
import com.shop.bidangol.vo.ItemVO;

@Service
public interface ItemServiceImpl {

	// 상품(아이템) 등록
	public void addItem(ItemVO ItemVO);

	// 상품(아이템) 상세 조회
	Map<String, Object> getItemOne(int ItemNum);

	// 상품(아이템) 수정
	public void modifyItem(ItemVO ItemVO);

	// 상품(아이템) 삭제
	public void deleteItem(int ItemNum);

}
