package com.en.FAQ.model.vo;

import java.sql.Date;

public class FAQ {
	private int faqNo;
	private String faqQuestion;
	private String faqAnswer;
	private String faqDeleteAt;
	private String faqWriter;
	private Date faqWriteDate;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(int faqNo, String faqQuestion, String faqAnswer, String faqDeleteAt, String faqWriter,
			Date faqWriteDate) {
		super();
		this.faqNo = faqNo;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
		this.faqDeleteAt = faqDeleteAt;
		this.faqWriter = faqWriter;
		this.faqWriteDate = faqWriteDate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqQuestion() {
		return faqQuestion;
	}

	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}

	public String getFaqAnswer() {
		return faqAnswer;
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}

	public String getFaqDeleteAt() {
		return faqDeleteAt;
	}

	public void setFaqDeleteAt(String faqDeleteAt) {
		this.faqDeleteAt = faqDeleteAt;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public Date getFaqWriteDate() {
		return faqWriteDate;
	}

	public void setFaqWriteDate(Date faqWriteDate) {
		this.faqWriteDate = faqWriteDate;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqQuestion=" + faqQuestion + ", faqAnswer=" + faqAnswer + ", faqDeleteAt="
				+ faqDeleteAt + ", faqWriter=" + faqWriter + ", faqWriteDate=" + faqWriteDate + "]";
	}

		
}
