package com.en.FAQ.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.getConnection;

import java.sql.Connection;
import java.util.List;

import com.en.FAQ.model.dao.FAQDao;
import com.en.FAQ.model.vo.FAQ;

public class FAQService {
	
	private FAQDao dao = new FAQDao();
	
	public List<FAQ> selectFAQ(){
		Connection conn = getConnection();
		List<FAQ> list = dao.selectFAQ(conn);
		close(conn);
		return list;
	}
}
