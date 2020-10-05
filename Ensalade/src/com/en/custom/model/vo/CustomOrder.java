package com.en.custom.model.vo;

public class CustomOrder {
	
	private int customNo;
	private int customPrice;
	private String customName;
	private String customType;
	private String customComment;
	private String memberId;
	
	public CustomOrder() {
		// TODO Auto-generated constructor stub
	}

	public CustomOrder(int customNo, int customPrice, String customName, String customType, String customComment,
			String memberId) {
		super();
		this.customNo = customNo;
		this.customPrice = customPrice;
		this.customName = customName;
		this.customType = customType;
		this.customComment = customComment;
		this.memberId = memberId;
	}

	public int getCustomNo() {
		return customNo;
	}

	public void setCustomNo(int customNo) {
		this.customNo = customNo;
	}

	public int getCustomPrice() {
		return customPrice;
	}

	public void setCustomPrice(int customPrice) {
		this.customPrice = customPrice;
	}

	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}

	public String getCustomType() {
		return customType;
	}

	public void setCustomType(String customType) {
		this.customType = customType;
	}

	public String getCustomComment() {
		return customComment;
	}

	public void setCustomComment(String customComment) {
		this.customComment = customComment;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "CustomOrder [customNo=" + customNo + ", customPrice=" + customPrice + ", customName=" + customName
				+ ", customType=" + customType + ", customComment=" + customComment + ", memberId=" + memberId + "]";
	}
	
	
	
	

}
