<%@page import="com.en.custom.model.service.CustomService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no=Integer.parseInt(request.getParameter("no"));
	int result=new CustomService().deletePost(no);
	
	if(result>0){
		request.setAttribute("msg", "삭제되었습니다.");
		request.setAttribute("loc", "/custom/customList");
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}else{
		request.setAttribute("msg", "삭제에 실패했습니다.");
		request.setAttribute("loc", "/custom/customList");
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}
%>