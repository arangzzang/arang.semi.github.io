package com.en.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.event.model.service.EventService;
import com.en.event.model.vo.Event;
import com.en.event.model.vo.EventContent;

/**
 * Servlet implementation class EventViewServlet
 */
@WebServlet("/event/eventView")
public class EventViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("code");
		
		List<EventContent> list =  new EventService().selectEventOne(code);
		
		
		String path="";
		if(list==null) {
			String msg = "존재하지 않는 게시물입니다.";
			String loc = "/views/event/eventList";
			path = "/view/common/msg.jsp";
		}else {
			path = "/view/event/eventView.jsp";
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
