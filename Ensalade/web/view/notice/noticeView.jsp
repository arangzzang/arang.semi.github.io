<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	NoticeBoard nb = (NoticeBoard)request.getAttribute("nb");
%>

<section>
	<div id="notice-container">
<h2>공지사항 상세화면</h2>
        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><%=nb.getNotice_title() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=nb.getNotice_writer() %></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           	<%if(nb.getFilepath()!=null){ %>
           		<img alt="" src="<%=nb.getFilepath()%>" width="20" height="20">
           	<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=nb.getNotice_contents() %></td>
        </tr>
        <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
        <tr>
            <th colspan="2">
                <input type="button" value="수정하기" id="updateBtn">
                <input type="button" value="삭제하기" id="deleteBtn">
                <input type="hidden" id="noticeNo" value="<%=nb.getNotice_no()%>">
            </th>
        </tr>
        <%} %>
    </table>
    </div>
</section>
<script>
	let no = $("#noticeNo").val();
	$("#updateBtn").click(e => {
		location.assign('<%=request.getContextPath()%>/admin/updateNotice?no='+no);
	});
	
	$("#deleteBtn").click(e => {
		location.assign('<%=request.getContextPath()%>/admin/deleteNotice?no='+no);
	});
</script>

<%@ include file="/view/common/footer2.jsp"%>