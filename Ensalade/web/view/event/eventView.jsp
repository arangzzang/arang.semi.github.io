<%@page import="com.en.event.model.vo.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<%
	List<Event> list = (List)request.getAttribute("list");
	String code = request.getParameter("code");
%>

<section id="content-wrap">
	<h2>이벤트</h2>
		<div class="e_container">
			<div id = "imgContent">
			<%for(Event e : list){ %>
				<div id="imgDiv">
					<img class="eventPageImg" src="<%=request.getContextPath()%><%=e.getEventImg() %>">
				</div>
			<%} %>
			</div>
			<div class="noticeV-button">
					<div>
						<input class="form-control_input_btn" type="button" value="목록" id="listBack">
					</div>
				<%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
					<div style="display: flex; margin-right: 20px;">
						<input class="form-control_input_btn padd" type="button" value="수정하기" id="updateBtn">
						<input class="form-control_input_btn padd" type="button" value="삭제하기"	id="deleteBtn">
					</div>
				 <input type="hidden" id="eventNo" value="<%=code%>">
				<%} %>
			</div>
		</div>
</section>

	
<script>
	let code = $("#eventNo").val();
	$("#updateBtn").click(e => {
		location.assign('<%=request.getContextPath()%>/admin/updateEvent?no='+no);
	});
	
	$("#deleteBtn").click(e => {
		let result = confirm("삭제하시겠습니까?");
		if(result){
			location.replace('<%=request.getContextPath()%>/admin/deleteNotice?no='+no);
		}else{}
	});
	$("#listBack").click(e =>{
		location.assign('<%=request.getContextPath()%>/searchNotice');
	});
</script>


<style>
div#imgContent {
	margin: 20px auto;
}

div#imgDiv {
	width: 100%;
}

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

.e_container {
	width: 100%;
	display: inline;
}
section#content-wrap{
	text-align:center;
	padding-top: 100px;
	height: auto;
}
</style>
<%@include file="/view/common/footer2.jsp"%>