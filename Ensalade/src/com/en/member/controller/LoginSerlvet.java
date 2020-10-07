package com.en.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.member.model.service.MemberService;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class LoginSerlvet
 */
@WebServlet(urlPatterns="/loginjoin/login.do")
public class LoginSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String userPw=request.getParameter("password");
		Member m=new MemberService().selectId(userId,userPw);//아이디,비번확인
		String msg="";
		String loc="";
		if(m!=null && m.getMangerYn().equals("Y")) {//관리자 일때
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			response.sendRedirect(request.getContextPath());
			return;
		}
		if(m!=null) {//회원일때
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			loc=request.getParameter("loc");
			if(loc==null){//정상 로그인
				response.sendRedirect(request.getContextPath());
			}else{//로그인필요한 서비스 이용할려고 접근했다가 로그인했을때
				response.sendRedirect(request.getContextPath()+loc);
			}
				
		}else {
			msg="아이디나 비밀번호가 일치하지 않습니다.";
			loc="/view/login.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
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
