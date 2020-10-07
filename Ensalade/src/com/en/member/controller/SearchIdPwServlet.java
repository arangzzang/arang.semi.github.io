package com.en.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.member.model.service.MemberService;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class SearchIdPwServlet
 */
@WebServlet("/search/searchIdPw")
public class SearchIdPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("userId");
		String name=request.getParameter("userName");
		String email=request.getParameter("email");
		String data="";
		String type="";
		if(id!=null) {
			data=id;
			type="member_id";
		}else if(name!=null) {
			data=name;
			type="member_name";
		}
		
		Member m=new MemberService().searchIdPw(data,email,type);
		String msg="";
		String loc="";
		if(m.getMemberId()==null&&type.equals("member_name")) {
			msg="정보가 일치하지 않습니다.";
			loc="/view/search/searchId.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			
			return;
		}else if(m.getMemberId()==null&&type.equals("member_id")) {
			msg="정보가 일치하지 않습니다.";
			loc="/view/search/searchPw.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}
		
		
		request.setAttribute("member", m);
		request.setAttribute("type", type);
		
		
		request.getRequestDispatcher("/view/search/searchIdPw.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
