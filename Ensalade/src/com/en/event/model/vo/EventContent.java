package com.en.event.model.vo;

public class EventContent {
	private String eventCode;
	private String eventImg;

	public EventContent() {
		// TODO Auto-generated constructor stub
	}

	public EventContent(String eventCode, String eventImg) {
		super();
		this.eventCode = eventCode;
		this.eventImg = eventImg;
	}

	public String getEventCode() {
		return eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getEventImg() {
		return eventImg;
	}

	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}

	@Override
	public String toString() {
		return "EventContent [eventCode=" + eventCode + ", eventImg=" + eventImg + "]";
	}
	
	

}
