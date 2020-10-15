<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	List<CustomPost> list = (List) request.getAttribute("list");

	String type = request.getParameter("searchType");
	String key = request.getParameter("searchKeyword");
%>

<section>



<!--검색박스  -->
<div>
<div id="search-container">
		<div  class="searchtype_ box_ type_">
         <select id="searchType">
            <option id="123" value="member_id" <%=type!=null&&type.equals("member_id")?"selected":""%>><label>글쓴이</label></option>
            <option value="title" <%=type!=null&&type.equals("title")?"selected":""%>><label>글제목</label></option>
            <option value="content" <%=type!=null&&type.equals("content")?"selected":""%>><label>글내용</label></option>
         </select>
         <div id="search-type">
               <input type="hidden" name="searchType" id="searchType2" value="member_id">
               <input type="text" name="searchKeyword" id="search3" placeholder="아이디 검색" size="25" class="pad">
               <input type="button" value="검색" id="btn" class="btn_1" style="width:77.68px, height:42.7px">             
         </div>
		 <!-- 글작성 버튼 -->
		 <div id="write-container">
		 <button class="btn_1" onclick=location.replace("<%=request.getContextPath()%>/custom/customWrite<%=loginMember!=null?"?userId="+loginMember.getMemberId():""%>")>글작성</button>
		 </div>
         </div>
        </div>
        
        
        <!-- 게시물 정렬 셀렉박스 -->
        <div id="sort-container" style="clear:both">
        <select id="post-sort" class="post-sort">
        <option value="write_date">최신순</option>
        <option value="like_count">인기순</option>
        </select>
        </div>
        </div>
        <!-- 게시물 -->
        <div id="custom_post" class="post">
        <%if(list!=null){ %>
        <%for(CustomPost p:list){ %>
        <%
        	int no=p.getcIdx();
        	int count=new CustomService().commentCount(no);
        	System.out.println(p.getcImage());
        %>
        	<div class="post_c">
        <div style="display:inline-flex">
        <span><svg class="a1 a2" aria-hidden="true" focusable="false" data-prefix="far" data-icon="user" class="svg-inline--fa fa-user fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M313.6 304c-28.7 0-42.5 16-89.6 16-47.1 0-60.8-16-89.6-16C60.2 304 0 364.2 0 438.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-25.6c0-74.2-60.2-134.4-134.4-134.4zM400 464H48v-25.6c0-47.6 38.8-86.4 86.4-86.4 14.6 0 38.3 16 89.6 16 51.7 0 74.9-16 89.6-16 47.6 0 86.4 38.8 86.4 86.4V464zM224 288c79.5 0 144-64.5 144-144S303.5 0 224 0 80 64.5 80 144s64.5 144 144 144zm0-240c52.9 0 96 43.1 96 96s-43.1 96-96 96-96-43.1-96-96 43.1-96 96-96z"></path></svg></span><p class="id_1"><%=p.getMemberId()%></p>
        </div>
        		<div class="img1" style="background-image:url('<%=request.getContextPath()%>/upload/custom/<%=p.getcImage()%>');"><span><label class='view'>조회수 <%=p.getViewCount()%></label></span></div>
        		<div class="aside">
        		<div style="display:inline-flex">
        		<span class="like"><svg class="a3" aria-hidden="true" focusable="false" data-prefix="far" data-icon="heart" class="svg-inline--fa fa-heart fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"></path></svg></span>
        		<p class="m1"><%=p.getLikeCount()%></p>
        		</div>
        		<div style="display:flex">
        		<span>
        		<svg class="a3" aria-hidden="true" focusable="false" data-prefix="far" data-icon="comment-alt" class="svg-inline--fa fa-comment-alt fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M448 0H64C28.7 0 0 28.7 0 64v288c0 35.3 28.7 64 64 64h96v84c0 7.1 5.8 12 12 12 2.4 0 4.9-.7 7.1-2.4L304 416h144c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64zm16 352c0 8.8-7.2 16-16 16H288l-12.8 9.6L208 428v-60H64c-8.8 0-16-7.2-16-16V64c0-8.8 7.2-16 16-16h384c8.8 0 16 7.2 16 16v288z"></path></svg>
        		</span>
        		<p style="margin-left:40px"><%=count%></p>
        		</div>
        		</div>
        		<input type="hidden" value="<%=p.getcIdx()%>" class="">
        		<div class="content_"><%=p.getContent() %></div>
        	</div>
        	<%} %>
        	<%} %>
        </div>


</section>

<style>
.id_1 {
	margin-left: 10px;
	font-weight: 600;
	color: mediumaquamarine;
}

.searchtype_ {
	display: flex;
}

.box_ {
	padding: 15px 0px 10px;
	font-size: 15px;
	font-family: auto;
}

.pad {
	padding: 10px 10px 10px;
}

.btn_1 {
	padding: 10px 20px;
	border: 1px solid #e7e7e7;
	background-color: #27b06e;
	border-radius: 5px;
	font-weight: 800;
	color: white;
	outline:none;
}

.btn_1:hover {
	background-color: white;
	color: #27b06e;
}

.post {
	padding: 100px 200px 10px;
}

.post_c {
	display: inline-block;
	width: 256.4px;
	height: 396.2px;
	padding-left: 70px;
}

.type_ {
	float: right;
	padding: 0px 250px 0px;
}

.post-sort {
	padding: 5px 5px 5px;
	border-radius: 5px;
	margin-left: 270px;
	margin-top: 60px;
}

.m1 {
	margin-left: 30px;
	margin-right: 30px;
}

.a3 {
	width: 30px;
	height: 25px;
}

.aside {
	text-align-last: justify;
	display: -webkit-box;
	justify-content: space-around;
	padding: 10px 15px 10px;
}

.view {
	font-weight: 500;
	color: white;
}

.a2 {
	border: 1px solid black;
	border-radius: 15px;
}

.a1 {
	width: 20px;
	height: 20px;
}

.img1 {
	<%-- background-image: url("<%=request.getContextPath()%>/image/img4.jpg"); --%>
	border-radius: 5px;
	width: 240px;
	height: 60%;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	display: flex;
	align-items: flex-end;
	justify-content: flex-end;
	cursor: pointer;
	overflow: hidden;
}

#custom_post {
	display: inline-block;
}

.img1:hover {
	transform: scale(1.03);
	-webkit-transform: scale(1.03);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1.03);
	transition: all 0.3s ease-in-out;
}

svg:hover {
	transform: scale(1.03);
	-webkit-transform: scale(1.03);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1.03);
	transition: all 0.3s ease-in-out;
}
.like{
	cursor:pointer;
}
</style>

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
	
	 $("#btn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/custom/customList3",
			data:{"searchType":$("#searchType2").val(),"searchKeyword":$("#search3").val()},
			dataType:"html",
			type:"post",
			success:data => {
				$("#custom_post").html(data);
				
			}
			})
	})
	
	 $("#post-sort").change(e=>{
		 console.log($(e.target).val());
		$.ajax({
			url:"<%=request.getContextPath()%>/custom/customList2",
			data:{"sort":$(e.target).val()},
			dataType:"html",
			type:"post",
			success:data =>{
				$("custom_post").html("");
				$("#custom_post").html(data);
			}
			
		})
	})
	
	$(".like").click(e=>{
		 $.ajax({
			url:"<%=request.getContextPath()%>/custom/likeCount",
			data:{"like_count":$(e.target).parent().parent().parent().next().val(),"userId":"<%=loginMember != null ? loginMember.getMemberId() : ""%>"},
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


<%@ include file="/view/common/footer2.jsp"%>