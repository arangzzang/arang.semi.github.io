<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<% 
	String msg = (String)request.getAttribute("msg");  
	String loc = (String)request.getAttribute("loc");	
%>

<section style="text-align:center;">
	
	<script type="text/javascript">
		alert('<%=msg%>');
		
		location.replace("<%=request.getContextPath()%><%=loc%>");
	</script>
	
				
</section>

<%@include file="/view/common/footer.jsp"%>