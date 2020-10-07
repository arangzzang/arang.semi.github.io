package com.en.admin.model.dao;

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
import static com.en.common.Template.close;


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

	public List<Member> selectMemberAll(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMemberAll"));
			rs = pstmt.executeQuery();
			while (rs.next()) {

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
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
}
