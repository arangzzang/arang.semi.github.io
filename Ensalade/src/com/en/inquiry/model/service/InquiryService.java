package com.en.inquiry.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.commit;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.rollback;

import java.sql.Connection;
import java.util.List;

import com.en.inquiry.model.dao.InquiryDao;
import com.en.inquiry.model.vo.Inquiry;

public class InquiryService {
	private InquiryDao dao = new InquiryDao();

	public int insertInquiry(Inquiry i) {
		Connection conn = getConnection();
		int result = dao.insertInquiry(conn, i);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public List<Inquiry> searchInquiry(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Inquiry> list = dao.searchInquiry(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	public List<Inquiry> SerchInqurty(int cPage, int numPerPage, String type, String key) {

		Connection conn = getConnection();
		List<Inquiry> list = dao.SerchInqurty(conn, cPage, numPerPage, type, key);
		close(conn);
		return list;
	}

	public List<Inquiry> searchMemberInquiry(int memberNo,int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Inquiry> list = dao.searchMemberInquiry(conn, memberNo, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int managerAnswer(int no, String mangerText) {
		Connection conn = getConnection();
		int result = dao.managerAnswer(conn, no, mangerText);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int inquiryCount(int no) {
		Connection conn = getConnection();
		int count = dao.inquiryCount(conn,no);
		close(conn);
		return count;
	}
	
	public int inquiryCountManager() {
		Connection conn = getConnection();
		int count = dao.inquiryCountManager(conn);
		close(conn);
		return count;
	}
	public int inquiryCountManager(String type, String key) {
		Connection conn = getConnection();
		int count = dao.inquiryCountManager(conn,type, key);
		close(conn);
		return count;
	}
}
