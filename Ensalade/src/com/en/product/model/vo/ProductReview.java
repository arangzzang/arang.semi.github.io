package com.en.product.model.vo;

import java.util.Date;

public class ProductReview {
	
	private int pageRef;
	private int ReviewtNo;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	private String filepath;
	private Date reviewWriteDate;
	private int reviewViews;
	
	public ProductReview() {
		// TODO Auto-generated constructor stub
	}

	public ProductReview(int pageRef, int reviewtNo, String reviewTitle, String reviewWriter, String reviewContent,
			String filepath, Date reviewWriteDate, int reviewViews) {
		super();
		this.pageRef = pageRef;
		ReviewtNo = reviewtNo;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.filepath = filepath;
		this.reviewWriteDate = reviewWriteDate;
		this.reviewViews = reviewViews;
	}

	public int getPageRef() {
		return pageRef;
	}

	public void setPageRef(int pageRef) {
		this.pageRef = pageRef;
	}

	public int getReviewtNo() {
		return ReviewtNo;
	}

	public void setReviewtNo(int reviewtNo) {
		ReviewtNo = reviewtNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Date getReviewWriteDate() {
		return reviewWriteDate;
	}

	public void setReviewWriteDate(Date reviewWriteDate) {
		this.reviewWriteDate = reviewWriteDate;
	}

	public int getReviewViews() {
		return reviewViews;
	}

	public void setReviewViews(int reviewViews) {
		this.reviewViews = reviewViews;
	}

	@Override
	public String toString() {
		return "ProductReview [pageRef=" + pageRef + ", ReviewtNo=" + ReviewtNo + ", reviewTitle=" + reviewTitle
				+ ", reviewWriter=" + reviewWriter + ", reviewContent=" + reviewContent + ", filepath=" + filepath
				+ ", reviewWriteDate=" + reviewWriteDate + ", reviewViews=" + reviewViews + "]";
	}

	

	
	
}