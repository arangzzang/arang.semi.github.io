<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp" %>


<style type="text/css">
	section {padding-top: 100px; height:auto;}	
	div#container{position:relative width:100%;height:500px;}
	table.table{position:absolute; top:200px; left:160px;}
	table#tbl-notice{width:80%; margin:0 auto;  border:1px solid black; border-collapse:collapse;}
	table#tbl-notice th, table#tbl-notice td {border:1px solid; padding: 5px 0; text-align:center;} 
	div#search_notice_title {display: inline-block;}
	div#search_notice_write_date {	display: none;}
</style>

<%
	List<NoticeBoard> list = (List) request.getAttribute("list");
	String pageBar2 = (String) request.getAttribute("pageBar2");
	String type = request.getParameter("searchType");
	String key = request.getParameter("searchKeyword");
%>

<section>
	<h2>공지사항</h2>
	<div>
		검색타입 : <select id="searchType">
			<option value="notice_title"
				<%=type != null && type.equals("notice_title") ? "selected" : ""%>>제목</option>
			<option value="notice_write_date"
				<%=type != null && type.equals("notice_write_date") ? "selected" : ""%>>작성일</option>
		</select>
		<div id="search_notice_title">
			<form id="formCss"
				action="<%=request.getContextPath()%>/searchNotice">
				<input type="hidden" name="searchType" value="notice_title">
				<input id="inputNotice" type="text" name="searchKeyword"
					placeholder="제목검색" size="25"
					value="<%=key != null && type != null && type.equals("notice_title") ? key : ""%>">
				<button id="submitCss" type="submit">검색</button>
			</form>
		</div>
		<div id="search_notice_write_date">

			<form id="formCss"
				action="<%=request.getContextPath()%>/searchNotice">
				<input type="hidden" name="searchType" value="notice_write_date">
				<input id="inputNotice" type="text" name="searchKeyword"
					maxlength="8" placeholder="YY/MM/DD"
					value="<%=key != null && type != null && type.equals("notice_write_date") ? key : "YY/MM/DD"%>">
				<button id="submitCss" type="submit">검색</button>
			</form>
		</div>
	</div>
	<table id="tbl-notice">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>첨부파일</th>
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
				<td>
			<%if (nb.getFilepath() != null) {%> 
					<img src="<%=request.getContextPath()%>/image/file.png"	width="20" height="20"> 
			<%} %>
				</td>
				<td><%=nb.getNotice_write_date()%></td>
			</tr>
		<%	}
		}	%>
		</tbody>
	</table>

	<div id="pagebar2"><%=pageBar2%></div>
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
	</script>
</section>

	
<%@ include file="/view/common/footer.jsp" %>