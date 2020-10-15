<!-- 커스텀 게시판 상세 페이지 -->
<%@page import="com.en.custom.model.vo.CustomComment"%>
<%@page import="java.util.List"%>
<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>
<%
   CustomPost cp = (CustomPost)request.getAttribute("post");
   
%>


<section class="contents-wrap">
	<div class="vbox">
		<!-- 사진 및 글 내용 -->
		<div class="left">
		<div class="vbox-imgbox">
			<img src="<%=request.getContextPath()%>/upload/custom/<%=cp.getcImage()%>" id="img1">
			<%if(cp.getMemberId().equals(loginMember.getMemberId())) {%>
			<button style="border:none;outline:none;background-color:rgb(255,255,255,0);font-weight:600;" id="modi" value="<%=cp.getcIdx()%>">수정</button>
			<button style="border:none;outline:none;background-color:rgb(255,255,255,0);font-weight:600;" id="del" value="<%=cp.getcIdx()%>">삭제</button>
			<%} %>
		</div>
		<div class="comment-box">
		<!-- <h2 class="comment-box_header">
			댓글 <span class="comment-box_header_count">16</span>
		</h2>
		<div id="comment-box_form">
			<div class="comment-box_form_input">
				<input class="comment-box_form_input_text" type="text"
					placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" id="text_">
				<div class="comment-box_form_input_action">
					<input class="comment-box_form_submit btn_" type="button" value="등록"
						class="btn_">
						<input type="hidden" name="commentLevel" id="level" value="1">
				<input type="hidden" name="commentRef" id="cRef" value="0">
				</div>
			</div>
		</div>
	<div class="comment-box_recomm">
		<div class="form-control_comment">
		<ul class="comment_1"> -->
			<!-- <li>
			<article>
			<span>아이디</span>
			<p>내용입니다 무슨댓글을쓰셨나여</p>
			<button>답글달기</button>
			</article>
			</li> -->
	<!-- 	</ul>
		</div>
		<div>
		</div>
	</div> -->
	</div>
		</div>

		<!-- 커스텀이름 및 날짜 -->
		<div class="vbox-textbox">
			<div class="vbox-textbox_form_title">
				<div class="form-control"><%=cp.getTitle()%></div>
				<div class="form-control" id="time1"><%=cp.getWriteDate()%></div>
			</div>

			<div class="vbox-textbox_form_like">
				<button id="like_push" class="likeView" style="display:flex; margin-right:13px;">
					<svg class="a3" aria-hidden="true" focusable="false" data-prefix="far" data-icon="heart" class="svg-inline--fa fa-heart fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"></path></svg>
					<p id="like_"><%=cp.getLikeCount()%></p>
				</button>
				<button class="likeView">
					조회수 <%=cp.getViewCount()%>
				</button>
			</div>

			<div class="form-control" style="height: 470px;">
				<p class="content"><%=cp.getContent()%></p>
			</div>
		</div>
	</div>
<!-- 	<div class="comment-box">
<h2 class="comment-box_header">
			댓글 <span class="comment-box_header_count">16</span>
		</h2>
		<div id="comment-box_form">
			<div class="comment-box_form_input">
				<input class="comment-box_form_input_text" type="text"
					placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" id="text_">
				<div class="comment-box_form_input_action">
					<input class="comment-box_form_submit btn_" type="button" value="등록"
						class="btn_">
						<input type="hidden" name="commentLevel" id="level" value="1">
				<input type="hidden" name="commentRef" id="cRef" value="0">
				</div>
			</div>
		</div>
	<div class="comment-box_recomm">
		<div class="form-control_comment">
		<ul class="comment_1"> 
			 <li>
			<article>
			<span>아이디</span>
			<p>내용입니다 무슨댓글을쓰셨나여</p>
			<button>답글달기</button>
			</article>
			</li> 
	 	</ul>
		</div>
		<div>
		</div>
	</div>
	</div> -->
