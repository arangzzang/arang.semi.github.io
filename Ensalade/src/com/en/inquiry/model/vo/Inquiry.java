package com.en.inquiry.model.vo;

import java.sql.Date;

public class Inquiry {
	private int inquiryNo;
	private String inquiryType;
	private String inquiryTitle;
	private String inquiryWriter;
	private String inquiryContent;
	private String filePath;
	private Date inquiryWriteDate;
	private String commentStatus;
	private String inquiryComment;
	private Date commentDate;
	
	public Inquiry() {
		// TODO Auto-generated constructor stub
	}

	public Inquiry(int inquiryNo, String inquiryType, String inquiryTitle, String inquiryWriter, String inquiryContent,
			String filePath, Date inquiryWriteDate, String commentStatus, String inquiryComment, Date commentDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryType = inquiryType;
		this.inquiryTitle = inquiryTitle;
		this.inquiryWriter = inquiryWriter;
		this.inquiryContent = inquiryContent;
		this.filePath = filePath;
		this.inquiryWriteDate = inquiryWriteDate;
		this.commentStatus = commentStatus;
		this.inquiryComment = inquiryComment;
		this.commentDate = commentDate;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryWriter() {
		return inquiryWriter;
	}

	public void setInquiryWriter(String inquiryWriter) {
		this.inquiryWriter = inquiryWriter;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getInquiryWriteDate() {
		return inquiryWriteDate;
	}

	public void setInquiryWriteDate(Date inquiryWriteDate) {
		this.inquiryWriteDate = inquiryWriteDate;
	}

	public String getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}

	public String getInquiryComment() {
		return inquiryComment;
	}

	public void setInquiryComment(String inquiryComment) {
		this.inquiryComment = inquiryComment;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiryNo=" + inquiryNo + ", inquiryType=" + inquiryType + ", inquiryTitle=" + inquiryTitle
				+ ", inquiryWriter=" + inquiryWriter + ", inquiryContent=" + inquiryContent + ", filePath=" + filePath
				+ ", inquiryWriteDate=" + inquiryWriteDate + ", commentStatus=" + commentStatus + ", inquiryComment="
				+ inquiryComment + ", commentDate=" + commentDate + "]";
	}

	
	
}
