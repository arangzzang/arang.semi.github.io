<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.en.inquiry.model.vo.Inquiry"
	import="java.util.List"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/inquiry/inquiryListMem.css">
<%@ include file="/view/common/header.jsp"%>
<%
	List<Inquiry> list = (List) request.getAttribute("list");
%>

<script type="text/javascript">
    $(function () {
        $(".inquiryUI").click(function () {
            $(this).next().slideToggle(700);
        });
    });
    
	//글쓰기버튼
    $("#writeBtn").click(e =>{
		location.assign('<%=request.getContextPath()%>/inquiry/inquiryWrite');
	});
	
   
</script>

<section id="inquiry-container">
	<div class="inquiry-right">
		<h1>Ensalade</h1>
		<h2>1:1문의</h2>
		<hr>
		<div id="inquiryUI-wrap">
			<%
				for (Inquiry ii : list) {
			%>
			<div class="inquiryUI content_top">
				<ul id="inquiryUl" class="form-control">
					<li><%=ii.getInquiryType()%></li>
					<li><%=ii.getInquiryTitle()%></li>
					<!-- <li><%=ii.getInquiryWriter()%></li> -->
					<li><%=ii.getInquiryWriteDate()%></li>

					<li class="answer-check"><p><%=ii.getCommentStatus()%></p></li>
				</ul>
			</div>
			<div id="inquiry-contents">
				<%if (ii.getFilePath().contains("null")) {} else {%>
				<div class="image-upload-wrap cimg content_row" id="imgContainer">
					<img class="form_image"
						src="<%=request.getContextPath()%><%=ii.getFilePath()%>">
				</div>
				<%}	%>
				<div class="content_row border">
					<p><%=ii.getInquiryContent()%></p>
				</div>

				<%if (ii.getInquiryComment() != null) {	%>
				<div class="manager-answer-wrap content_row content_top" id="inquiry_Manager_answer">
					<div class="manager-answer">
						<div class="manager-answer_label">
							<label>A</label>
						</div>
						<div class="manager-answer_content">
							<p><%=ii.getInquiryComment()%></p>
						</div>
					</div>
				</div>
				<%}	%>
			</div>
			<%}	%>
			<!-- 글쓰기버튼 -->
			<div class="inquiryV-button-wrap">
				<div style="margin-right: 20px;">
					<form action="<%=request.getContextPath()%>/inquiry/inquiryWrite">
						<button class="form-control_input_btn" type="submit">글쓰기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/view/common/footer.jsp"%>

<script>
<%for (Inquiry i : list) {
	if (i.getCommentStatus().contains("완료")) {%>
	$(".answer-check>p:contains('답변완료')").css("color","blue");
<%}}%>
</script>