</section>
<script>


  $(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/custom/commentView",
		data:{"no":"<%=cp.getcIdx()%>"},
		dataType:"html",
		success:data=>{
			$(".comment-box").html(data);
		}
	})
})

	$("#like_push").click(e=>{
		function likeCount(){
		$.ajax({
			url:"<%=request.getContextPath()%>/custom/likeCount",
			data:{"like_count":'<%=cp.getcIdx()%>',"userId":"<%=loginMember!=null?loginMember.getMemberId():""%>"},
				success:data=>{
					$("#like_").html(data);
				}
		})
		}
		likeCount();
	})
	
	$(window).scroll(function(){
	var scrollTop = $(document).scrollTop();
	if (scrollTop < 201 ) {
	 scrollTop = 100;
	}else{
		scrollTop=scrollY-70;
	}
	if(scrollTop>330){
		scrollTop=330;
	}
	$(".vbox-textbox").stop();
	$(".vbox-textbox").animate( { "top" : scrollTop });
});
	
	
	

</script>

<style>
.form-control_comment {
	margin-bottom: 10px;
	padding: 15px 15px;
	border-radius: 4px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 12px;
}
.vbox-textbox{
	position:absolute;
	max-height:700px;
}

.form-control {
	margin-bottom: 10px;
	line-height: 40px;
	padding: 15px 15px;
	border-radius: 4px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 12px;
	width: 100%;
	
}

.contents-wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 100px;
	margin-bottom: 33px;
	/* footer height */
}

section.contents-wrap {
	position: relative;
	top: 120px;
	margin-left: auto;
	margin-right: auto;
	max-width: 100%;
	box-sizing: border-box;
	min-height: 1px;
	padding-left: 15px;
	padding-right: 15px;
}

.vbox {
	display: flex;
	height: auto;
	min-width: 850px;
}

.vbox-imgbox {
	/* width: 400px;
	height: 400px; */
	border-radius: 5px;
	margin-left: 50px;
	padding: 0px 0px 30px;
}

.vbox-imgbox>img {
	width: 670px;
    height: 630px;
	border-radius: 5px;
}

.vbox-textbox {
	display: inline-block;
	margin-right: 50px;
	margin-left: 20px;
    padding: 0px 15px 0px;
    height:90%;
}

.vbox-imgbox, .vbox-textbox {
	width: 50%;
	max-width:500px;
	left: 780px;
}

.vbox-textbox_form_title, .vbox-textbox_form_like {
	display: flex;
}

.form-control .content {
	height: 200px;
	font-size: 18px;
}

.comment-box {
	margin-left: 50px;
	margin-top: 40px;
	border-top: solid 1px #ededed;
	min-height: 150px;
	width:670px;
}

.comment-box_header {
	font-weight: 700;
	color: #000000;
	margin: 10px 0 20px;
	font-size: 16px;
}

.comment-box_header_count {
	color: #0bac6e;
}

.comment-box_form {
	margin-bottom: 30px;
}

.comment-box_form_input {
	position: relative;
	border: solld 1px #a39e9e;
	border-radius: 4px;
	display:flex;
}

.comment-box_form_input_text {
	display: block;
	width: 100%;
	margin-top:10px;
	min-height: 38px;
	border: none;
	color: #424242;
	margin: 0;
	padding: 8px 15px 9px;
	font-family: inherit;
	font-size: 15px;
	line-height: 1.4px;
	resize: none;
	overflow: hidden;
	box-sizing: border-box;
	border:1px solid #dbdbdb;
	border-radius:4px;
}

.comment-box_form_input_action {
	flex: 0 0 auto;
	padding: 7px 15px 7px 0;
	margin: 0 -7.5px;
	font-size: 0;
}
.left{
	margin-left: 50px;
	border-right: 1px solid #dbdbdb;
    padding-right: 13px;
}
.likeView{
	width: 225px;
    height: 50px;
    margin-bottom: 20px;
    margin-top: 10px;
    border-radius: 4px;
    border: none;
    justify-content: center;
    display: flex;
    padding: 12px 0px 0px;
    color: white;
    background-color: #27b06e;
    font-weight:600;
}
.a3{
	width:24px;
	height:24px;
}

.likeView:hover{
       			background-color:#3B966E;
       			cursor:pointer;
       		}
.btn_:hover{
	color:forestgreen;
}

#img1{
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
</style>
<script>
	$("#modi").click(e=>{
		location.assign("<%=request.getContextPath()%>/view/custom/modifyCustom.jsp?no="+<%=cp.getcIdx()%>);
	})
	$("#del").click(e=>{
		if(confirm("삭제하시겠습니까?")){
		location.replace("<%=request.getContextPath()%>/view/custom/deletePost.jsp?no="+<%=cp.getcIdx()%>);
		}
	})
</script>

<%@ include file="/view/common/footer2.jsp"%>