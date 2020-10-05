package com.en.product.model.vo;

public class Product {
   
   private int productNo;
   private int productPrice;
   private String productName;
   private String productType;
   private String productContent;
   private String eventCode;
   private String productThumbnail;
   private String productImg1;
   private String productImg2;
   private String productImg3;
   private String productImg4;
   private String productImg5;
   
   
   public Product() {
      // TODO Auto-generated constructor stub
   }


public Product(int productNo, int productPrice, String productName, String productType, String productContent,
		String eventCode, String productThumbnail, String productImg1, String productImg2, String productImg3,
		String productImg4, String productImg5) {
	super();
	this.productNo = productNo;
	this.productPrice = productPrice;
	this.productName = productName;
	this.productType = productType;
	this.productContent = productContent;
	this.eventCode = eventCode;
	this.productThumbnail = productThumbnail;
	this.productImg1 = productImg1;
	this.productImg2 = productImg2;
	this.productImg3 = productImg3;
	this.productImg4 = productImg4;
	this.productImg5 = productImg5;
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


public String getEventCode() {
	return eventCode;
}


public void setEventCode(String eventCode) {
	this.eventCode = eventCode;
}


public String getProductThumbnail() {
	return productThumbnail;
}


public void setProductThumbnail(String productThumbnail) {
	this.productThumbnail = productThumbnail;
}


public String getProductImg1() {
	return productImg1;
}


public void setProductImg1(String productImg1) {
	this.productImg1 = productImg1;
}


public String getProductImg2() {
	return productImg2;
}


public void setProductImg2(String productImg2) {
	this.productImg2 = productImg2;
}


public String getProductImg3() {
	return productImg3;
}


public void setProductImg3(String productImg3) {
	this.productImg3 = productImg3;
}


public String getProductImg4() {
	return productImg4;
}


public void setProductImg4(String productImg4) {
	this.productImg4 = productImg4;
}


public String getProductImg5() {
	return productImg5;
}


public void setProductImg5(String productImg5) {
	this.productImg5 = productImg5;
}


@Override
public String toString() {
	return "Product [productNo=" + productNo + ", productPrice=" + productPrice + ", productName=" + productName
			+ ", productType=" + productType + ", productContent=" + productContent + ", eventCode=" + eventCode
			+ ", productThumbnail=" + productThumbnail + ", productImg1=" + productImg1 + ", productImg2=" + productImg2
			+ ", productImg3=" + productImg3 + ", productImg4=" + productImg4 + ", productImg5=" + productImg5 + "]";
}


	
	
   
}
