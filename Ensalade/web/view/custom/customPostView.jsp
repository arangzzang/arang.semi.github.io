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

<style>
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
	width: 400px;
	height: 400px;
	border-radius: 5px;
	margin-left: 50px;
}

.vbox-imgbox>img {
	width: 400px;
	height: 400px;
	border-radius: 5px;
}

.vbox-textbox {
	display: inline-block;
	margin-right: 50px;
}

.vbox-imgbox, .vbox-textbox {
	width: 50%;
}

.vbox-textbox_form_title, .vbox-textbox_form_like {
	display: flex;
}

.form-control .content {
	height: 200px;
	font-size: 18px;
}

.comment-box {
	margin-top: 50px;
	border-top: solid 1px #ededed;
	min-height: 150px;
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
}

.comment-box_form_input_text {
	display: block;
	width: 100%;
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
}

.comment-box_form_input_action {
	flex: 0 0 auto;
	padding: 7px 15px 7px 0;
	margin: 0 -7.5px;
	font-size: 0;
}
</style>
<section class="contents-wrap">
	<div class="vbox">
		<!-- 사진 및 글 내용 -->
		<div class="vbox-imgbox">
			<img src="<%=request.getContextPath()%>/image/img1.jpg" width="200" height="200" id="img1">
		</div>

		<!-- 커스텀이름 및 날짜 -->
		<div class="vbox-textbox">
			<div class="vbox-textbox_form_title">
				<div class="form-control"><%=cp.getTitle()%></div>
				<div class="form-control"><%=cp.getWriteDate()%></div>
			</div>

			<div class="vbox-textbox_form_like">
				<button id="like_push">
					<svg width="24" height="24">
                            <path
							d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
                            </path>
                        </svg>
					<span id="like_"><%=cp.getLikeCount()%></span>
				</button>
				<div class="form-control">
					조회수 <%=cp.getViewCount()%>
				</div>
			</div>

			<div class="form-control">
				<p class="content"><%=cp.getContent()%></p>
			</div>
		</div>
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
</style>

<%@ include file="/view/common/footer2.jsp"%>