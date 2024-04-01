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
	

}
