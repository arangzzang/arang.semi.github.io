package com.en.inquiry.model.dao;

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

import com.en.inquiry.model.vo.Inquiry;

public class InquiryDao {
	private Properties prop = new Properties();

	public InquiryDao() {
		try {
			String path = InquiryDao.class.getResource("/sql/inquiry/inquiry_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertInquiry(Connection conn, Inquiry i) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertInquiry"));
			// 인쿼리 타입, 제목, 작성자, 내용, 사진파일경로
			pstmt.setString(1, i.getInquiryType());
			pstmt.setString(2, i.getInquiryTitle());
			pstmt.setString(3, i.getInquiryWriter());
			pstmt.setString(4, i.getInquiryContent());
			pstmt.setString(5, i.getFilePath());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Inquiry> searchInquiry(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> list = new ArrayList<Inquiry>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchInquiry"));
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Inquiry ii = new Inquiry();
				ii.setInquiryNo(rs.getInt("INQUIRY_NO"));
				ii.setInquiryType(rs.getString("INQUIRY_TYPE"));
				ii.setInquiryTitle(rs.getString("INQUIRY_TITLE"));
				ii.setInquiryWriter(rs.getString("INQUIRY_WRITER"));
				ii.setInquiryContent(rs.getString("INQUIRY_CONTENT"));
				ii.setFilePath(rs.getString("FILEPATH"));
				ii.setInquiryWriteDate(rs.getDate("INQUIRY_WRITE_DATE"));
				ii.setCommentStatus(rs.getString("COM_STATUS"));
				ii.setInquiryComment(rs.getString("INQUIRY_COMMENT_CONTENT"));
				ii.setCommentDate(rs.getDate("INQUIRY_COMMENT_DATE"));
				list.add(ii);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<Inquiry> SerchInqurty(Connection conn, int cPage, int numPerPage, String type, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> list = new ArrayList<Inquiry>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("SerchInqurty").replaceAll("#type", type));
			pstmt.setString(1, "%" + key + "%");
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Inquiry ii = new Inquiry();
				ii.setInquiryNo(rs.getInt("INQUIRY_NO"));
				ii.setInquiryType(rs.getString("INQUIRY_TYPE"));
				ii.setInquiryTitle(rs.getString("INQUIRY_TITLE"));
				ii.setInquiryWriter(rs.getString("INQUIRY_WRITER"));
				ii.setInquiryContent(rs.getString("INQUIRY_CONTENT"));
				ii.setFilePath(rs.getString("FILEPATH"));
				ii.setInquiryWriteDate(rs.getDate("INQUIRY_WRITE_DATE"));
				ii.setCommentStatus(rs.getString("COM_STATUS"));
				ii.setInquiryComment(rs.getString("INQUIRY_COMMENT_CONTENT"));
				ii.setCommentDate(rs.getDate("INQUIRY_COMMENT_DATE"));
				list.add(ii);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<Inquiry> searchMemberInquiry(Connection conn, int no ) {
		List<Inquiry> list = new ArrayList<Inquiry>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchMemberInquiry"));
			pstmt.setInt(1, no);
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Inquiry i = new Inquiry();
				i.setInquiryType(rs.getString("INQUIRY_TYPE"));
				i.setInquiryTitle(rs.getString("INQUIRY_TITLE"));
				i.setInquiryContent(rs.getString("INQUIRY_CONTENT"));
				i.setFilePath(rs.getString("FILEPATH"));
				i.setInquiryWriteDate(rs.getDate("INQUIRY_WRITE_DATE"));
				i.setCommentStatus(rs.getString("COM_STATUS"));
				i.setInquiryComment(rs.getString("INQUIRY_COMMENT_CONTENT"));
				i.setCommentDate(rs.getDate("INQUIRY_COMMENT_DATE"));
				list.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Inquiry> searchMemberInquiry(Connection conn, int no, int cPage, int numPerPage) {
		List<Inquiry> list = new ArrayList<Inquiry>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchMemberInquiryPage"));
			pstmt.setInt(1, no);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Inquiry i = new Inquiry();
				i.setInquiryType(rs.getString("INQUIRY_TYPE"));
				i.setInquiryTitle(rs.getString("INQUIRY_TITLE"));
				i.setInquiryContent(rs.getString("INQUIRY_CONTENT"));
				i.setFilePath(rs.getString("FILEPATH"));
				i.setInquiryWriteDate(rs.getDate("INQUIRY_WRITE_DATE"));
				i.setCommentStatus(rs.getString("COM_STATUS"));
				i.setInquiryComment(rs.getString("INQUIRY_COMMENT_CONTENT"));
				i.setCommentDate(rs.getDate("INQUIRY_COMMENT_DATE"));
				list.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int managerAnswer(Connection conn, int no, String mangerText) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("managerAnswer").replaceAll("@yes", "'답변완료'"));
			pstmt.setString(1, mangerText);
			pstmt.setInt(2, no);
			System.out.println(prop.getProperty("managerAnswer").replaceAll("@yes", "'답변완료'"));
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int inquiryCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("inquiryCount"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public int inquiryCountManager(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("inquiryCountManager"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public int inquiryCountManager(Connection conn, String type, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("inquiryCountManagerType").replaceAll("#type", type));
			pstmt.setString(1, "%" + key + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
}
