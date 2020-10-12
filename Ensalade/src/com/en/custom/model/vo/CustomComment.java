package com.en.custom.model.vo;

import java.util.Date;

public class CustomComment {
	
	private int customCommentNo;
	private int customCommentLevel;
	private String customCommentWriter;
	private String customCommentContent;
	private int customRef;
	private int customCommentRef;
	private Date customCommentDate;

	public CustomComment() {
		// TODO Auto-generated constructor stub
	}

	public CustomComment(int customCommentNo, int customCommentLevel, String customCommentWriter,
			String customCommentContent, int customRef, int customCommentRef, Date customCommentDate) {
		super();
		this.customCommentNo = customCommentNo;
		this.customCommentLevel = customCommentLevel;
		this.customCommentWriter = customCommentWriter;
		this.customCommentContent = customCommentContent;
		this.customRef = customRef;
		this.customCommentRef = customCommentRef;
		this.customCommentDate = customCommentDate;
	}
	
	

	public CustomComment(int customCommentLevel, String customCommentWriter, String customCommentContent, int customRef,
			int customCommentRef) {
		super();
		this.customCommentLevel = customCommentLevel;
		this.customCommentWriter = customCommentWriter;
		this.customCommentContent = customCommentContent;
		this.customRef = customRef;
		this.customCommentRef = customCommentRef;
	}

	public int getCustomCommentNo() {
		return customCommentNo;
	}

	public void setCustomCommentNo(int customCommentNo) {
		this.customCommentNo = customCommentNo;
	}

	public int getCustomCommentLevel() {
		return customCommentLevel;
	}

	public void setCustomCommentLevel(int customCommentLevel) {
		this.customCommentLevel = customCommentLevel;
	}

	public String getCustomCommentWriter() {
		return customCommentWriter;
	}

	public void setCustomCommentWriter(String customCommentWriter) {
		this.customCommentWriter = customCommentWriter;
	}

	public String getCustomCommentContent() {
		return customCommentContent;
	}

	public void setCustomCommentContent(String customCommentContent) {
		this.customCommentContent = customCommentContent;
	}

	public int getCustomRef() {
		return customRef;
	}

	public void setCustomRef(int customRef) {
		this.customRef = customRef;
	}

	public int getCustomCommentRef() {
		return customCommentRef;
	}

	public void setCustomCommentRef(int customCommentRef) {
		this.customCommentRef = customCommentRef;
	}

	public Date getCustomCommentDate() {
		return customCommentDate;
	}

	public void setCustomCommentDate(Date customCommentDate) {
		this.customCommentDate = customCommentDate;
	}

	@Override
	public String toString() {
		return "CustomComment [customCommentNo=" + customCommentNo + ", customCommentLevel=" + customCommentLevel
				+ ", customCommentWriter=" + customCommentWriter + ", customCommentContent=" + customCommentContent
				+ ", customRef=" + customRef + ", customCommentRef=" + customCommentRef + ", customCommentDate="
				+ customCommentDate + "]";
	}
	
	
	
}
