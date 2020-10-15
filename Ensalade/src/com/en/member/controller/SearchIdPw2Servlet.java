package com.en.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchIdPw2Servlet
 */
@WebServlet("/search/searchIdPw2")
public class SearchIdPw2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdPw2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkNumber=request.getParameter("checkNumber");
		String temp=request.getParameter("temp");
		String loc=request.getParameter("loc_");
		String type=request.getParameter("type");
		String userId=request.getParameter("id_");
		if(!checkNumber.equals(temp)) {
			request.setAttribute("msg", "인증 번호가 일치하지 않습니다.");
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}
		if(type.equals("member_id")) {
			request.setAttribute("check", "check");
			request.setAttribute("id", userId);
			request.getRequestDispatcher("/view/search/changePw.jsp").forward(request, response);;
		}else if(type.equals("member_name")) {
			request.setAttribute("msg", "아이디는 "+userId+" 입니다.");
			request.setAttribute("loc","/view/login.jsp");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
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
