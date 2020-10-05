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
        	<div style="display:inline-block">
        <div><%=p.getMemberId()%></div>
        		<div class="img1"><span>조회수:<%=p.getViewCount()%></span></div>
        		<span class="like"><img src="<%=request.getContextPath()%>/image/heart.png" class="a1"><span class="a2"><%=p.getLikeCount()%></span></span>
        		<span>댓글</span>
        		<input type="hidden" value="<%=p.getcIdx()%>" class="">
        		<div><%=p.getContent() %></div>
        	</div>
        	<%} %>
        	<style>
        	<%-- .img1{
        		background-image:url("<%=request.getContextPath()%>/image/img1.jpg");
        		width:100px;
        		height:100px;
        		background-repeat: no-repeat;
   				background-position: center;
    			background-size: cover;
    			display:flex;
    			align-items:flex-end;
    			justify-content:flex-end;
        	}
        	#custom_post{
        	display:inline-block;
        	} --%>
        	</style>
        	
        	<script>
        	$(".like").click(e=>{
        		$.ajax({
        			url:"<%=request.getContextPath()%>/custom/likeCount",
        			data:{"like_count":$(e.target).parent().parent().children("input[type=hidden]").val(),"userId":"<%=loginMember!=null?
        					loginMember.getMemberId():""%>"},
        			dataType:"html",
        			type:"post",
        			success:data=>{
        				/* $(e.target).filter(".like").children().html(data); */
        				$(e.target).next().html(data);
        				console.log($(e.target).after());
        				console.log("dddd");
        			}
        			
        		})
        	})
        	
        	$(".img1").click(e=>{
		let no=$(e.target).parent().children("input[type=hidden]").val();
		location.replace("<%=request.getContextPath()%>/custom/customView?no="+no);
	})
        	</script>