package com.en.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.member.model.service.MemberService;

/**
 * Servlet implementation class UpdatePwServlet
 */
@WebServlet("/updatePw")
public class UpdatePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("userId");
		String newPw=request.getParameter("newPw");
		
		int result=new MemberService().updatePw(id,newPw);
		
		if(result>0){
			request.setAttribute("msg", "비밀 번호가 변경되었습니다.");
			request.setAttribute("loc", "/view/login.jsp");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("check", "ch");
			request.getRequestDispatcher("/view/search/changePw").forward(request, response);
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
