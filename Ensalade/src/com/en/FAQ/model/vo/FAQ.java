package com.en.FAQ.model.vo;

import java.sql.Date;

public class FAQ {
	private String faqQuestion;
	private String faqAnswer;
	private String faqDeleteAt;
	private String faqWriter;
	private Date faqWriteDate;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(String faqQuestion, String faqAnswer, String faqDeleteAt, String faqWriter, Date faqWriteDate) {
		super();
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
		this.faqDeleteAt = faqDeleteAt;
		this.faqWriter = faqWriter;
		this.faqWriteDate = faqWriteDate;
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
		return "FAQ [faqQuestion=" + faqQuestion + ", faqAnswer=" + faqAnswer + ", faqDeleteAt=" + faqDeleteAt
				+ ", faqWriter=" + faqWriter + ", faqWriteDate=" + faqWriteDate + "]";
	}
	
	
}
