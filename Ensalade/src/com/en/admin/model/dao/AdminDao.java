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

import com.en.FAQ.model.vo.FAQ;
import com.en.admin.model.vo.Store;
import com.en.event.model.vo.Event;
import com.en.event.model.vo.EventContent;
import com.en.custom.model.vo.CustomComment;
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

	public List<CustomComment> customCommentList(Connection conn,int cPage,int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CustomComment> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("customCommentList"));
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2,cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CustomComment c=new CustomComment();
				c.setCustomCommentContent(rs.getNString("CUSTOM_COMMENT_CONTENT"));
				c.setCustomCommentDate(rs.getDate("CUSTOM_COMMENT_DATE"));
				c.setCustomCommentLevel(rs.getInt("CUSTOM_COMMENT_LEVEL"));
				c.setCustomCommentNo(rs.getInt("CUSTOM_COMMENT_NO"));
				c.setCustomCommentRef(rs.getInt("CUSTOM_COMMENT_REF"));
				c.setCustomCommentWriter(rs.getNString("CUSTOM_COMMENT_WRITER"));
				c.setCustomRef(rs.getInt("CUSTOM_REF"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int customPostDelete(Connection conn, int cNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("customPostDelete"));
			pstmt.setInt(1, cNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int customCommentDelete(Connection conn, int ccNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("customCommentDelete"));
			pstmt.setInt(1, ccNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertFAQ(Connection conn, FAQ f) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertFAQ"));
			pstmt.setString(1, f.getFaqQuestion());
			pstmt.setString(2, f.getFaqAnswer());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public FAQ selectFAQ(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FAQ f = new FAQ();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectFAQ"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				f.setFaqNo(rs.getInt("FAQ_NO"));
				f.setFaqQuestion(rs.getString("FAQ_QUESTION"));
				f.setFaqAnswer(rs.getString("FAQ_ANSWER"));
				f.setFaqDeleteAt(rs.getString("DELETE_AT"));
				f.setFaqWriter(rs.getString("FAQ_WRITER"));
				f.setFaqWriteDate(rs.getDate("FAQ_WRITE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return f;
	}
	public int updateFAQ(Connection conn, FAQ f) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateFAQ"));
			pstmt.setString(1, f.getFaqQuestion());
			pstmt.setString(2, f.getFaqAnswer());
			pstmt.setInt(3, f.getFaqNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertEvent(Connection conn, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertEvent"));
			pstmt.setString(1, e.getEventCategory());
			pstmt.setString(2, e.getEventName());
			pstmt.setDate(3, e.getEventEndDate());
			pstmt.setInt(4, e.getSalePer());
			pstmt.setString(5, e.getThumnail());
			result = pstmt.executeUpdate();
		} catch (SQLException e2) {
			e2.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertEventContent(Connection conn, EventContent ec) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertEventContent"));
			pstmt.setString(1, ec.getEventCode());
			pstmt.setString(1, ec.getEventImg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<Store> storeList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Store> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("storeList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Store s=new Store();
				s.setStoreName(rs.getNString("STORE_NAME"));
				s.setStorAdr(rs.getNString("STORE_ADR"));
				s.setStoreAddress(rs.getDouble("STORE_ADDRESS"));
				s.setStoreAddress2(rs.getDouble("STORE_ADDRESS2"));
				s.setStoreImg(rs.getNString("STORE_IMAGE"));
				s.setStorePhone(rs.getNString("STORE_PHONE"));
				list.add(s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int postCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int total=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("postCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return total;
	}
	public int commentCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int total=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("commentCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return total;
	}
}
