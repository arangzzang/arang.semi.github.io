package com.en.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.FAQ.model.vo.FAQ;
import com.en.admin.model.service.AdminService;

/**
 * Servlet implementation class FAQupdateEndServlet
 */
@WebServlet("/admin/FAQupdateEnd")
public class FAQupdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQupdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FAQ f = new FAQ();
		f.setFaqNo(Integer.parseInt(request.getParameter("no")));
		f.setFaqQuestion(request.getParameter("question"));
		f.setFaqAnswer(request.getParameter("content"));
		
		int result = new AdminService().updateFAQ(f);
		
		String msg = "";
		String loc = "/FAQ/FAQboard";
		if(result>0) {
			msg = "성공적으로 수정되었습니다.";
		}else {
			msg = "수정실패..개발자에게 문의...";
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
