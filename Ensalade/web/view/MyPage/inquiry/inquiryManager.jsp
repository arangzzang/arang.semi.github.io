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
	String pageBar = (String)request.getAttribute("pageBar");
	String type = request.getParameter("searchType");
	String key = request.getParameter("searchKeyword");
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
							<img class="form_image"	src="<%=request.getContextPath()%><%=ii.getFilePath()%>">
						</div>
						<div class="inquiry-answer-wrap content_row">
	                        <textarea class="form-control" readonly><%=ii.getInquiryContent()%></textarea>
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
								<div class="manager-answer_label"><label>A</label></div>
								<div class="manager-answer_content"><p><%=ii.getInquiryComment()%></p></div>
							</div>
						</div>
					<%} %>
             	</div>
            <%}%>
            </div>
            <div class="search-form content_top" >
				<div class="search-form_wrap">
				<span>검색타입 : </span> <select id="searchType" class="form-control">
					<option value="inquiry_type"
						<%=type != null && type.equals("inquiry_type") ? "selected" : ""%>>문의타입</option>
					<option value="inquiry_writer"
						<%=type != null && type.equals("inquiry_writer") ? "selected" : ""%>>아이디</option>
					<option value="inquiry_write_date"
						<%=type != null && type.equals("inquiry_write_date") ? "selected" : ""%>>문의날짜</option>
				</select></div>
				
				<div id="search_inquiry_type">
					<form id="formCss"
						action="<%=request.getContextPath()%>/admin/inquiry">
						<input type="hidden" name="searchType" value="inquiry_type">
						<div class="formCss-submit-wrap">
							<select id="searchType" class="form-control" name="searchKeyword">
								<option selected disabled>문의타입을 선택해주세요</option>
								<option value="상품문의">상품문의</option>
								<option value="배송문의">배송문의</option>
								<option value="교환/환불">교환/환불</option>
							</select>
							<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
						</div>
					</form>
				</div>
				<div id="search_inquiry_writer">
					<form id="formCss"
						action="<%=request.getContextPath()%>/admin/inquiry">
						<input type="hidden" name="searchType" value="inquiry_writer">
						<div class="formCss-submit-wrap">
							<input class="form-control" type="text"name="searchKeyword" size="25" placeholder="아이디검색"
							 value="<%=key != null && type != null && type.equals("inquiry_writer") ? key : ""%>">
							<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
						</div>
					</form>
				</div>
				<div id="search_inquiry_write_date">
					<form id="formCss"
						action="<%=request.getContextPath()%>/admin/inquiry">
						<input type="hidden" name="searchType" value="inquiry_write_date">
						<div class="formCss-submit-wrap">
							<input class="form-control" type="text" name="searchKeyword" maxlength="8" placeholder="YY/MM/DD" 
							value="<%=key != null && type != null && type.equals("inquiry_write_date") ? key : "YY/MM/DD"%>">
							<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
						</div>
					</form>
				</div>
			</div>
        
		<div id="pageBar"><%=pageBar %></div>
    </div>
</section>
<script type="text/javascript">
	$(function(){
		let type = $("#search_inquiry_type");
		let writer = $("#search_inquiry_writer");
		let write_date = $("#search_inquiry_write_date");
		$("#searchType").change(e=>{
			type.css("display","none");
			writer.css("display","none");
			write_date.css("display","none");
			let s = $(e.target).val();
			$("#search_"+s).css("display","inline-block");
		});
	});
	$(function(){$("#searchType").change()});

	<%for(Inquiry i : list){
		if(i.getCommentStatus().contains("완료")){ %>
			$(".answer-check>p:contains('답변완료')").css("color","blue");
	<%}}%>
</script>
<%@include file="/view/common/footer2.jsp"%>
<%-- <%@ include file="/view/MyPage/inquiry/inquiryManger.jsp"%> --%>
