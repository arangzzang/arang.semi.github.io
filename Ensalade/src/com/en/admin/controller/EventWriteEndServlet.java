package com.en.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.admin.model.service.AdminService;
import com.en.event.model.vo.Event;
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
			return;
		}
		String path = getServletContext().getRealPath("/image/event");
		File dir=new File(path);
	      if(!dir.exists()) dir.mkdir();
		int maxSize = 1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		String filename = "/image/event/"+mr.getFilesystemName("thumb");
		String filename2 = "/image/event/"+mr.getFilesystemName("content_file");
		Event e = new Event();
		e.setEventWriter(mr.getParameter("userId"));
		e.setEventCategory(mr.getParameter("type"));
		e.setEventName(mr.getParameter("eName"));
		//String to date 처리 
		String s=mr.getParameter("endDate");
		String[] s2=s.split("-");
		int [] i1=new int[3];
		for(int i=0;i<s2.length;i++) {
			i1[i]=Integer.parseInt(s2[i]);
		}
		Calendar c=Calendar.getInstance();
		c.set(i1[0], i1[1], i1[2]);
		Date d=new Date(c.getTimeInMillis());
		e.setEventEndDate(d);
		
		e.setSalePer(Integer.parseInt(mr.getParameter("sale")));
		e.setThumnail(filename);
		e.setEventImg(filename2);
			System.out.println(e);
		int result = new AdminService().insertEvent(e);
//		EventContent ec = new EventContent();
//		ec.setEventCode(e.getEventCode());
//		ec.setEventImg(filename2);
//		int result2 = new AdminService().insertEventContent(ec);
		String msg = "";
		String loc ="/event/eventList";
		if(result>0) {
			msg = "등록에 성공했어요!";
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
