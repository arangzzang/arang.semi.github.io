package com.en.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.admin.model.service.AdminService;
import static com.en.common.Template.close;
import com.en.notice.model.vo.NoticeBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/admin/noticeWriteEnd")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeWriteEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성오류! [form:enctype에러!]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return; //종료
		}

		MultipartRequest mr = new MultipartRequest(request, getServletContext().getRealPath("/upload/notice"),
				1024 * 1024 * 50, "UTF-8", new DefaultFileRenamePolicy());
		//파일경로 합쳐서 넣어주기
		String filepath = "/upload/notice/" + mr.getFilesystemName("upload");
		NoticeBoard nb = new NoticeBoard();
		nb.setNotice_title(mr.getParameter("title"));
		nb.setNotice_writer(mr.getParameter("writer"));
		nb.setNotice_contents(mr.getParameter("content"));
//		nb.setContentImg(mr.getParameter("img"));
		nb.setFilepath(filepath);
		
		int result = new AdminService().insertNotice(nb);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "성공적으로 등록되었습니다.";
			loc = "/searchNotice";
		} else {
			msg = "등록에 실패하였습니다.";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
