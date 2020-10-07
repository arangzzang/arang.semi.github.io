package com.en.notice.model.vo;

import java.util.Date;

public class NoticeBoard {

	private int notice_no;
	private String notice_title;
	private String notice_contents;
	private String notice_writer;
	private String delete_at;
	private String filepath;
	private String contentImg;
	private Date notice_write_date;
	private Date update_date;
	private Date delete_date;

	public NoticeBoard() {
		// TODO Auto-generated constructor stub
	}

	public NoticeBoard(int notice_no, String notice_title, String notice_contents, String notice_writer,
			String delete_at, String filepath, String contentImg, Date notice_write_date, Date update_date,
			Date delete_date) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_writer = notice_writer;
		this.delete_at = delete_at;
		this.filepath = filepath;
		this.contentImg = contentImg;
		this.notice_write_date = notice_write_date;
		this.update_date = update_date;
		this.delete_date = delete_date;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getDelete_at() {
		return delete_at;
	}

	public void setDelete_at(String delete_at) {
		this.delete_at = delete_at;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getContentImg() {
		return contentImg;
	}

	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}

	public Date getNotice_write_date() {
		return notice_write_date;
	}

	public void setNotice_write_date(Date notice_write_date) {
		this.notice_write_date = notice_write_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public Date getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}

	@Override
	public String toString() {
		return "NoticeBoard [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_contents="
				+ notice_contents + ", notice_writer=" + notice_writer + ", delete_at=" + delete_at + ", filepath="
				+ filepath + ", contentImg=" + contentImg + ", notice_write_date=" + notice_write_date
				+ ", update_date=" + update_date + ", delete_date=" + delete_date + "]";
	}

	

}