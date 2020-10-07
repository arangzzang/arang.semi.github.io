<%@page import="com.en.member.model.vo.Member"%>
<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CustomPost> list=(List)request.getAttribute("list");
	Member loginMember=(Member)session.getAttribute("loginMember");
%>
   <%for(CustomPost p:list){ %>
        	<div class="post_c">
        <div style="display:inline-flex">
        <span><svg class="a1 a2" aria-hidden="true" focusable="false" data-prefix="far" data-icon="user" class="svg-inline--fa fa-user fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M313.6 304c-28.7 0-42.5 16-89.6 16-47.1 0-60.8-16-89.6-16C60.2 304 0 364.2 0 438.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-25.6c0-74.2-60.2-134.4-134.4-134.4zM400 464H48v-25.6c0-47.6 38.8-86.4 86.4-86.4 14.6 0 38.3 16 89.6 16 51.7 0 74.9-16 89.6-16 47.6 0 86.4 38.8 86.4 86.4V464zM224 288c79.5 0 144-64.5 144-144S303.5 0 224 0 80 64.5 80 144s64.5 144 144 144zm0-240c52.9 0 96 43.1 96 96s-43.1 96-96 96-96-43.1-96-96 43.1-96 96-96z"></path></svg></span><p style="margin-left:10px"><%=p.getMemberId()%></p>
        </div>
        		<div class="img1"><span><label class='view'>조회수 <%=p.getViewCount()%></label></span></div>
        		<div class="aside">
        		<div style="display:inline-flex">
        		<span class="like"><svg class="a3" aria-hidden="true" focusable="false" data-prefix="far" data-icon="heart" class="svg-inline--fa fa-heart fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"></path></svg></span>
        		<p class="m1"><%=p.getLikeCount()%></p>
        		</div>
        		<div>
        		<span><svg class="a3" aria-hidden="true" focusable="false" data-prefix="far" data-icon="comment-alt" class="svg-inline--fa fa-comment-alt fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M448 0H64C28.7 0 0 28.7 0 64v288c0 35.3 28.7 64 64 64h96v84c0 7.1 5.8 12 12 12 2.4 0 4.9-.7 7.1-2.4L304 416h144c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64zm16 352c0 8.8-7.2 16-16 16H288l-12.8 9.6L208 428v-60H64c-8.8 0-16-7.2-16-16V64c0-8.8 7.2-16 16-16h384c8.8 0 16 7.2 16 16v288z"></path></svg></span>
        		</div>
        		</div>
        		<input type="hidden" value="<%=p.getcIdx()%>" class="">
        		<div><%=p.getContent() %></div>
        	</div>
        	<%} %>
        	
        	
        	<script>
        	$(".like").click(e=>{
       		 $.ajax({
       			url:"<%=request.getContextPath()%>/custom/likeCount",
       			data:{"like_count":$(e.target).parent().parent().parent().next().val(),"userId":"<%=loginMember!=null?
       					loginMember.getMemberId():""%>"},
       			dataType:"html",
       			type:"post",
       			success:data=>{
       				
       				$(e.target).parent().next().html(data);
       			}
       			
       		})
       	})
        	
        	$(".img1").click(e=>{
		let no=$(e.target).parent().children("input[type=hidden]").val();
		location.replace("<%=request.getContextPath()%>/custom/customView?no="+no);
	})
        	</script>