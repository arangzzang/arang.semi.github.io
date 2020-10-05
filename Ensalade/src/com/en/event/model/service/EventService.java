package com.en.event.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.getConnection;

import java.sql.Connection;
import java.util.List;

import com.en.event.model.dao.EventDao;
import com.en.event.model.vo.Event;
import com.en.event.model.vo.EventContent;

public class EventService {

	private EventDao dao = new EventDao();
	
	
	public List<Event> secherEvent(){
        Connection conn=getConnection();
        dao.deletsEvent(conn);
        
        List<Event> list=dao.secherEvent(conn);
        close(conn);
        return list;
	}
	
	public List<EventContent> selectEventOne(String code){
		Connection conn = getConnection();
		List<EventContent> list = dao.selectEventOne(conn, code);
		close(conn);
		return list;
	}
	
	
}
