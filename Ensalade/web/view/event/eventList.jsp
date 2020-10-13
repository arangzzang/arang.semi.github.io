<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "com.en.event.model.vo.Event"%> 
<%@page import="java.util.List" %>
<%@ include file="/view/common/header.jsp"%>
<%
    List<Event> list= (List)request.getAttribute("list");
	DecimalFormat formatter=new DecimalFormat("###,###");
	

%>
<section class="event-wrap">
   <div class="event-container">
		<div class="event-title-wrap">
			<h2>Event</h2>
		</div>
   <%for(Event e: list){
   		String product_number= formatter.format(e.getProductPrice()-(e.getProductPrice()*e.getSalePer()/100));%>
		<div class="event-view_area">
			<%if(e.getEventCategory().equals("기타")) {%>
			<a class="aEvent" href="<%=request.getContextPath()%>/event/eventView?code=<%=e.getEventCode()%>">
				<img class="imageEvent" src="<%=request.getContextPath()%><%=e.getThumnail()%>">
			</a>
			<%}else if(e.getEventCategory().equals("메뉴")) {%>
			<a class="aEvent" href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=e.getProductNo() %><%=e.getSalePer()!=0 ?"&product_number="+product_number  : ""%>">
				<img class="imageEvent" src="<%=request.getContextPath()%><%=e.getThumnail()%>">
			</a>
			<%}else if(e.getEventCategory().equals("카테고리")) {%>
			<a class="aEvent" href="#">
				<img class="imageEvent" src="<%=request.getContextPath()%><%=e.getThumnail()%>">
			</a>
			<%}else if(e.getEventCategory().equals("시즌")) {%>
			<a class="aEvent" href="#">
				<img class="imageEvent" src="<%=request.getContextPath()%><%=e.getThumnail()%>">
			</a>
			<%}%>
		</div>
		<input type="hidden" name="code" value="<%=e.getEventCode()%>">
		<%}
		if (loginMember != null && loginMember.getMemberId().equals("admin")) {%>
		<div class="event-button">
			<button class="form-control_input_btn" type="button" onclick="location.replace('<%=request.getContextPath()%>/admin/eventWrite')">글쓰기</button>
		</div>
		<%}%>
	</div>
</section>
<style>
.event-button{margin: 10px 0 40px;font-size: 0;	padding: 20px 0;text-align:center;margin: 0 50px;}
.event-view_area{padding: 39px 0 50px;}
.event-title-wrap{text-align: center;}
.event-wrap {padding-top: 100px; height:auto;}
.event-container{}
.aEvent{display: block; margin: 20px auto;height:240px; max-width: 1024px;}
.imageEvent{width: 100%;}
.padd {margin-right: 10px;}
.noticeV-button {margin: 10px 0 40px;font-size:0;padding: 20px 0;text-align:center;margin: 0 50px;}
.gRight {float: right;text-align: right; }
.gLeft {float: left;text-align: left;}
.form-control_input_btn {height: 25px;width: 100px;height: 25px;box-sizing:border-box;border-radius:4px;font-size: 14px;font-weight: 400;	cursor: pointer;	border-style: none;	font-weight: inherit;}
</style>
 
<%@ include file="/view/common/footer.jsp"%>