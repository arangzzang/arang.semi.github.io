package com.en.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;
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
		String type = request.getParameter("searchType");
		String key = request.getParameter("searchKeyword");
			System.out.println(type);
			System.out.println(key);
		int cPage;
		String pageBar = "";
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (Exception e) {
			cPage = 1;
		}
		System.out.println(cPage);
		int numPerPage = 5;
		int totalData = 0;
		List<Inquiry> list = new ArrayList<Inquiry>();
		// 전체리스트
		if (type == null && key == null) {
			list = new InquiryService().searchInquiry(cPage, numPerPage);
			totalData = new InquiryService().inquiryCountManager();
			int totalPage = (int) Math.ceil((double) totalData / numPerPage);
			int pageBarSize = 5;
			int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
			int pageEnd = pageNo + pageBarSize - 1;
			if (pageNo == 1) {
				pageBar += "<i class='" + "fas fa-chevron-left fa-1x" + "'></i>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/inquiry?cPage=" + (pageNo - 1)
						+ "'> <i class='" + "fas fa-chevron-left fa-1x" + "'></i> </a>";
			}
			while (!(pageNo > pageEnd || pageNo > totalPage)) {
				if (pageNo == cPage) {
					pageBar += "<span>" + pageNo + "</span>";
				} else {
					pageBar += "<a href='" + request.getContextPath() + "/admin/inquiry?cPage=" + pageNo + "'>  "
							+ pageNo + " </a>";
				}
				pageNo++;
			}
			if (pageNo > totalPage) {
				pageBar += "<i class='" + "fas fa-chevron-right fa-1x" + "'></i>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/inquiry?cPage=" + pageNo + "'><i class='"
						+ "fas fa-chevron-right fa-1x" + "'></i></a>";
			}

		} else {// 검색별
			list = new InquiryService().SerchInqurty(cPage, numPerPage, type, key);
			totalData = new InquiryService().inquiryCountManager(type, key);
			int totalPage = (int) Math.ceil((double) totalData / numPerPage);
			int pageBarSize = 5;
			int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
			int pageEnd = pageNo + pageBarSize - 1;
			if (pageNo == 1) {
				pageBar += "<i class='" + "fas fa-chevron-left fa-1x" + "'></i>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/inquiry?cPage=" + (pageNo - 1)
						+ "&searchType=" + type + "&searchKeyword=" + key + "'> <i class='"
						+ "fas fa-chevron-left fa-1x" + "'></i> </a>";
			}
			while (!(pageNo > pageEnd || pageNo > totalPage)) {
				if (pageNo == cPage) {
					pageBar += "<span>" + pageNo + "</span>";
				} else {
					pageBar += "<a href='" + request.getContextPath() + "/admin/inquiry?cPage=" + pageNo
							+ "&searchType=" + type + "&searchKeyword=" + key + "'> " + pageNo + " </a>";
				}
				pageNo++;
			}
			if (pageNo > totalPage) {
				pageBar += "<i class='" + "fas fa-chevron-right fa-1x" + "'></i>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/inquiry?cPage=" + pageNo 
						+ "&searchType=" + type + "&searchKeyword=" + key +"'><i class='"+ "fas fa-chevron-right fa-1x" + "'></i></a>";
			}
		}
		System.out.println(pageBar);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
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