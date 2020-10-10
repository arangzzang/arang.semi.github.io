package com.en.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.admin.model.service.AdminService;
import com.en.notice.model.vo.NoticeBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/admin/updateNoticeEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성오류! enctype에러! 개발자에게 문의!!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}
		
		MultipartRequest mr = new MultipartRequest(request, getServletContext().getRealPath("/image/upload/notice"),
				1024*1024*50, "UTF-8",new DefaultFileRenamePolicy());
		String filepath = "/image/upload/notice/"+mr.getFilesystemName("upload");
		
		NoticeBoard nb = new NoticeBoard();
		
		nb.setNotice_no(Integer.parseInt(mr.getParameter("no")));
		nb.setNotice_title(mr.getParameter("title"));
		nb.setNotice_writer(mr.getParameter("writer"));
		nb.setFilepath(filepath);
		nb.setContentImg(mr.getParameter("img"));
		nb.setNotice_contents(mr.getParameter("content"));
		int result = new AdminService().updateNotice(nb);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "공지사항 수정이 완료되었습니다.";
			loc = "/searchNotice";
		}else {
			msg = "공지사항 수정에 실패하였습니다ㅠㅠ개발자에게 문의하세요...";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
