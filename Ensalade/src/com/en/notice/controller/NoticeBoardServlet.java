package com.en.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.notice.model.service.NoticeService;
import com.en.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class NoticeBoardServlet
 */

//전체 리스트 및 검색 후 리스트를 보여줄 수 있는 서블릿

@WebServlet("/searchNotice")
public class NoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeBoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 5;

		String type = request.getParameter("searchType");
//		System.out.println(type);
		String key = request.getParameter("searchKeyword");
//		System.out.println(key);
		
//		String key2=request.getParameter("searchKeyword2");
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
//		
//		try {
//			Date key3 = transFormat.parse(key2);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		int totalData = 0;
		List<NoticeBoard> list = new ArrayList<NoticeBoard>();
		String pageBar = "";

		//제목 또는 날짜로 검색했을때
		if (type != null && key != null) {
			
			list = new NoticeService().searchNotice(type, key, cPage, numPerPage);

			totalData = new NoticeService().noticeCount2(type, key);

			int totalPage = (int) Math.ceil((double) totalData / numPerPage);
			int pageBarSize = 5;
			int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
			int pageEnd = pageNo + pageBarSize - 1;
			
			//이전
			if (pageNo == 1) {
				pageBar += "<span>[이전]</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/searchNotice?cPage=" + (pageNo - 1)
								+ "&searchType=" + type + "&searchKeyword=" + key + "'>[이전]</a>";
			}
			
			//페이징
			while (!(pageNo > pageEnd || pageNo > totalPage)) {
				if (pageNo == cPage) {
					pageBar += "<span>" + pageNo + "</span>";
				} else {
					pageBar += "<a href='" + request.getContextPath() + "/searchNotice?cPage=" + pageNo + "&searchType="
									+ type + "&searchKeyword=" + key + "'>" + pageNo + "</a>";
				}
				pageNo++;
			}
			
			//다음
			if (pageNo > totalPage) {
				pageBar += "<span>[다음]</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/searchNotice?cPage=" + pageNo + "&searchType="
								+ type + "&searchKeyword=" + key + "'>[다음]</a>";
			}
		
		//전체 리스트보기
		} else {
			list = new NoticeService().noticeList(cPage, numPerPage);

			totalData = new NoticeService().noticeCount();

			int totalPage = (int) Math.ceil((double) totalData / numPerPage);
			int pageBarSize = 5;
			int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
			int pageEnd = pageNo + pageBarSize - 1;

			if (pageNo == 1) {
				pageBar += "<span>[이전]</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/searchNotice?cPage=" + (pageNo - 1)
						+ "'>[이전]</a>";
			}

			while (!(pageNo > pageEnd || pageNo > totalPage)) {
				if (pageNo == cPage) {
					pageBar += "<span>" + pageNo + "</span>";
				} else {
					pageBar += "<a href='" + request.getContextPath() + "/searchNotice?cPage=" + pageNo + "'>" + pageNo
							+ "</a>";
				}
				pageNo++;
			}

			if (pageNo > totalPage) {
				pageBar += "<span>[다음]</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/searchNotice?cPage=" + pageNo + "'>[다음]</a>";
			}
		}

		request.setAttribute("pageBar2", pageBar);

		request.setAttribute("list", list);

		request.getRequestDispatcher("/view/notice/notice.jsp").forward(request, response);

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
