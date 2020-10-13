<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<section class="contents-wrap">
	<h2>Event글쓰기</h2>
	<form action="<%=request.getContextPath()%>/admin/insertEvent" method="post" enctype="multipart/form-data">
		<div class="e_container">
			<div class="ebox">
				<!-- 썸네일이미지첨부div -->
				<div class="ebox_imgbox">
					<div class="image-upload-wrap eimg" id="imgContainer">
						썸네일 이미지 추가<input type="file" name="thumb">
					</div>
				</div>
				<!-- 글쓰기 div -->
				<div class="ebox_textbox">
					<!-- 상품번호 선택 셀렉박스 div -->
					<div class="select-input content_row">
						<select id="" name="categoty" class="form-control" required>
							<option selected disabled>카테고리를 골라주세요.</option>
							<option>시즌</option>
							<option>카테고리[비건]</option>
							<option>카테고리[육류]</option>
							<option>카테고리[해산물]</option>
							<option>카테고리[유제품]</option>
							<option>메뉴</option>
							<option>기타</option>
						</select>
					</div>
					<!-- 이벤트 이름 작성 div -->
					<div class="e_titlebox content_row">
						<input type="text" name="eName" class="form-control content-left content-right" placeholder="제목 입력" required>
						<span>종료날짜</span><input type="date" name="endDate " class="form-control content-left content-right" required>
						<input type="number" name="sale" class="form-control content-left content-right" placeholder="할인율을 입력하세요. 기본값 0" required>
					</div>
					<!-- 작성 div -->
					<div class="e_imgbox content_row">
						내용이미지추가<input type="file" name="content_file" required>
					</div>
				</div>
			</div>
			<!-- 글올리기 버튼 -->
			<div class="btn-wrap">
				<input type="submit" id="writeup" class="form-control form-control_input_btn" value="글 등록" >
			</div>
			<input type="hidden" value="<%=loginMember.getMemberId()%>" name="userId">
		</div>		
	</form>
</section>

<style>
.content-left{margin: 5px;}
.content-right{margin: 5px;}
.e_titlebox>span{width: 25%;
    padding: 10px 0 0 10px;}
.e_titlebox{
display: flex;}
.e_container {
	position: relative;
}

.eimg {
	padding: 30px;
	margin: 0 auto;
}

.ebox {
	position: relative;
	justify-content: center;
	align-items: center;
	padding: 0 200px;
	min-width: 800px;
}

.btn-wrap {
	position: relative;
	justify-content: center;
	align-items: center;
	padding: 0 200px;
	min-width: 800px;
}

section.contents-wrap {
	position: relative;
	top: 100px;
	min-height: 100%;
	padding-bottom: 100px;
	text-align: center;
}

.form {
	position: relative;
	border-radius: 8px;
	overflow: hidden;
	min-height: 80px;
	box-sizing: border-box;
	background-color: #ededed;
	height: 240px;
	min-height: 300px;
	height: 400px;
}

.displayN {
	display: none;
}

.content_row {
	margin-bottom: 10px;
}

.select-input {
	position: relative;
}

.select-input_icon {
	position: relative;
	top: 10px;
	right: 10px;
	padding: 5px;
	font-size: 0;
	cursor: default;
	color: rgb(0, 0, 0, 0.3);
	pointer-events: none;
}

textarea.form-control {
	resize: none;
	line-height: 20px;
	padding-top: 9px;
	padding-bottom: 9px;
	min-height: 200px;
}

.form-control {
	display: block;
	box-sizing: border-box;
	height: 40px;
	width: 100%;
	padding: 0 15px;
	line-height: 40px;
	border-radius: 4px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 12px;
}

.form-control_input_btn {
	height: 25px;
	width: 100px;
	height: 25px;
	box-sizing: border-box;
	border-radius: 4px;
	font-size: 14px;
	font-weight: 400;
	cursor: pointer;
	border-style: none;
	font-weight: inherit;
}
</style>

<%@ include file="/view/common/footer2.jsp"%>