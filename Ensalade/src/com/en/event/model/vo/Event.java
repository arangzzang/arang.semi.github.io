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
	
	public Event() {
		// TODO Auto-generated constructor stub
	}


	public Event(String eventCode, String eventWriter, String eventCategory, String eventName, Date eventWriteDate,
			Date eventEndDate, int salePer, String thumnail) {
		super();
		this.eventCode = eventCode;
		this.eventWriter = eventWriter;
		this.eventCategory = eventCategory;
		this.eventName = eventName;
		this.eventWriteDate = eventWriteDate;
		this.eventEndDate = eventEndDate;
		this.salePer = salePer;
		this.thumnail = thumnail;
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


	@Override
	public String toString() {
		return "Event [eventCode=" + eventCode + ", eventWriter=" + eventWriter + ", eventCategory=" + eventCategory
				+ ", eventName=" + eventName + ", eventWriteDate=" + eventWriteDate + ", eventEndDate=" + eventEndDate
				+ ", salePer=" + salePer + ", thumnail=" + thumnail + "]";
	}


	
	
}
