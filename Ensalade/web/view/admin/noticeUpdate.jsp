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
            <td><input type="text" value="<%=nb.getNotice_title()%>"></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" value="<%=nb.getNotice_writer() %>"></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           	<%if(nb.getFilepath()!=null){ %>
           		<img src="<%=nb.getFilepath()%>" width="20" height="20">
           	<%}else{ %>
           		
           	<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><textarea rows="" cols=""><%=nb.getNotice_contents() %></textarea></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="button" value="수정하기" id="updateBtn">
            </th>
        </tr>
    </table>
    </div>
</section>

<%@ include file="/view/common/footer.jsp"%>