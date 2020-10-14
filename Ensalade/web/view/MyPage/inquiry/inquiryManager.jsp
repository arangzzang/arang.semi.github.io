<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.en.inquiry.model.vo.Inquiry"
	import="java.util.List"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/inquiry/inquiryListManager.css">
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
	function ckAlert(){
		if(confirm("답변을 등록하시겠습니까?")==true){
			document.answerFrm.submit();
		}else{
			return false;
		}
	}
	$(function () {
	    $(".inquiryUI").click(function () {
	        $(this).next().slideToggle(700);
	    })
	});
</script>

<section id="inquiry-container">
        <div class="inquiry-right">
            <h1>Ensalade</h1>
            <h2>관리자용 1:1문의</h2>
            <hr>
            <div id="inquiryUI-wrap">
                <%for (Inquiry ii : list) {	%>
                <div class="inquiryUI content_top" style="cursor: pointer;">
                    <ul id="inquiryUl" class="form-control">
                        <li><%=ii.getInquiryType()%></li>
                        <li><%=ii.getInquiryTitle()%></li>
                       	<li><%=ii.getInquiryWriter()%></li>
                        <li><%=ii.getInquiryWriteDate()%></li>
                        <li class="answer-check"><p><%=ii.getCommentStatus()%></p></li>
                    </ul>
                </div>
                <div id="inquiry-contents"> 
                	<div class="inquiry-contents-wrap">
	                	<%if(ii.getFilePath().contains("null")){ %>
						<div class="inquiry-contents-p">
	                        <p><%=ii.getInquiryContent()%></p>
	                    </div> 
						<%}else{%>
						<div class="image-upload-wrap content_row" id="imgContainer">
							<img class="form_image"
								src="<%=request.getContextPath()%><%=ii.getFilePath()%>">
						</div>
						<div class="inquiry-answer-wrap content_row">
	                        <p><%=ii.getInquiryContent()%></p>
	                    </div> 
						<% }%>
					</div>
                    <%-- <div>
                        <p><%=ii.getInquiryContent()%></p>
                    </div> --%> 
                    <%if(ii.getInquiryComment()==null){ %>
                    <div class="inquiry_Manager_answer content_row content_top"	id="inquiry_Manager_answer">
                        <form action="<%=request.getContextPath()%>/admin/InquriryManagerTextServlet"  name="answerFrm">
                            <input type="hidden" name="no" value="<%=ii.getInquiryNo()%>">
                            <textarea class="form-control content_row" name="ManagerText" rows="5" cols="33"></textarea>
                            <input type="submit" class="answer-btn" onclick="ckAlert();" value="답변하기">
                        </form>
                    </div>
					<%}else{ %>
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
					<%} %>
                </div>
                <%}%>
            </div>
        </div>
    </section>
<%@include file="/view/common/footer.jsp"%>

<script type="text/javascript">
	<%for(Inquiry i : list){
		if(i.getCommentStatus().contains("완료")){ %>
			$(".answer-check>p:contains('답변완료')").css("color","blue");
	<%}}%>
</script>
<%-- <%@ include file="/view/MyPage/inquiry/inquiryManger.jsp"%> --%>
