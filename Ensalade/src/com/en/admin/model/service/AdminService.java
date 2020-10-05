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
	
	public List<Member> selectMemberAll(){
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberAll(conn);
		close(conn);
		return list;
	}
	public int insertNotice(NoticeBoard nb) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn, nb);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
}
