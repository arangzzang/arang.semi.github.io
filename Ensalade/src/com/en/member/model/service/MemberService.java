package com.en.member.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.commit;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.rollback;

import java.sql.Connection;

import com.en.member.model.dao.MemberDao;
import com.en.member.model.vo.Member;


public class MemberService {
	
	private MemberDao dao=new MemberDao();

	public Member selectId(String id,String pw) {
		Connection conn=getConnection();
		Member m=dao.selectId(conn,id,pw);
		close(conn);
		
		return m;
	}

	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	
	public String checkDuplicate(String checkId) {
		Connection conn=getConnection();
		String result=dao.checkDuplicate(conn, checkId);
		
		close(conn);
		return result;
	}

	public Member searchIdPw(String data, String email, String type) {
		Connection conn=getConnection();
		Member m=dao.searchIdPw(conn,data,email,type);
		close(conn);
		return m;
	}

	public int updatePw(String id, String newPw) {
		Connection conn=getConnection();
		int result=dao.updatePw(conn,id,newPw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int modifyInfo(Member m) {
		Connection conn=getConnection();
		int result=dao.modifyInfo(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int pointUpdate(String memberId,int totalpay) {
		   Connection conn=getConnection();
		   int resules=dao.pointUpdate(conn,totalpay,memberId);
		   if(resules>0) commit(conn);
			 else rollback(conn);
			 close(conn);
			 return resules;
	   };
}
