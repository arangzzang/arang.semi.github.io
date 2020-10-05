package com.en.custom.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.custom.model.service.CustomService;
import com.en.custom.model.vo.CustomOrder;
import com.en.custom.model.vo.CustomPost;

/**
 * Servlet implementation class CustomWriteServlet
 */
@WebServlet("/custom/customWrite")
public class CustomWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		if(userId==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("loc","/view/login.jsp");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
		}else {
			List<CustomOrder> list=new CustomService().memberCustom(userId);
			for(CustomOrder c:list) {
				System.out.println(c);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/view/custom/customUpload.jsp").forward(request, response);
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
