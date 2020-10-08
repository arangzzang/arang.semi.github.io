package com.en.notice.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.en.notice.model.vo.NoticeBoard;

public class NoticeBoardDao {

	private Properties prop = new Properties();

	public NoticeBoardDao() {

		try {
			String path = NoticeBoardDao.class.getResource("/sql/notice/notice_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<NoticeBoard> noticeList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeBoard> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("noticeList"));
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeBoard nb = new NoticeBoard();
				nb.setNotice_no(rs.getInt("NOTICE_NO"));
				nb.setNotice_title(rs.getNString("NOTICE_TITLE"));
				nb.setNotice_contents(rs.getString("NOTICE_CONTENTS"));
				nb.setNotice_writer(rs.getNString("NOTICE_WRITER"));
				nb.setDelete_at(rs.getNString("DELETE_AT"));
				nb.setFilepath(rs.getNString("FILEPATH"));
				nb.setNotice_write_date(rs.getDate("NOTICE_WRITE_DATE"));
				nb.setUpdate_date(rs.getDate("UPDATE_DATE"));
				nb.setDelete_date(rs.getDate("DELETE_DATE"));
				list.add(nb);

			}
//			 NOTICE_NO NUMBER PRIMARY KEY 
//			 , NOTICE_TITLE VARCHAR2(500)   NOT NULL             -- �젣紐�     
//			 ,NOTICE_CONTENTS VARCHAR2(4000) NOT NULL          -- 而⑦뀗痢�
//			 ,NOTICE_WRITER VARCHAR2(50)  NOT NULL             -- �옉�꽦�옄
//			 ,DELETE_AT CHAR(1) DEFAULT 'N' NOT NULL           -- �궘�젣�뿬遺� 'Y'�궘�젣 'N' 誘몄슜
//			 , FILEPATH VARCHAR2(300)                         --泥⑤��옄猷�
//			 ,NOTICE_WRITE_DATE DATE DEFAULT SYSDATE NOT NULL --�옉�꽦�궇吏�
//			 ,UPDATE_DATE DATE                                --�닔�젙�씪�떆
//			 ,DELETE_DATE DATE                                --�궘�젣�씪�떆

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int noticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("noticeCount"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}

	public List<NoticeBoard> searchNotice(Connection conn, String type, String key, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeBoard> list = new ArrayList<NoticeBoard>();
		try {

			String sql = prop.getProperty("searchNotice").replaceAll("@type", type);

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + key + "%");

			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeBoard nb = new NoticeBoard();
				nb.setNotice_no(rs.getInt("NOTICE_NO"));
				nb.setNotice_title(rs.getNString("NOTICE_TITLE"));
				nb.setNotice_contents(rs.getString("NOTICE_CONTENTS"));
				nb.setNotice_writer(rs.getNString("NOTICE_WRITER"));
				nb.setDelete_at(rs.getNString("DELETE_AT"));
				nb.setFilepath(rs.getNString("FILEPATH"));
				nb.setContentImg(rs.getString("CONTENT_IMG"));
				nb.setNotice_write_date(rs.getDate("NOTICE_WRITE_DATE"));
				nb.setUpdate_date(rs.getDate("UPDATE_DATE"));
				nb.setDelete_date(rs.getDate("DELETE_DATE"));
				list.add(nb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int noticeCount2(Connection conn, String type, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {

			String sql = prop.getProperty("searchNotice2").replaceAll("@type", type);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + key + "%");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
	
	public NoticeBoard selectNoticeOne(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeBoard nb = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectNoticeOne"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nb = new NoticeBoard();
				nb.setNotice_no(rs.getInt("NOTICE_NO"));
				nb.setNotice_title(rs.getNString("NOTICE_TITLE"));
				nb.setNotice_contents(rs.getString("NOTICE_CONTENTS"));
				nb.setNotice_writer(rs.getNString("NOTICE_WRITER"));
				nb.setDelete_at(rs.getNString("DELETE_AT"));
				nb.setFilepath(rs.getNString("FILEPATH"));
				nb.setContentImg(rs.getString("CONTENT_IMG"));
				nb.setNotice_write_date(rs.getDate("NOTICE_WRITE_DATE"));
				nb.setUpdate_date(rs.getDate("UPDATE_DATE"));
				nb.setDelete_date(rs.getDate("DELETE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return nb;
	}

}
