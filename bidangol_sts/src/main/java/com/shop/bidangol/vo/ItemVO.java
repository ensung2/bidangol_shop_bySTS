package com.shop.bidangol.vo;

import lombok.Data;

@Data
public class ItemVO {
	private Integer itemNum;
	private String itemCategory;
	private String itemNo;		// itemNum+itemCategory
	private String itemName;
	private String itemInfo;
	private String itemMeterial;
	private String itemUsedate;
	private Integer itemPrice;
	private Integer itemSize;
	
	private String itemImg;		// 상품 이미지
	private String thumbImg;
	
	private Integer totalCount;

}
