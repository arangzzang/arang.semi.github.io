package com.en.custom.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.custom.model.service.CustomService;
import com.en.custom.model.vo.CustomComment;

/**
 * Servlet implementation class CCommentServlet
 */
@WebServlet("/custom/cComment")
public class CCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//댓글을 추가하는 서블릿
		
		
		int ref=Integer.parseInt(request.getParameter("no"));
		int level=Integer.parseInt(request.getParameter("level"));
		String writer=request.getParameter("writer");
		String text=request.getParameter("text");
		int cRef=Integer.parseInt(request.getParameter("cRef"));
		CustomComment c=new CustomComment(level,writer,text,ref,cRef);
		int result=new CustomService().insertComment(c);
		
		System.out.println(ref+":"+level+":"+ref+":"+cRef);
		if(result>0) {
			List<CustomComment> cc=new CustomService().commentList(ref);
			
			request.setAttribute("comment",cc);
			request.setAttribute("ref", ref);
		request.getRequestDispatcher("/view/custom/commentList.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
