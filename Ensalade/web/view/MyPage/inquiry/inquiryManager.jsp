<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.en.inquiry.model.vo.Inquiry"
	import="java.util.List"%>
<%
	List<Inquiry> list = (List) request.getAttribute("list");
%>
<%@ include file="/view/common/header.jsp"%>

<script type="text/javascript">
    $(function () {
        $(".inquiryUI").click(function () {
            $(this).next().slideToggle(500);
        })
    });
</script>

<section id="inquiry-container">
        <div class="inquiry-left"></div>
        <div class="inquiry-right">
            <h1>Ensalade</h1>
            <h2>1:1문의</h2>
            <hr>
            <div id="inquiryUI-wrap">
                <%for (Inquiry ii : list) {	%>
                <div class="inquiryUI content_top">
                    <ul id="inquiryUl" class="form-control">
                        <li><%=ii.getInquiryType()%></li>
                        <li><%=ii.getInquiryTitle()%></li>
                        <!-- <li><%-- <%=ii.getInquiryWriter()%> --%></li> -->
                        <li><%=ii.getInquiryWriteDate()%></li>
                        <li><%=ii.getCommentStatus()%></li>
                    </ul>
                </div>
                <div id="inquiry-contents">
                    <div>
                        <p><%=ii.getInquiryContent()%></p>
                    </div>
                    <hr>
                    <div>
                        <img src="<%=request.getContextPath()%><%=ii.getFilePath()%>" width="600" height="500">
                    </div>
                    <div>
                    <%if(ii.getInquiryComment()==null){ %>
                        <label>답변</label>
                        <form action="<%=request.getContextPath()%>/Inquriry/InquriryManagerTextServlet">
                            <input type="hidden" name="no" value="<%=ii.getInquiryNo()%>">
                            <textarea class="form-control content_row" name="MangerText" rows="5" cols="33"></textarea>
                            <button type="submit">답변</button>
                        </form>
					<%}else{ %>
						 
					<%} %>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <div id="inquiry-sort"></div>
    </section>

<style>
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
<%-- <%@ include file="/view/MyPage/inquiry/inquiryManger.jsp"%> --%>
