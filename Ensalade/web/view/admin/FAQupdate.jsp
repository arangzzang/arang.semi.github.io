<%@page import="com.en.FAQ.model.vo.FAQ"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>
<%
	FAQ f = (FAQ)request.getAttribute("f");
%>
<script>
     $(".form2").focus(e=>{
        $(e.target).css("outline-color","#27b06e");
     });
     
     $("#backList").click(e => {
    	location.replace("<%=request.getContextPath()%>/FAQ/FAQboard"); 
     });
     
</script>
<section class="contents-wrap">
        <div id="notice-container">
		<form action="<%=request.getContextPath()%>/admin/FAQupdateEnd">
			<div class="">
				<h2>FAQ수정</h2>
			</div>
			<div class="notice-view_area">
				<div id="title">
					<input class="form-control content_row form2" type="text" name="question"><%=f.getFaqQuestion()%>
				</div>
				<div id="">
					<textarea class="form-control content_row form2" name="content" cols="60" rows="5"><%=f.getFaqAnswer() %></textarea>
				</div>
				<input type="hidden" name="no" value="<%=f.getFaqNo()%>">
				<div class="noticeV-button">
					<span class="gLeft">
						<input class="form-control_input_btn" type="button" value="목록" 	id="backList">
					</span> 
					<span class="gRight">
						<input class="form-control_input_btn padd" type="submit" value="수정하기">
					</span>
				</div>
			</div>
		</form>
	</div>
</section>

<style>
section {
	padding-top: 150px;
	height: auto;
}
textarea.form-control {
	resize: none;
	line-height: 20px;
	padding-top: 9px;
	padding-bottom: 9px;
	min-height: 200px;
}

.form-control {
	display: block;
	box-sizing: border-box;
	height: 40px;
	width: 100%;
	padding: 0 15px;
	line-height: 40px;
	border-radius: 4px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 12px;
}

.content_top {
	margin-top: 10px;
}

.content_row {
	margin-bottom: 10px;
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

.gRight {
	float: right;
	text-align: right;
}

.gLeft {
	float: left;
	text-align: left;
}

.notice-view_area {
	padding: 39px 0 50px;
	border-top: 1px solid #cdcdcd;
}

section.contents-wrap {
	position: relative;
	height: 100%;
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

.form-control_input_btn {
	height: 25px;
	width: 115px;
	height: 40px;
	box-sizing: border-box;
	border-radius: 4px;
	font-size: 14px;
	font-weight: 400;
	cursor: pointer;
	border-style: none;
	font-weight: inherit;
	background: #27b06e;
	color: #ffffff;
}
</style>

<%@ include file="/view/common/footer.jsp"%>