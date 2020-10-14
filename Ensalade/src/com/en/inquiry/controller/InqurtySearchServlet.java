package com.en.inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.inquiry.model.service.InquiryService;
import com.en.inquiry.model.vo.Inquiry;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class InquiryServlet
 */
@WebServlet("/admin/inquiry")

//관리자 1대1문의 서블릿
public class InqurtySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InqurtySearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		if (m == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("loc", "/view/login.jsp");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}

		List<Inquiry> list = new InquiryService().SerchInqurty();
		request.setAttribute("list", list);

		request.getRequestDispatcher("/view/MyPage/inquiry/inquiryManager.jsp").forward(request, response);

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