<%@page import="com.en.admin.model.service.AdminService"%>
<%@page import="com.en.custom.model.service.CustomService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cNo=Integer.parseInt(request.getParameter("cNo"));
	int postNo=Integer.parseInt(request.getParameter("postNo"));
	
	int result=new AdminService().customCommentDelete(cNo);

	request.setAttribute("ref", postNo);
	request.getRequestDispatcher("/view/custom/commentList.jsp").forward(request, response);
	

%>