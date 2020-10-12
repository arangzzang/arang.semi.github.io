package com.en.admin.model.service;

import java.sql.Connection;
import java.util.List;

import com.en.admin.model.dao.AdminDao;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.close;
import static com.en.common.Template.rollback;
import static com.en.common.Template.commit;
import com.en.member.model.vo.Member;
import com.en.notice.model.vo.NoticeBoard;

public class AdminService {
	private AdminDao dao = new AdminDao();
	
	public List<Member> selectMemberAll(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberAll(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	public int memberCount() {
		Connection conn = getConnection();
		int result = dao.memberCount(conn);
		close(conn);
		return result;
	}
	public List<Member> selectMemberAll(int cPage, int numPerPage, String type, String key){
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberAll(conn, cPage, numPerPage, type, key);
		close(conn);
		return list;
	}
	public int memberCount(String type, String key) {
		Connection conn = getConnection();
		int result = dao.memberCount(conn, type, key);
		close(conn);
		return result;
	}
	public int insertNotice(NoticeBoard nb) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn, nb);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public int updateNotice(NoticeBoard nb) {
		Connection conn = getConnection();
		int result = dao.updateNotice(conn, nb);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public int deleteNotice(int no) {
		Connection conn = getConnection();
		int result = dao.deleteNotice(conn, no);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
}
