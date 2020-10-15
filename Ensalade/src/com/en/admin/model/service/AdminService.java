package com.en.admin.model.service;

import java.sql.Connection;
import java.util.List;

import com.en.FAQ.model.vo.FAQ;
import com.en.admin.model.dao.AdminDao;
import com.en.admin.model.vo.Store;
import com.en.event.model.vo.Event;
import com.en.event.model.vo.EventContent;
import com.en.custom.model.vo.CustomComment;

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
	
	public List<CustomComment> customCommentList(){//전체 댓글 가져오기위해
		Connection conn=getConnection();
		List<CustomComment> list=dao.customCommentList(conn);
		close(conn);
		return list;
	}
	
	public int customPostDelete(int cNo) {
		Connection conn=getConnection();
		int result=dao.customPostDelete(conn,cNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int customCommentDelete(int ccNo) {
		Connection conn=getConnection();
		int result=dao.customCommentDelete(conn,ccNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertFAQ(FAQ f) {
		Connection conn = getConnection();
		int result = dao.insertFAQ(conn, f);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public FAQ selectFAQ(int no) {
		Connection conn = getConnection();
		FAQ f = dao.selectFAQ(conn, no);
		return f;
	}
	public int updateFAQ(FAQ f) {
		Connection conn = getConnection();
		int result = dao.updateFAQ(conn, f);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public int insertEvent(Event e) {
		Connection conn = getConnection();
		int result = dao.insertEvent(conn, e);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public int insertEventContent(EventContent ec) {
		Connection conn = getConnection();
		int result = dao.insertEventContent(conn, ec);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	public List<Store> storeList(){
		Connection conn=getConnection();
		List<Store> list=dao.storeList(conn);
		close(conn);
		return list;
	}
}
