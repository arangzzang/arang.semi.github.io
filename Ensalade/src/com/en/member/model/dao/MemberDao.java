package com.en.member.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.en.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop=new Properties();
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/membersql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Member selectId(Connection conn,String id,String pw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("logIn"));
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setMemberGender(rs.getString("member_gender"));
				m.setMemberPhone(rs.getString("phone"));
				m.setMemberAddress(rs.getString("address"));
				m.setMangerYn(rs.getString("manager_yn"));
				m.setEmail(rs.getString("email"));
				m.setPoint(rs.getInt("point"));
				m.setBirthday(rs.getDate("brithday"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setUser_no(rs.getInt("user_no"));
				
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int insertMember(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getMemberPw());
			pstmt.setString(3,m.getMemberName());
			pstmt.setString(4,m.getMemberGender());
			pstmt.setString(5,m.getMemberPhone());
			pstmt.setString(6,m.getMemberAddress());
			pstmt.setString(7,m.getEmail());
			pstmt.setDate(8, m.getBirthday());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	public String checkDuplicate(Connection conn, String checkId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("checkDuplicate"));
			pstmt.setNString(1, checkId);
			rs=pstmt.executeQuery();		
			if(rs.next()) {
				result=rs.getString("member_id");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public Member searchIdPw(Connection conn, String data, String email, String type) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=new Member();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("searchIdPw").replaceAll("@DATA", type));
			pstmt.setString(1, data);
			pstmt.setNString(2,email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setMemberGender(rs.getString("member_gender"));
				m.setMemberPhone(rs.getString("phone"));
				m.setMemberAddress(rs.getString("address"));
				m.setMangerYn(rs.getString("manager_yn"));
				m.setEmail(rs.getString("email"));
				m.setPoint(rs.getInt("point"));
				m.setBirthday(rs.getDate("brithday"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setUser_no(rs.getInt("user_no"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public int updatePw(Connection conn, String id, String newPw) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePw"));
			pstmt.setNString(1, newPw);
			pstmt.setNString(2, id);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int modifyInfo(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("modifyInfo"));
			pstmt.setString(1,m.getMemberPw());
			pstmt.setString(2,m.getEmail());
			pstmt.setString(3,m.getMemberPhone());
			pstmt.setString(4,m.getMemberAddress());
			pstmt.setString(5,m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
public int pointUpdate(Connection conn,int totalpay,String memberId) {
  		
  		PreparedStatement pstmt=null;
  		int results=0;
  		try { 
  			pstmt=conn.prepareStatement(prop.getProperty("pointUpdate"));
		   pstmt.setInt(1, totalpay);
		   pstmt.setString(2, memberId);
		   results=pstmt.executeUpdate();
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }finally {
		   close(pstmt);
	   }return results;

  			
   }
public int pointDown(Connection conn,int point,String memberId) {
		
		PreparedStatement pstmt=null;
		int results=0;
		try { 
			pstmt=conn.prepareStatement(prop.getProperty("pointDuwn"));
	   pstmt.setInt(1, point);
	   pstmt.setString(2, memberId);
	   results=pstmt.executeUpdate();
   }catch(SQLException e) {
	   e.printStackTrace();
   }finally {
	   close(pstmt);
   }return results;

			
}


}
