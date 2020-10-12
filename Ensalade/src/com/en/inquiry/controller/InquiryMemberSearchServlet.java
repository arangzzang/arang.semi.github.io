package com.en.inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.inquiry.model.service.InquiryService;
import com.en.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryMemberSearchServlet
 */

//일반 회원 1대1문의 서블릿
@WebServlet("/inquiry/searchInquiryMem")
public class InquiryMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryMemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원용 리스트 출력
		int memberNo = Integer.parseInt(request.getParameter("no"));
		List<Inquiry> member = new InquiryService().searchMemberInquiry(memberNo);
		request.setAttribute("list", member);
		request.getRequestDispatcher("/view/MyPage/inquiry/inquiry.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
