package com.en.FAQ.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.en.FAQ.model.vo.FAQ;

public class FAQDao {
	
	private Properties prop = new Properties();
	
	public FAQDao() {
		try {
			String path = FAQDao.class.getResource("/sql/FAQ/FAQ_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<FAQ> selectFAQ(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FAQ> list = new ArrayList<FAQ>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectFAQ"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FAQ f = new FAQ();
				f.setFaqQuestion(rs.getString("FAQ_QUESTION"));
				f.setFaqAnswer(rs.getString("FAQ_ANSWER"));
				f.setFaqWriter(rs.getString("FAQ_WRITER"));
				f.setFaqWriteDate(rs.getDate("FAQ_WRITE_DATE"));
				list.add(f);
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
