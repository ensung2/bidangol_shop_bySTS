package com.shop.bidangol.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.bidangol.vo.ItemVO;

@Mapper
public interface ItemMapper {

	// 상품(아이템) 등록
	public void addItem(ItemVO ItemVO);

	// 상품(아이템) 리스트
	public List<ItemVO> getItemList();

	// 01 bestItem 리스트
	public List<ItemVO> getBestItem();
	
	// 01 bestItem 아이템 갯수
	public Integer getCountBest(Integer itemNum);

	// 02 찹쌀떡 리스트
	public List<ItemVO> getTteok01();

	// 03 멥쌀떡 리스트
	public List<ItemVO> getTteok02();

	// 04 떡케이크 리스트
	public List<ItemVO> getTteokCake();

	// 상품(아이템) 상세 조회
	public ItemVO getItemOne(Integer ItemNum);

	// 상품(아이템) 수정
	public void modifyItem(ItemVO ItemVO);

	// 상품(아이템) 삭제
	public void deleteItem(Integer ItemNum);

}
