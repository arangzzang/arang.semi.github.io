<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	List<CustomPost> list=(List)request.getAttribute("list");
	
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");
%>

<section>

<!--검색박스  -->
<div id="search-container">
         검색타입 :
         <select id="searchType">
            <option id="123" value="member_id" <%=type!=null&&type.equals("member_id")?"selected":""%>>글쓴이</option>
            <option value="title" <%=type!=null&&type.equals("title")?"selected":""%>>글제목</option>
            <option value="content" <%=type!=null&&type.equals("content")?"selected":""%>>글내용</option>
         </select>
         <script>
         	$("#searchType").change(e=>{
         		$("#searchType2").attr("value",$(e.target).val());
         		console.log($(e.target).val());
         		if($(e.target).val()=="member_id"){
         			$("#search3").attr("placeholder","아이디 검색");
         		}else if($(e.target).val()=="title"){
         			$("#search3").attr("placeholder","제목 검색");
         		}else{
         			$("#search3").attr("placeholder","내용 검색");
         		}
         		
         		
         	})
         
         	console.log($("#searchType").val());
         	
         	<%-- $(function(){
         		<%if(type!=null&&type.equals("member_id")){%>
         		$("#search3").attr("placeholder","아이디 검색");
         		<%}else if(type!=null&&type.equals("title")){%>
         		$("#search3").attr("placeholder","제목 검색");
         		<%}else if(type!=null&&type.equals("content")){%>
         		$("#search3").attr("placeholder","내용 검색");
         		<%}%>
         	}) --%>
         </script>
         
         <div id="search-type">
            
               <input type="hidden" name="searchType" id="searchType2" value="member_id">
               <input type="text" name="searchKeyword" id="search3" placeholder="아이디 검색" size="25">
               <input type="button" value="검색" id="btn">
               
         </div>
        
        </div>
        
        <!-- 글작성 버튼 -->
        <div id="write-container">
        <button onclick=location.replace("<%=request.getContextPath()%>/custom/customWrite<%=loginMember!=null?"?userId="+loginMember.getMemberId():""%>")>글작성</button>
        </div>
        
        <!-- 게시물 정렬 셀렉박스 -->
        <div id="sort-container">
        <select id="post-sort">
        <option value="like_count">인기순</option>
        <option value="write_date">최신순</option>
        </select>
        </div>
        <br>
        <!-- 게시물 -->
        <div id="custom_post">
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
        </div>
        <style>
        .a1{
        	width:20px;
        	height:20px;
        }
        	.img1{
        		background-image:url("<%=request.getContextPath()%>/image/img1.jpg");
        		border-radius:5px;
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
        	}
        	</style>
        
</section>

<script>
	 $("#btn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/custom/customList3",
			data:{"searchType":$("#searchType2").val(),"searchKeyword":$("#search3").val()},
			dataType:"html",
			type:"post",
			success:data => {
				$("#custom_post").html(data);
				console.log(data);
				
			}
			})
	})
	
	 $("#post-sort").change(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/custom/customList2",
			data:{"sort":$(e.target).val()},
			dataType:"html",
			type:"post",
			success:data =>{
				$("#custom_post").html(data);
			}
			
		})
	})
	
	$(".like").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/custom/likeCount",
			data:{"like_count":$(e.target).parent().parent().children("input[type=hidden]").val(),"userId":"<%=loginMember!=null?
					loginMember.getMemberId():""%>"},
			dataType:"html",
			type:"post",
			success:data=>{
				/* $(e.target).filter(".like").children().html(data); */
				console.log($(e.target).after());
				
				let a=parseInt($(e.target).next().html());
				let b=parseInt(data);
				
				if(a<b){
				$(e.target).attr("src","<%=request.getContextPath()%>/image/heart3.png");
				}else{
				$(e.target).attr("src","<%=request.getContextPath()%>/image/heart.png");
				}
				$(e.target).next().html(data);
			}
			
		})
	})
	
	$(".img1").click(e=>{
		let no=$(e.target).parent().children("input[type=hidden]").val();
		location.replace("<%=request.getContextPath()%>/custom/customView?no="+no);
	})



</script>


<%@ include file="/view/common/footer2.jsp"%>