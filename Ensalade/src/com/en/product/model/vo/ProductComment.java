package com.en.product.model.vo;

import java.util.Date;

public class ProductComment {
	
	private int ProductCommentNo;
	private int ProductCommentLevel;
	private String ProductCommentWriter;
	private String ProductCommentContent;
	private int ProductRef;
	private Date ProductCommentDate;
	private int ProductCommentRef;
	
	
	public ProductComment() {
		// TODO Auto-generated constructor stub
	}


	

	public ProductComment(int productCommentNo, int productCommentLevel, String productCommentWriter,
			String productCommentContent, int productRef, Date productCommentDate, int productCommentRef) {
		super();
		ProductCommentNo = productCommentNo;
		ProductCommentLevel = productCommentLevel;
		ProductCommentWriter = productCommentWriter;
		ProductCommentContent = productCommentContent;
		ProductRef = productRef;
		ProductCommentDate = productCommentDate;
		ProductCommentRef = productCommentRef;
	}




	public int getProductCommentNo() {
		return ProductCommentNo;
	}




	public void setProductCommentNo(int productCommentNo) {
		ProductCommentNo = productCommentNo;
	}




	public int getProductCommentLevel() {
		return ProductCommentLevel;
	}




	public void setProductCommentLevel(int productCommentLevel) {
		ProductCommentLevel = productCommentLevel;
	}




	public String getProductCommentWriter() {
		return ProductCommentWriter;
	}




	public void setProductCommentWriter(String productCommentWriter) {
		ProductCommentWriter = productCommentWriter;
	}




	public String getProductCommentContent() {
		return ProductCommentContent;
	}




	public void setProductCommentContent(String productCommentContent) {
		ProductCommentContent = productCommentContent;
	}




	public int getProductRef() {
		return ProductRef;
	}




	public void setProductRef(int productRef) {
		ProductRef = productRef;
	}




	public Date getProductCommentDate() {
		return ProductCommentDate;
	}




	public void setProductCommentDate(Date productCommentDate) {
		ProductCommentDate = productCommentDate;
	}




	public int getProductCommentRef() {
		return ProductCommentRef;
	}




	public void setProductCommentRef(int productCommentRef) {
		ProductCommentRef = productCommentRef;
	}


	

	@Override
	public String toString() {
		return "ProductComment [ProductCommentNo=" + ProductCommentNo + ", ProductCommentLevel=" + ProductCommentLevel
				+ ", ProductCommentWriter=" + ProductCommentWriter + ", ProductCommentContent=" + ProductCommentContent
				+ ", ProductRef=" + ProductRef + ", ProductCommentDate=" + ProductCommentDate + ", ProductCommentRef="
				+ ProductCommentRef + "]";
	}




	public ProductComment( int productCommentLevel, String productCommentWriter,
			String productCommentContent, int productRef, int productCommentRef) {
		super();
	
		ProductCommentLevel = productCommentLevel;
		ProductCommentWriter = productCommentWriter;
		ProductCommentContent = productCommentContent;
		ProductRef = productRef;
		ProductCommentRef = productCommentRef;
	}
	
	
	
}
