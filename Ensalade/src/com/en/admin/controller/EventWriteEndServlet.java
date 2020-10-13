package com.en.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.admin.model.service.AdminService;
import com.en.event.model.vo.Event;
import com.en.event.model.vo.EventContent;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class EventWriteServlet
 */
@WebServlet("/admin/insertEvent")
public class EventWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성오류! 관리자에게 문의하세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
		}
		String path = getServletContext().getRealPath("/image/event");
		int maxSize = 1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		String filename = "/image/event/"+mr.getFilesystemName("thumb");
		Event e = new Event();
		e.setEventCategory(mr.getParameter("category"));
		e.setEventName(mr.getParameter("eName"));
		e.setEventName(mr.getParameter("endDate"));
		e.setThumnail(filename);
		System.out.println(e);
		int result = new AdminService().insertEvent(e);
		
		String msg = "";
		String loc ="/event/eventList";
		if(result>0) {
			EventContent ec = new EventContent();
			ec.setEventCode(e.getEventCode());
			ec.setEventImg(mr.getFilesystemName("content_file"));
			int result2 = new AdminService().insertEventContent(ec);
			if(result2>0) msg = "등록에 성공했어요!";
			else msg = "등록에 실패했어요 ㅠㅠ";
		}else {
			msg = "등록에 실패했어요 ㅠㅠ";
		}
		
		request.setAttribute("loc", loc);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
