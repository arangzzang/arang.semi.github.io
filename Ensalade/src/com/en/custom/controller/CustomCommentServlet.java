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
 * Servlet implementation class CustomCommentServlet
 */
@WebServlet("/custom/commentView")
public class CustomCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//댓글을 보여주는 서블릿  || ccomment와 두 개로 나눈 이유 / 이 것은 상세페이지에서 ajax로 바로 표시할 수 있도록 댓글 자체를 뽑아주는 것이고 ccomment는 추가된 댓글을 바로 보여줄 수 있게 하기 위해 나눔
		
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		List<CustomComment> cc=new CustomService().commentList(no);
		
		request.setAttribute("comment",cc);
		request.setAttribute("ref", no);
		
		request.getRequestDispatcher("/view/custom/commentList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
