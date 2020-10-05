package com.en.notice.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.commit;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.rollback;

import java.sql.Connection;
import java.util.List;

import com.en.notice.model.dao.NoticeBoardDao;
import com.en.notice.model.vo.NoticeBoard;

public class NoticeService {
	
private NoticeBoardDao dao = new NoticeBoardDao();
	
	
	public List<NoticeBoard> noticeList(int cPage,int numPerPage){
		Connection conn= getConnection();
		List<NoticeBoard> list=dao.noticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int noticeCount() {
		
		Connection conn= getConnection();
		int result=dao.noticeCount(conn);
		if(result>0)commit(conn); 
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<NoticeBoard>searchNotice(String type,String key,int cPage,int numPerPage){
		Connection conn= getConnection();
		List<NoticeBoard>list=dao.searchNotice(conn,type,key,cPage,numPerPage);
		close(conn);
		return list;
	}
	public int noticeCount2(String type,String key) {
		
		Connection conn= getConnection();
		int result=dao.noticeCount2(conn,type,key);
		if(result>0)commit(conn); 
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
