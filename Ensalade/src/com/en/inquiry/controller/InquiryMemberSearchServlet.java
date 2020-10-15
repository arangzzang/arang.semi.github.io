package com.en.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;
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
		//user_no 받음
		int memberNo = Integer.parseInt(request.getParameter("no"));
		//페이징처리
		int cPage;
		String pageBar = "";
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (Exception e) {
			cPage = 1;
		}
			System.out.println("cPage:"+cPage);
		int numPerPage = 5;
		List<Inquiry> member = new InquiryService().searchMemberInquiry(memberNo,cPage, numPerPage);
		int totalData = new InquiryService().inquiryCount(memberNo);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize) *pageBarSize +1;
		int pageEnd = pageNo + pageBarSize -1;
		//이전 처리
		if(pageNo == 1) {
			pageBar += "<i class='"+"fas fa-chevron-left fa-1x"+"'></i>";
		}else {
			pageBar+= "<a href='"+request.getContextPath()+"/inquiry/searchInquiryMem?no="+memberNo
						+"&cPage="+(pageNo-1)+"'><i class='"+"fas fa-chevron-left fa-1x"+"'></i></a>";
		}
		//페이지처리
		while(!(pageNo > pageEnd || pageNo> totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<span>" +pageNo + "</span>"; 
			}else {
				pageBar += "<a href='"+request.getContextPath()+"/inquiry/searchInquiryMem?no="+memberNo+"&cPage="+pageNo+"'>  "+pageNo+" </a>";
			}
			pageNo++;
		}
		//다음처리
		if(pageNo > totalPage) {
			pageBar += "<i class='"+"fas fa-chevron-right fa-1x"+"'></i>";
		}else {
			pageBar += "<a href='"+request.getContextPath()+"/inquiry/searchInquiryMem?no="+memberNo+"&cPage="+pageNo+"'><i class='"+"fas fa-chevron-right fa-1x"+"'></i></a>";
		}
		request.setAttribute("pageBar", pageBar);
//			System.out.println(pageBar);
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
