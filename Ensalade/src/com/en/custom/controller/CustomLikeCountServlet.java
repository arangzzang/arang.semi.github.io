package com.en.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.custom.model.service.CustomService;

/**
 * Servlet implementation class CustomListCountServlet
 */
@WebServlet("/custom/likeCount")
public class CustomLikeCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomLikeCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//좋아요 증가 서블릿
		String id=request.getParameter("userId");
		if(id.equals("")) {
			response.sendRedirect(request.getContextPath()+"/view/loginAlert.jsp");
			return;
		}
		
		int cIdx=Integer.parseInt(request.getParameter("like_count"));
		
		Cookie[] ck=request.getCookies();
		boolean flag=false;
		String like=id;
		if(ck!=null) {
			for(Cookie c:ck) {
				String name=c.getName();
				String value=c.getValue();
				if("like".equals(name)) {
					like=value;
					if(!value.contains(id)) {
						like=id;
						break;
					}
					if(value.contains("|"+cIdx+"|")) {
						flag=true;
						like=value.replace("|"+cIdx+"|", "");
						break;
					}
				}
			}
		}
		if(!flag) {
			Cookie c=new Cookie("like",like+"|"+cIdx+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
			int result=new CustomService().likeCount(cIdx);
			System.out.println(c.getValue());
		}else {
			
			Cookie c=new Cookie("like",like);
			c.setMaxAge(-1);
			response.addCookie(c);
			new CustomService().likeCount2(cIdx);
			System.out.println(c.getValue());
		}
		
		
		
		int likeCount=new CustomService().searchCount(cIdx);
		
		response.getWriter().print(likeCount);
		/*
		 * request.setAttribute("like", likeCount);
		 * request.getRequestDispatcher("/view/custom/customLikeCount.jsp").forward(
		 * request, response);
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
