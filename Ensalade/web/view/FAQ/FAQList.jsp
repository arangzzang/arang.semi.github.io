<%@page import="com.en.FAQ.model.vo.FAQ"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<%
	List<FAQ> list = (List) request.getAttribute("list");
	
%>

<script type="text/javascript">
        $(function () {
            $(".faqUI-wrap-list").click(function () {
                $(this).next().slideToggle(500);
            })
        })
    </script>

    <section id="faq-container">
        <div class="faq-wrap">
            <h1>Ensalade</h1>
            <h2>FAQ</h2>
            <hr>
            <div id="faqUI-wrap">
                <%if (list != null) {
                    for (FAQ f : list) {%>
                <div class="faqUI-wrap-list content_top">
                    <ul id="inquiryUl" class="form-control faq-list-height content_row">
                        <li>
                            <div class="faq-list" style="display: flex;">
                                <p class="content_right" style="font-size: 30px;font-weight: 700;"><strong>Q</strong></p>
                                <p style="font-size: 20px;font-weight: 600;"><%=f.getFaqQuestion()%></p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div id="inquiry-contents">
                    <div class="content_row" style="display: flex;">
                        <p class="content_right" style="font-size: 30px;font-weight: 700;"><strong>A</strong></p>
                        <p style="font-size: 20px; white-space: pre-line;margin-top: 8px;"><%=f.getFaqAnswer()%></p>
                    </div>
                </div>
                <%if(loginMember!=null && loginMember.getMemberId().equals("admin")) { %>
                <div>
                    <form action="<%=request.getContextPath()%>/admin/updateFAQ">
                    	<input type="hidden" name="no" value=<%=f.getFaqNo()%>>
                        <button class="form-control_input_btn padd" type="submit">수정하기</button>
                    </form>
                </div>
                <%}}}%>
                <!-- 글쓰기버튼 -->
                <%if(loginMember!=null && loginMember.getMemberId().equals("admin")) { %>
                <hr>
                <div class="faq-button-wrap">
                    <div class="faqUI-wrap-list">
                        <div class="form-control_input_btn padd">글쓰기</div>
                    </div>
                    <div class="faq-button-wrap-list">
                    <form action="<%=request.getContextPath()%>/admin/faqWrite">
                        <div id="title">
                            <input class="form-control content_row" type="text" name="question" placeholder="질문입력" required>
                        </div>
                        <div id="content">
                            <textarea class="form-control content_row" name="content" cols="30" rows="10" placeholder="내용입력" required></textarea>
                        </div>
                        <button class="form-control_input_btn padd" type="submit">글쓰기</button>
                    </form>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </section>

<style>
.faq-button-wrap-list{
	display:none;
}
.content_right {
	padding-right: 20px;
}

.faq-list-height {
	height: 50px;
}

.answer-check>p {
	color: red;
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

.padd {
	margin-right: 10px;
}

.faq-button-wrap {	
	margin: 10px 0 40px;
	font-size: 0;
	padding: 20px 0;
	text-align: center;
	margin: 0 50px;
}

.mamager-answer_content>textarea {
	font-size: 16px;
	width: 100%;
	height: 50px;
	float: left;
	margin: -39px 0 0 0;
	border: none;
	resize: none;
}

.mamager-answer_label>label {
	font: normal;
	font-weight: 700;
	font-size: 20px;
}

.mamager-answer_content {
	float: right;
	width: 80%;
}

.mamager-answer_label {
	float: left;
	width: 20%;
	font-size: 15px;
}

.mamager-answer {
	display: flex;
	white-space: pre;
}

.form_image {
	top: 50%;
	left: 50%;
	width: 100%;
}

.content_top {
	margin-top: 10px;
}

.content_row {
	margin-bottom: 10px;
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
	white-space: pre-line;
}

div#faqUI-wrap {
	position: relative;
}

ul#inquiryUl {
	display: flex;
	justify-content: space-around;
	width: 100%;
	background-color: rgba(187, 184, 184, 0.438);
	 transition: background 3s;
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

.faq-wrap {
	width: 100%;
}

.faq-wrap h1 {
	margin: 0 50px;
	font-size: 50px;
	left: 0;
}

.faq-wrap h2 {
	margin: 10px;
	font-size: 30px;
	left: 0;
}

section {
	padding-top: 150px;
	height: auto;
}

section#faq-container {
	position: relative;
	height: 100%;
	width: 800px;
	margin: 0 auto;
	text-align: center;
}
.faqUI-wrap-list:hover{
 transform: translateY(-2px);
  box-shadow: 2px 2px 5px -1px rgba(0,0,0,.35);
    transition: all .4s;
     background: #f5f5ea;
  transition: background .45s;
  barder:0;
  border-radius: 4px;
}
.faqUI-wrap-list:hover:active{
	transform: translateY(10px);
  box-shadow: 0px -1px 2px 0px rgba(0,0,0,.35);
    transition: all .4s;
   
 
}
</style>
<%@include file="/view/common/footer2.jsp"%>