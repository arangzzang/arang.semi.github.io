package com.en.event.model.vo;

import java.sql.Date;

public class Event {
	private String eventCode;
	private String eventWriter;
	private String eventCategory;
	private String eventName;
	private Date eventWriteDate;
	private Date eventEndDate;
	private int salePer;
	private String thumnail;
	//상품뷰로 넘겨주기위한 변수
	private int productNo;
	private int productPrice;
	private String productName;
	private String productType;
	private String productContent;
	
	public Event() {
		// TODO Auto-generated constructor stub
	}

	public Event(String eventCode, String eventWriter, String eventCategory, String eventName, Date eventWriteDate,
			Date eventEndDate, int salePer, String thumnail, int productNo, int productPrice, String productName,
			String productType, String productContent) {
		super();
		this.eventCode = eventCode;
		this.eventWriter = eventWriter;
		this.eventCategory = eventCategory;
		this.eventName = eventName;
		this.eventWriteDate = eventWriteDate;
		this.eventEndDate = eventEndDate;
		this.salePer = salePer;
		this.thumnail = thumnail;
		this.productNo = productNo;
		this.productPrice = productPrice;
		this.productName = productName;
		this.productType = productType;
		this.productContent = productContent;
	}

	public String getEventCode() {
		return eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getEventWriter() {
		return eventWriter;
	}

	public void setEventWriter(String eventWriter) {
		this.eventWriter = eventWriter;
	}

	public String getEventCategory() {
		return eventCategory;
	}

	public void setEventCategory(String eventCategory) {
		this.eventCategory = eventCategory;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public Date getEventWriteDate() {
		return eventWriteDate;
	}

	public void setEventWriteDate(Date eventWriteDate) {
		this.eventWriteDate = eventWriteDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public int getSalePer() {
		return salePer;
	}

	public void setSalePer(int salePer) {
		this.salePer = salePer;
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	@Override
	public String toString() {
		return "Event [eventCode=" + eventCode + ", eventWriter=" + eventWriter + ", eventCategory=" + eventCategory
				+ ", eventName=" + eventName + ", eventWriteDate=" + eventWriteDate + ", eventEndDate=" + eventEndDate
				+ ", salePer=" + salePer + ", thumnail=" + thumnail + ", productNo=" + productNo + ", productPrice="
				+ productPrice + ", productName=" + productName + ", productType=" + productType + ", productContent="
				+ productContent + "]";
	}

	
		
}
