<%@page import="java.util.ArrayList"%>
<%@page import="com.en.custom.model.vo.CustomComment"%>
<%@page import="com.en.admin.model.service.AdminService"%>
<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/view/common/header.jsp"%>
    
    <section class="sort" style="margin-top:100px">
    
    	<%-- 		<div class="center"><h2>커스텀 게시물</h2></div>
    	<table  class="center">
    	<thead>
    		<tr>
    		<th>게시물 번호</th>
    		<th>제목</th>
    		<th>내용</th>
    		<th>날짜</th>
    		<th>좋아요</th>
    		<th>조회수</th>
    		<th>참조 상품</th>
    		<th>ID</th>
    		<th colspan="2">image</th>
    		</tr>
    	</thead>
    	<tbody>
    	
    	<%if(!post.isEmpty()){%>
    	<%for(CustomPost cp:post){ %>
    		<tr>   		
    			<td><%=cp.getcIdx() %></td>
    			<td><%=cp.getTitle() %></td>
    			<td><%=cp.getContent() %></td>
    			<td><%=cp.getWriteDate()%></td>
    			<td><%=cp.getLikeCount()%></td>
    			<td><%=cp.getViewCount() %></td>
    			<td><%=cp.getCustomNo()%></td>
    			<td><%=cp.getMemberId() %></td>
    			<td><%=cp.getcImage() %></td>
    			<td class="center"><button value="<%=cp.getcIdx()%>" class="dBtn">삭제</button></td>
    		</tr>   
    		<%} %>
    		<%}else{%>
    		<tr>
    			<td colspan="10">내용이 없습니다.</td>
    		</tr>
    		
    		<%}%>
    	</tbody> 	
    	</table>
    	
    		<div class="center"><h2>댓글 목록</h2></div>
    	
    	<table  class="center">
    	<thead>
    		<tr>
    			<th>댓글 번호</th>
    			<th>레벨</th>
    			<th>작성자</th>
    			<th>내용</th>
    			<th>참조 게시물</th>
    			<th>참조 댓글</th>
    			<th colspan="2">날짜</th>
    		</tr>
    	</thead>
    	<tbody>
    	<%if(!comment.isEmpty()){%>
    		<%for(CustomComment c:comment){%>
    		<tr>
    			<td><%=c.getCustomCommentNo()%></td>
    			<td><%=c.getCustomCommentLevel()%></td>
    			<td><%=c.getCustomCommentWriter()%></td>
    			<td><%=c.getCustomCommentContent()%></td>
    			<td><%=c.getCustomRef()%></td>
    			<td><%=c.getCustomCommentRef()%></td>
    			<td><%=c.getCustomCommentDate()%></td>
    			<td class="center"><button value="<%=c.getCustomCommentNo()%>" class="dBtn2">삭제</button></td>
    		</tr>
    		<%} %>
    		<%}else{%>
    		<tr>
    			<td colspan="8">내용이 없습니다.</td>
    		</tr>
    		<%} %>
    	</tbody>
    	</table> --%>
    
    
    </section>
    
    <style>
    	tr>td,th{
    		border:1px solid black;
    		width:200px;
    		height:70px;
    	}
    	.center{
    		text-align: center;
    	}
    	.sort{
    		text-align: -webkit-center;
    	}
    </style>
    
    <script>
    	$(function(){
    		$.ajax({
    			url:"<%=request.getContextPath()%>/view/admin/customManagerList.jsp",
    			success:data=>{
    				$("section").html(data);
    			}
    		})
    	})
    </script>
    
    <%@include file="/view/common/footer2.jsp"%>