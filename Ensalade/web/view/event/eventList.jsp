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
   
	<div class="noticeV-button">
		<%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
		<span class="gRight">
			<div style="display: flex; margin-right: 20px;">
				<input class="form-control_input_btn padd" type="button" value="수정하기" id="updateBtn" />
			</div>
		</span>
		<%} %>
	</div>
	
</section>

<style>
.padd {
	margin-right: 10px;
}

.noticeV-button {
	margin: 10px 0 40px;
	font-size: 0;
	padding: 20px 0;
	text-align: center;
	margin: 0 50px;
}

.gRight {
	float: right;
	text-align: right;
}

.gLeft {
	float: left;
	text-align: left;
}
.form-control_input_btn {
	height: 25px;
	width: 100px;
	height: 25px;
	box-sizing: border-box;
	border-radius: 4px;
	font-size: 14px;
	font-weight: 400;
	cursor: pointer;
	border-style: none;
	font-weight: inherit;
}
</style>

 
<%@ include file="/view/common/footer.jsp"%>