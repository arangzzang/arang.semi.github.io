<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.en.inquiry.model.vo.Inquiry"
	import="java.util.List"%>
<%
	List<Inquiry> list = (List) request.getAttribute("list");

	String msg = request.getParameter("msg");
	int no = 0;
	if(msg != null){
		no = Integer.parseInt(request.getParameter("no")); 
	}
%>
<%@ include file="/view/common/header.jsp"%>

<script type="text/javascript">
    $(function () {
        $(".inquiryUI").click(function () {
            $(this).next().slideToggle(500);
        })
    });
	$("#listBack").click(e =>{
		location.assign('<%=request.getContextPath()%>/searchNotice');
	});
</script>

<section id="inquiry-container">
        <div class="inquiry-left"></div>
        <div class="inquiry-right">
            <h1>Ensalade</h1>
            <h2>관리자용 1:1문의</h2>
            <hr>
            <div id="inquiryUI-wrap">
                <%for (Inquiry ii : list) {	%>
                <div class="inquiryUI content_top">
                    <ul id="inquiryUl" class="form-control">
                        <li><%=ii.getInquiryType()%></li>
                        <li><%=ii.getInquiryTitle()%></li>
                       	<li><%=ii.getInquiryWriter()%></li>
                        <li><%=ii.getInquiryWriteDate()%></li>
                        <li class="answer-check"><p><%=ii.getCommentStatus()%></p></li>
                    </ul>
                </div>
                <div id="inquiry-contents">
                	<%if(ii.getFilePath().contains("null")){ %>
				
					<%}else{%>
					<div class="image-upload-wrap cimg content_row" id="imgContainer">
						<img class="form_image"
							src="<%=request.getContextPath()%><%=ii.getFilePath()%>"
							width="100%" height="100%">
					</div>
					<% }%>
                    <div>
                        <p><%=ii.getInquiryContent()%></p>
                    </div> 
                    <hr>
                    <div class="mamager-answer content_row content_top"	id="inquiry_Manager_answer">
                    <%if(ii.getInquiryComment()==null){ %>
                        <form action="<%=request.getContextPath()%>/Inquriry/InquriryManagerTextServlet">
                            <input type="hidden" name="no" value="<%=ii.getInquiryNo()%>">
                            <textarea class="form-control content_row" name="MangerText" rows="5" cols="33"></textarea>
                            <button type="submit">답변</button>
                        </form>
					<%}else{ %>
						<div class="mamager-answer_label">
							<label>A</label>
						</div>
						<div class="mamager-answer_content">
							<p><%=ii.getInquiryComment()%></p>
						</div>
					<%} %>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <div id="inquiry-sort"></div>
    </section>

<style>
.mamager-answer_content>p {font-size: 16px;width: 100%;height: 50px;float: left;margin: -39px 0 0 0;resize: none;}

.mamager-answer_label>label {font-weight: 700;
    font-size: 20px;
    padding: 0 55px 0 55px;
    margin-top: -9px;
    float: left;}

.mamager-answer_content {float: right;padding:10px;}

.mamager-answer_label {float: left;font-size: 15px;}

.mamager-answer {display: flex;white-space: pre-wrap;}
.answer-check>p{
	color:red;
}
.content_top {
	margin-top: 10px;
}

.content_row {
	margin-bottom: 10px;
}

.form-control {
	display: block;
	box-sizing: border-box;
	height: 40px;
	width: 80%;
	padding: 0 15px;
	line-height: 40px;
	border-radius: 4px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 12px;
}

textarea.form-control {
	resize: none;
	line-height: 20px;
	padding-top: 9px;
	padding-bottom: 9px;
	min-height: 200px;
	min-width: 600px;
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

div#inquiryUI-wrap {
	position: relative;
}

ul#inquiryUl {
	display: flex;
	justify-content: space-around;
	width: 100%;
	background-color: rgba(187, 184, 184, 0.438);
}

ul#inquiryUl li {
	list-style-type: none;
}

div#inquiry-contents {
	display: none;
	height: auto;
}

#inquiry-sort {
	width: 500px;
}

#container {
	display: flex;
}

hr {
	width: 100%;
}

.inquiry-left {
	position: relative;
	width: 500px;
}

.inquiry-right {
	width: 100%;
}

.inquiry-right h1 {
	margin: 0 50px;
	font-size: 50px;
	left: 0;
}

.inquiry-right h2 {
	margin: 10px;
	font-size: 30px;
	left: 0;
}

section {
	padding-top: 150px;
	height: auto;
}

section#inquiry-container {
	position: relative;
	height: 100%;
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
</style>
<script>
	<%for(Inquiry i : list){
		if(i.getCommentStatus().contains("완료")){ %>
			$(".answer-check>p:contains('답변완료')").css("color","blue");
	<%}}%>
</script>
<%-- <%@ include file="/view/MyPage/inquiry/inquiryManger.jsp"%> --%>
