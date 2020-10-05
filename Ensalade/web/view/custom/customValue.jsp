<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.en.custom.model.vo.CustomOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int val=0;
	try{
	val=Integer.parseInt(request.getParameter("data1"));
	}catch(NumberFormatException e){
		val=0;
	}
	CustomOrder co=new CustomService().memberCustom2(val);
%>
<%if(co!=null){%>
<%=co.getCustomName()%>
<%}%>