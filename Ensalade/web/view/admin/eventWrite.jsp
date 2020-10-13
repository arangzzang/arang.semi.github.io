<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<section class="contents-wrap">
	<h2>Event글쓰기</h2>
	<form action="<%=request.getContextPath()%>/admin/insertEvent" method="post" enctype="multipart/form-data">
		<div class="ebox">
			<!-- 파일첨부div -->
			<div class="ebox_imgbox">
				<div class="image-upload-wrap eimg" id="imgContainer">
					<input type="file" name="upload">
				</div>
			</div>
			<!-- 글쓰기 div -->
			<div class="ebox_textbox">
			
				<!-- 제목작성 div -->
				<div class="e_titlebox content_row">
					<input type="text" name="etitle" class="form-control" placeholder="제목 입력">
				</div>
				<!-- 본문작성 div -->
				<div class="e_textbox content_row">
					<textarea name="etext" class="form-control text-area_input" placeholder="내용을 입력하세요."></textarea>
				</div>
			</div>
		</div>
		<!-- 글올리기 버튼 -->
		<div>
			<input type="submit" id="writeup" class="form-control form-control_input_btn" value="글 등록" >
		</div>
		<input type="hidden" value="<%=loginMember.getMemberId()%>" name="userId">
	</form>
</section>

<style>
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
	.eimg {
        width: 500px;
        height: 500px;
        padding: 30px;
        margin: 0 auto;
    }
    .ebox {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 100px;
        min-width: 1000px;
    }

    .ebox_imgbox, .ebox_textbox {
        width: 50%;
    }

    .ebox_textbox {
        display: block;
        padding: 40px 25px;
        width: 37%;
        min-width: 350px;
    }

    section.contents-wrap {
        position: relative;
        top: 100px;
        min-height: 100%;
        padding-bottom: 100px;
        text-align: center;
    }

    .image-upload {
        display: block;
        position: relative;
        width: 100%;
        margin: 0;
        border: none;
        background: #f5f5f5;
        border-radius: 8px;
        font-family: inherit;
        transition: opacity .1s;
        padding: 200px 0;
    }

    .image-upload>.content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 0;
    }

    .image-upload>.content {
        display: block;
        font-size: 15px;
        font-weight: 700;
        line-height: 20px;
        color: #757575;
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

    .form_image {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 100%;
        transform: translate(-50%, -50%);
    }

    .displayN {
        display: none;
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
</style>

<%@ include file="/view/common/footer2.jsp"%>