package com.en.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.admin.model.service.AdminService;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class SelectMemberServlet
 */
@WebServlet("/admin/memberAll")
public class SelectMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage = 0;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=5;
		String type = request.getParameter("searchType");
		String key = request.getParameter("searchKeyword");
		
		System.out.println(type);
		System.out.println(key);
		
		int totalData = 0;
		List<Member> list = new ArrayList<Member>();
		String pageBar = "";
		//전체 리스트보기
		if(type==null && key == null) {
			list = new AdminService().selectMemberAll(cPage, numPerPage);
			totalData = new AdminService().memberCount();
			int totalPage = (int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize = 5;
			int pageNo = ((cPage-1)/pageBarSize)*pageBarSize +1;
			int pageEnd = pageNo + pageBarSize -1;
			if(pageNo ==1) {
				pageBar += "<span>[이전]<span>";
			}else {
				pageBar += "<a href='"+request.getContextPath()+"/admin/memberAll?cPage="+(pageNo-1)+"'> [이전] </a>";
			}
			while (!(pageNo > pageEnd || pageNo > totalPage)) {
				if (pageNo == cPage) {
					pageBar += "<span>" + pageNo + "</span>";
				} else {
					pageBar += "<a href='" + request.getContextPath() + "/admin/memberAll?cPage=" + pageNo + "'> " + pageNo + " </a>";
				}
				pageNo++;
			}
			if (pageNo > totalPage) {
				pageBar += "<span>[다음]</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/memberAll?cPage=" + pageNo + "'> [다음] </a>";
			}
			
		//이름, 아이디, 생일, 매니저여부 리스트
		}else {
			list = new AdminService().selectMemberAll(cPage, numPerPage, type, key);
			totalData = new AdminService().memberCount(type, key);
			int totalPage = (int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize = 5;
			int pageNo = ((cPage-1)/pageBarSize)*pageBarSize +1;
			int pageEnd = pageNo + pageBarSize -1;
			if(pageNo ==1) {
				pageBar += "<span>[이전]<span>";
			}else {
				pageBar += "<a href='"+request.getContextPath()+"/admin/memberAll?cPage="+(pageNo-1)+"&searchType="+type+"&searchKeyword="+key+"'> [이전] </a>";
			}
			while (!(pageNo > pageEnd || pageNo > totalPage)) {
				if (pageNo == cPage) {
					pageBar += "<span> " + pageNo + " </span>";
				} else {
					pageBar += "<a href='" + request.getContextPath() + "/admin/memberAll?cPage=" + pageNo 
							+ "&searchType="+type+"&searchKeyword="+key+"'> "+ pageNo +" </a>";
				}
				pageNo++;
			}
			if (pageNo > totalPage) {
				pageBar += "<span>[다음]</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/memberAll?cPage=" + pageNo + "&searchType="+type+"&searchKeyword="+key+"'> [다음] </a>";
			}
		}
		request.setAttribute("pageBar1", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/admin/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
