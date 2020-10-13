package com.en.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.member.model.service.MemberService;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet(name="join", urlPatterns="/loginjoin/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address=request.getParameterValues("address")[0]+",";
		address+=request.getParameterValues("address")[1]+",";
		address+=request.getParameterValues("address")[2];
		Member m=new Member();
		m.setMemberId(request.getParameter("userId"));
		m.setMemberPw(request.getParameter("password"));
		m.setMemberName(request.getParameter("userName"));
		m.setEmail(request.getParameter("email"));
		m.setMemberGender(request.getParameter("gender"));
		m.setMemberPhone(request.getParameter("phone"));
		m.setMemberAddress(address);
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int date=Integer.parseInt(request.getParameter("date"));
		Calendar d=Calendar.getInstance();
		d.set(year,month,date);
		m.setBirthday(new Date(d.getTimeInMillis()));
		System.out.println(m);
		int result=new MemberService().insertMember(m);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="가입에 성공하였습니다.";
			loc="/";
			
		}else {
			msg="가입에 실패하였습니다.";
			loc="/view/join.jsp";
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
