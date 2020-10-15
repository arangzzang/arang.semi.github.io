<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/view/common/header.jsp"%>
<style>
	section {padding-top: 100px; height:auto;}	
	section#inquiry-container {height:100%; width: 600px;margin: 0 auto;text-align: center;}
	section#inquiry-container h2 {margin: 10px 0;}
	div#inquiry-container{position:relative width:100%;height:575px;}
</style>

<%-- <section id="container">
	<form action="<%=request.getContextPath()%>/Product/ProductReviewInsertSevlet?productNo=<%=request.getParameter("productNo")%>"
		method="post" enctype="multipart/form-data">
		<h2>상품후기</h2>
		<div id="inquiry-container">
			<div id="writer">
				
				<input type="hidden"  name="ReviewWriter" value="<%=loginMember.getMemberId()%>" readonly >
			</div>
			<div id="title">
				제목 <input type="text" name="ReviewTitle" placeholder="제목을 입력해주세요" >
			</div>
			<div id="content">
				내용
				<textarea name="ReviewContent" cols="30" rows="10" placeholder="내용을 입력해주세요" required="required"></textarea>
			</div>
			<div id="file">
				사진첨부 <input type="file" name="upload">
			</div>
			<div id="send">
				<input type="submit" value="문의하기">
			</div>
		</div>
	</form>
</section> --%>

<section class="contents-wrap">
	<h2>리뷰쓰기!</h2>

	<form action="<%=request.getContextPath()%>/Product/ProductReviewInsertSevlet?productNo=<%=request.getParameter("productNo")%>"
		 method="post" enctype="multipart/form-data">
		 <input type="hidden"  name="ReviewWriter" value="<%=loginMember.getMemberId()%>">
		<div class="cbox">
			<!-- 파일첨부&미리보기박스  -->
			<div class="cbox_imgbox">
				<div class="image-upload-wrap cimg" id="imgContainer">
					<button class="image-upload" type="button" id="c">
						<span class="content" id="c_span"> <svg class="icon"
								width="48" height="48" viewBox="0 0 48 48" fill="currentColor">
                                    <path
									d="M11.952 9.778l2.397-5.994A1.778 1.778 0 0 1 16 2.667h16c.727 0 1.38.442 1.65 1.117l2.398 5.994h10.174c.982 0 1.778.796 1.778 1.778v32c0 .981-.796 1.777-1.778 1.777H1.778A1.778 1.778 0 0 1 0 43.556v-32c0-.982.796-1.778 1.778-1.778h10.174zM24 38c6.075 0 11-4.925 11-11s-4.925-11-11-11-11 4.925-11 11 4.925 11 11 11z">
                                    </path>
                                </svg> <span class="text">사진올리기</span>
						</span>
					</button>
					<input type="file" id="upload" style="display: none;" name="upload">
				</div>
			</div>

			<!-- 제목작성 div -->
			<div class="cbox_textbox">
				<!-- 제목작성 div -->
				<div class="c_titlebox content_row">
					<input type="text" id="ctitle" name="ReviewTitle" class="form-control" placeholder="제목 입력">
				</div>
				<!-- 본문작성 div -->
				<div class="c_textbox content_row">
					<textarea name="ReviewContent" class="form-control text-area_input" placeholder="내용을 입력하세요." required></textarea>
				</div>
			</div>
		</div>

		<!-- 글올리기 버튼 -->
		<div>
			<input type="submit" class="form-control_input_btn" value="글 등록">
		</div>
		<input type="hidden" value="<%=loginMember.getMemberId()%>"	name="userId">
	</form>
</section>

<script>
    //파일 업로드 처리
<%--     $("#postup").click(e => {
        let form = new FormData();
        //제목+내용
        form.append("title", $("#ctitle").val());
        form.append("content", $("#ctext").val());
        //업로드파일
        form.append("custom", $("#upload").files);
        $.ajax({
            url: "<%=request.getContextPath()%>/upload/customUpload",
            data: form,
            type: "post",
            processData: false,
            contentType: false,
            success: data => {
                console.log("업로드 성공");
                //alert("글이 성공적으로 등록되었습니다.");
            }
        });
    }); --%>
</script>
<script>
    $("#c").click(e => {
        $("#upload").click();
    });
    $("#upload").change(e => {
        let reader = new FileReader();
        reader.onload = e => {
            let divWrap = $("<div>").attr({ "class": "form" });
            let img = $("<img>").attr({ "src": e.target.result, "class": "form_image" });
            $("#c").attr({ "class": "displayN" });
            $("#c_span").attr({ "class": "displayN" });
            $("#imgContainer").append(divWrap);
            $(".form").append(img);
        }
        reader.readAsDataURL($(e.target)[0].files[0]); //파일의 주소값가져옴!

    });
</script>

<style>
    .form-control_input_btn {
        height: 25px;
        width: 150px;
        height: 25px;
        box-sizing: border-box;
        border-radius: 4px;
        font-size: 14px;
        font-weight: 700;
        background-color:#27b06e;
        color:white;
        cursor: pointer;
        border-style: none;
        font-weight: inherit;
        padding: 10px 0px 30px;
    }
    .cimg {
        width: 500px;
        height: 500px;
        padding: 30px;
        margin: 0 auto;
    }

    .cbox {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 100px;
        min-width: 1000px;
    }

    .cbox_imgbox, .cbox_textbox {
        width: 50%;
    }

    .cbox_textbox {
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