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
	String code = request.getParameter("code");
%>

<section style="text-align:center;">
	<h2>이벤트</h2>
	<div id = "imgContent">
	<%for(EventContent e : list){ %>
		<div id="imgDiv">
			<img class="eventPageImg" src="<%=request.getContextPath()%><%=e.getEventImg() %>">
		</div>
	<%} %>
	</div>

	<div class="noticeV-button">
		<span class="gLeft">
			<div>
				<input class="form-control_input_btn" type="button" value="목록" id="listBack">
			</div>
		</span>
		<%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
		<span class="gRight">
			<div style="display: flex; margin-right: 20px;">
				<input class="form-control_input_btn padd" type="button" value="수정하기" id="updateBtn">
				<input class="form-control_input_btn padd" type="button" value="삭제하기"	id="deleteBtn">
			</div>
		</span> <input type="hidden" id="eventNo" value="<%=code%>">
		<%} %>
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
<%@include file="/view/common/footer.jsp"%>