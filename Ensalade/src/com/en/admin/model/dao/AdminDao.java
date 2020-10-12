package com.en.admin.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.en.member.model.vo.Member;
import com.en.notice.model.vo.NoticeBoard;


public class AdminDao {
	private Properties prop = new Properties();

	public AdminDao() {
		try {
			String path = AdminDao.class.getResource("/sql/admin/admin_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<Member> selectMemberAll(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMemberAll"));
			pstmt.setInt(1, cPage);
			pstmt.setInt(2, numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberName(rs.getString("member_name"));
				m.setMemberGender(rs.getString("member_gender"));
				m.setMemberPhone(rs.getString("phone"));
				m.setMemberAddress(rs.getString("address"));
				m.setMangerYn(rs.getString("manager_yn"));
				m.setEmail(rs.getString("email"));
				m.setPoint(rs.getInt("point"));
				m.setBirthday(rs.getDate("brithday"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int memberCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberCount"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public List<Member> selectMemberAll(Connection conn, int cPage, int numPerPage, String type, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMemberType").replaceAll("#type", type));
			pstmt.setString(1, "%" + key + "%");
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberName(rs.getString("member_name"));
				m.setMemberGender(rs.getString("member_gender"));
				m.setMemberPhone(rs.getString("phone"));
				m.setMemberAddress(rs.getString("address"));
				m.setMangerYn(rs.getString("manager_yn"));
				m.setEmail(rs.getString("email"));
				m.setPoint(rs.getInt("point"));
				m.setBirthday(rs.getDate("brithday"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int memberCount(Connection conn, String type, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberCountType").replaceAll("#type", type));
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int insertNotice(Connection conn, NoticeBoard nb) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertNotice"));
			pstmt.setString(1, nb.getNotice_title());
			pstmt.setString(2, nb.getNotice_contents());
			pstmt.setString(3, nb.getNotice_writer());
			pstmt.setString(4, nb.getFilepath());
			pstmt.setString(5, nb.getContentImg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateNotice(Connection conn, NoticeBoard nb) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateNotice"));
			pstmt.setString(1, nb.getNotice_title());
			pstmt.setString(2, nb.getNotice_contents());
			pstmt.setString(3, nb.getFilepath());
			pstmt.setString(4, nb.getContentImg());
			pstmt.setInt(5, nb.getNotice_no());	
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteNotice"));
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
