<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "com.en.event.model.vo.Event"%> 
<%@page import="java.util.List" %>
<%@ include file="/view/common/header.jsp"%>
    
<style type="text/css">
section {padding-top: 100px; height:auto;}	
    .aEvent{display: block; margin: 20px auto; height: 240px; max-width: 1024px;}
    .imageEvent{width: 100%;}
</style>
<%
    List<Event> list= (List)request.getAttribute("list");
%>

<section>
   <%for(Event e: list){%>
   <div>
   	<a class="aEvent" href="<%=request.getContextPath()%>/event/eventView?code=<%=e.getEventCode()%>">
      <img class="imageEvent" src="<%=request.getContextPath()%><%=e.getThumnail()%>">
    </a>
   </div>
   <% } %>
   <input type="button" value="글쓰기" onclick="">  
</section>


 
<%@ include file="/view/common/footer.jsp"%>