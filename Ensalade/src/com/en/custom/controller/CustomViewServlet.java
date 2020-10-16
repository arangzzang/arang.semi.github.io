package com.en.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.custom.model.service.CustomService;
import com.en.custom.model.vo.CustomPost;

/**
 * Servlet implementation class CustomViewServlet
 */
@WebServlet("/custom/customView")
public class CustomViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//맨처음 상세페이지에 게시물 정보를 보내주는 서블릿
		
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		Cookie[] cookies=request.getCookies();
		String view="";
		boolean flag=false;
		if(cookies!=null) {
		for(Cookie c:cookies) {
		String name=c.getName();
		String value=c.getValue();
		if(name.equals("view")) {
			view=value;
			if(value.contains("|"+no+"|")) {
				flag=true;
				break;
			}
		}
		}
		}
		if(!flag) {
			Cookie c=new Cookie("view",view+"|"+no+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		
		
		CustomPost cp=new CustomService().selectCustomOne(no,flag);
		//List<CustomComment> cc=new CustomService().commentList(no);
		
		request.setAttribute("post", cp);
		//request.setAttribute("comment", cc);
		request.getRequestDispatcher("/view/custom/customPostView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
