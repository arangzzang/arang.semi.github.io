<%@page import="com.en.event.model.vo.EventContent"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>
<style>
section {padding-top: 100px; height:auto;}	
	div#imgContent{ margin: 20px auto;}
	div#imgDiv{width:100%;}
	.eventPageImg{display: block; position: relative; left: 20%;}
</style>
<%
	List<EventContent> list = (List)request.getAttribute("list");
%>

<section style="text-align:center;">
	<div id = "imgContent">
	<%if(list.isEmpty()){
		System.out.print("없다!!!!");
	}else{
		System.out.print("있당!!!!!");
	for(EventContent e : list){ %>
		<div id="imgDiv">
			<img class="eventPageImg" src="<%=request.getContextPath()%><%=e.getEventImg() %>">
		</div>
	<%}}  %>
	</div>
	
	<button id="backBtn">돌아가기</button>
	
	<script type="text/javascript">
		$("#backBtn").click(e => {
			location.assign("<%=request.getContextPath()%>/event/eventList");
		});
	</script>
</section>

<%@include file="/view/common/footer.jsp"%>