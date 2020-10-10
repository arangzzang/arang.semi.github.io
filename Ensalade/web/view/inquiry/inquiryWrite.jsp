<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp"%>

<section  id="inquiry-container">
    <div class="left"></div>
    <div class="right">
        <form action="<%=request.getContextPath()%>/inquiry/inquiryWriteEnd" method="post"
            enctype="multipart/form-data">
            <h1>Ensalade</h1>
            <hr>
            <div class="content_top" id="inquiry-container">
                <div class="select-input content_row" id="type">
                    <select class="form-control select" id="inquiryType" name="qType" size="1" required>
                        <option selected disabled>질문유형을 선택하세요.</option>
                        <option value="상품문의">상품문의</option>
                        <option value="배송문의">배송문의</option>
                        <option value="교환/환불">교환/환불</option>
                    </select>
                </div>
                <div id="writer">
                    <input type="hidden" name="writer" value="<%=loginMember.getMemberId()%>" readonly>
                </div>
                <div id="title">
                    <input class="form-control content_row" type="text" name="title" placeholder="제목을 입력해주세요"
                        required>
                </div>
                <div id="content">
                    <textarea class="form-control content_row" name="content" cols="30" rows="10"
                        placeholder="내용을 입력해주세요" required></textarea>
                </div>
                <div class="file-upload content_row">
                    <div class="text">사진첨부</div><input class="form-control file" type="file" name="upload">
                </div>
                <div>
                    <input type="submit" class="form-control_input_btn" value="글 등록" id="writeBtn">
                </div>
            </div>
        </form>
    </div>
    <div id="sort"></div>
</section>



</body>

</html>
<style>
    .form-control_input_btn {
        height: 25px;
        width: 115px;
        height: 40px;
        box-sizing: border-box;
        border-radius: 4px;
        font-size: 14px;
        font-weight: 400;
        cursor: pointer;
        border-style: none;
        font-weight: inherit;
        background: #27b06e;
        color: #ffffff;
    }

    .text {
        padding: 10px 5px;
        width: 100px;
    }

    .file {
        text-align: left;
    }

    .file-upload {
        display: flex;
    }

    textarea.form-control {
        resize: none;
        line-height: 20px;
        padding-top: 9px;
        padding-bottom: 9px;
        min-height: 200px;
    }

    .select {
        width: 50%;
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

    #sort {
        width: 200px;
    }

    #container {
        display: flex;
    }

    hr {
        width: 100%;
    }

    .left {
        position: relative;
        width: 200px;
    }

    .right {
        width: 100%;
    }

    .right h1 {
        margin: 50px;
        font-size: 42px;
        left: 0;
    }

    section {
        padding-top: 150px;
        height: auto;
    }

    section#inquiry-container {
        position: relative;
        height: 100%;
        width: 600px;
        margin: 0 auto;
        text-align: center;
    }
</style>

<%@ include file="/view/common/footer.jsp"%>