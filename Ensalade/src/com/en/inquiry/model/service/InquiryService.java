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

	public List<Inquiry> SerchInqurty() {

		Connection conn = getConnection();
		List<Inquiry> list = dao.SerchInqurty(conn);
		close(conn);
		return list;
	}

	public List<Inquiry> searchMemberInquiry(int memberNo) {
		Connection conn = getConnection();
		List<Inquiry> list = dao.searchMemberInquiry(conn, memberNo);
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
}
