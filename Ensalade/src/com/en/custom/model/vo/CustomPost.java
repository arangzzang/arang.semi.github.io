package com.en.custom.model.vo;

import java.sql.Date;

public class CustomPost {
	
	private int cIdx;
	private String title;
	private String content;
	private Date writeDate;
	private int likeCount;
	private int viewCount;
	private int customNo;
	private String memberId;
	private String cImage;
	
	public CustomPost() {
		// TODO Auto-generated constructor stub
	}

	public CustomPost(int cIdx, String title, String content, Date writeDate, int likeCount, int viewCount,
			int customNo, String memberId, String cImage) {
		super();
		this.cIdx = cIdx;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.likeCount = likeCount;
		this.viewCount = viewCount;
		this.customNo = customNo;
		this.memberId = memberId;
		this.cImage = cImage;
	}

	public int getcIdx() {
		return cIdx;
	}

	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getCustomNo() {
		return customNo;
	}

	public void setCustomNo(int customNo) {
		this.customNo = customNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getcImage() {
		return cImage;
	}

	public void setcImage(String cImage) {
		this.cImage = cImage;
	}

	@Override
	public String toString() {
		return "CustomPost [cIdx=" + cIdx + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", likeCount=" + likeCount + ", viewCount=" + viewCount + ", customNo=" + customNo + ", memberId="
				+ memberId + ", cImage=" + cImage + "]";
	}
	
	
	
	
	

}
