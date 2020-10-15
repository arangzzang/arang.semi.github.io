<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp" %>

<%
	List<NoticeBoard> list = (List) request.getAttribute("list");
	String pageBar2 = (String) request.getAttribute("pageBar2");
	String type = request.getParameter("searchType");
	String key = request.getParameter("searchKeyword");
%>

<section class="contents-wrap">
	<div class="content-title">
    	<p>공지사항</p>
    </div>
    <div class="notice-wrap">
		<table class="notice-table" id="tbl-notice">
			<caption>게시판 상세</caption>
            <colgroup>
                <col style="width: 50px;">
                <col style="width: auto;">
                <col style="width: auto;">
                <col style="width: auto;">
            </colgroup>	
			<thead class="notice-table_thead">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<!-- <th>첨부파일</th> -->
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<%if (list.isEmpty()) {	%>
				<tr>
					<td colspan="5">검색한 공지사항이 없습니다</td>
				</tr>
			<%} else {
				for (NoticeBoard nb : list) {%>
				<tr>
					<td><%=nb.getNotice_no()%></td>
					<td><a href="<%=request.getContextPath()%>/notice/noticeView?no=<%=nb.getNotice_no()%>"><%=nb.getNotice_title()%></a></td>
					<td><%=nb.getNotice_writer()%></td>
					<%-- <td>
				<%if (nb.getFilepath() != null) {%> 
						<img src="<%=request.getContextPath()%>/image/file.png"	width="20" height="20"> 
				<%} %>
					</td> --%>
					<td><%=nb.getNotice_write_date()%></td>
				</tr>
			<%	}
			}	%>
			</tbody>
		</table>
	</div>
	<div class="search-form">
		<div class="search-form_wrap">
		<span>검색타입 : </span> <select id="searchType" class="form-control">
			<option value="notice_title"
				<%=type != null && type.equals("notice_title") ? "selected" : ""%>>제목</option>
			<option value="notice_write_date"
				<%=type != null && type.equals("notice_write_date") ? "selected" : ""%>>작성일</option>
		</select></div>
		<div id="search_notice_title">
			<form id="formCss"
				action="<%=request.getContextPath()%>/searchNotice">
				<input type="hidden" name="searchType" value="notice_title">
				<div class="formCss-submit-wrap">
					<input class="form-control" id="inputNotice" type="text" name="searchKeyword"
						placeholder="제목검색" size="25"
						value="<%=key != null && type != null && type.equals("notice_title") ? key : ""%>">
					<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
				</div>
			</form>
		</div>
		<div id="search_notice_write_date">
			<form id="formCss"
				action="<%=request.getContextPath()%>/searchNotice">
				<input type="hidden" name="searchType" value="notice_write_date">
				<div class="formCss-submit-wrap">
					<input class="form-control" id="inputNotice" type="text"
						name="searchKeyword" maxlength="8" placeholder="YY/MM/DD"
						value="<%=key != null && type != null && type.equals("notice_write_date") ? key : "YY/MM/DD"%>">
					<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
				</div>
			</form>
		</div>
	</div>
	<div id="pagebar2"><%=pageBar2%></div>
	<div class="noticeV-button">
         <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
         <span class="gRight">
             <div style="display: flex;margin-right: 20px;">
                 <input class="form-control_input_btn padd" type="button" value="글쓰기" id="writeBtn">
             </div>
         </span>
         <%} %>
     </div>
     
     
	<script type="text/javascript">
		$(function(){
			let title=$("#search_notice_title");
			let write_date=$("#search_notice_write_date");
			let pagebar=$("#pageBar")
			
			$("#searchType").change(e=>{
				title.css("display","none");
				write_date.css("display","none");
				let s=$(e.target).val();
				$("#search_"+s).css("display","inline-block");
			});
		});
		$(function(){$("#searchType").change()});
		
		$("#writeBtn").click(e =>{
			location.assign('<%=request.getContextPath()%>/admin/noticeWrite');
		});
	</script>
</section>

<style type="text/css">

#tbl-notice th:nth-child(1) {
	width: 50px;
}

#tbl-notice th:nth-child(2) {
	width: 857px;
}

#tbl-notice td:nth-child(2) {
	text-align: left;
	padding-left: 24px;
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

.search-form_wrap>span {
	font-size: 17px;
	padding: 2px 10px;
}

.search-form_wrap, .formCss-submit-wrap {
	margin: 0 10px;
}

body {
	position: relative;
}

.formCss-submit-wrap {
	display: flex;
}

.form-control {
	display: block;
	box-sizing: border-box;
	padding: 0 15px;
	line-height: 6px;
	border-radius: 2px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 13px;
	height: 30px;
}

.formCss-submit-btn {
	border-radius: 2px;
	border: solid 1px #dbdbdb;
	background-color: #dbdbdbaf;
	color: #535353;
	font-size: 12px;
	height: 30px;
	width: 30px;
}

section.contents-wrap {
	padding-top: 100px;
	height: auto;
	margin: 0 auto;
	text-align: center;
}

table.table {
	position: absolute;
	top: 200px;
	left: 160px;
}

table#tbl-notice {
	width: 80%;
	margin: 0 auto;
	border: solid 1px #dbdbdb;
	border-right: 0;
    border-left: 0;
	border-collapse: collapse;
	line-height: 30px;
}
table#tbl-notice a {color:black;}
table#tbl-notice a:hover {color:green;}
table#tbl-notice th, table#tbl-notice td {
border-right: 0;
	border-left: 0;
	padding: 5px 0;
	text-align: center;
}

div#search_notice_title {
	display: inline-block;
}

div#search_notice_write_date {
	display: none;
}

.content-title {
	height: 60px;
}

.content-title>p {
	font-size: 30px;
	font-weight: 700;
}

.notice-table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	table-layout: fixed;
}

.notice-table_thead {
	background-color: #dbdbdbaf;
}

.notice-wrap {
	padding-bottom: 30px;
	margin: 0 50px;
}

.search-form {
	display: flex;
	justify-content: center;
	position: relative;
}

.search-form_wrap {
	display: flex;
}

caption {
	display: none;
}
</style>

<%@ include file="/view/common/footer.jsp" %>