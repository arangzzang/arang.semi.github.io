package com.en.custom.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.custom.model.service.CustomService;
import com.en.custom.model.vo.CustomPost;

/**
 * Servlet implementation class CustomPostSerlvet
 */
@WebServlet("/custom/customList")
public class CustomPostSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomPostSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String type=request.getParameter("searchType");
//		String key=request.getParameter("searchKeyword");
//		System.out.println(type);
//		System.out.println(key+"123");
		
		//게시판에 정보를 뿌려주는 서블릿
		
		List<CustomPost> list=new ArrayList();
		
		
		  
		  
		  list=new CustomService().customList();
		  
		  
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/view/custom/customPost.jsp").forward(request, response);
		
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
