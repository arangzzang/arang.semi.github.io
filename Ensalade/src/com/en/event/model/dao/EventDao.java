package com.en.event.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.en.event.model.vo.Event;
import com.en.event.model.vo.EventContent;

public class EventDao {

	private Properties prop = new Properties();

	public EventDao() {
		try {
			String path = EventDao.class.getResource("/sql/event/event_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 이벤트 썸네일 가져오기
	public List<Event> secherEvent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Event> list = new ArrayList<Event>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectEventThumnail"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Event e = new Event();
				e.setEventCode(rs.getString("EVENT_CODE"));
				e.setEventCategory(rs.getString("EVENT_CATEGORY"));
				e.setEventName(rs.getString("EVENT_NAME"));
				e.setEventWriteDate(rs.getDate("EVENT_WRTIE_DATE"));
				e.setEventEndDate(rs.getDate("EVENT_END_DATE"));
				e.setSalePer(rs.getInt("SALE_PER"));
				e.setThumnail(rs.getString("THUMNAIL"));
				e.setProductNo(rs.getInt("PRODUCT_NO"));
				e.setProductPrice(rs.getInt("PRODUCT_PRICE"));
				e.setProductName(rs.getString("PRODUCT_NAME"));
				e.setProductType(rs.getString("PRODUCT_TYPE"));
				e.setProductContent(rs.getString("PRODUCT_CONTENT"));
				list.add(e);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int deletsEvent(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("deletsEvent");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public List<EventContent> selectEventOne(Connection conn, String code){
		PreparedStatement pstmt  = null;
		ResultSet rs = null;
		List<EventContent> list = new ArrayList<EventContent>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectEventOne"));
			pstmt.setString(1, code);
			System.out.println(code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EventContent ec = new EventContent();
				ec.setEventImg(rs.getString("EVENT_IMG"));
				list.add(ec);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
