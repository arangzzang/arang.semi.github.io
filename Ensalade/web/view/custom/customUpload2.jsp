<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.en.custom.model.vo.CustomOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	List<CustomOrder> list = (List) request.getAttribute("list");
	for (CustomOrder c : list) {
		System.out.println(c);
	}
%>

<section class="contents-wrap">
	<h2>글 올리기</h2>

	<form action="<%=request.getContextPath()%>/upload/customUpload"
		method="post" enctype="multipart/form-data">
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

			<%-- <!-- 상품번호 선택 셀렉박스 div -->
			<div class="c_selectbox">
				<select id="customNo" name="customNo">
					<option>번호</option>
					<%for (CustomOrder c : list) { %>
					<option><%=c.getCustomNo()%></option>
					<%}	%>
				</select>
			</div> --%>

			<!-- 제목작성 div -->
			<div class="cbox_textbox">
				<!-- 상품번호 선택 셀렉박스 div -->
				<div class="select-input content_row">
					<select id="customNo" name="customNo">
						<option selected disabled>커스텀을 골라주세요.</option>
						<%
							for (CustomOrder p : list) {
						%>
						<%
							CustomOrder co = new CustomService().memberCustom2(p.getCustomNo());
						%>
						<option value="<%=p.getCustomNo()%>"><%=co.getCustomName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<!-- 제목작성 div -->
				<div class="c_titlebox content_row">
					<input type="text" id="ctitle" name="ctitle" placeholder="제목 입력">
				</div>
				<!-- 본문작성 div -->
				<div class="c_textbox content_row">
					<textarea name="ctext" class="form-control text-area_input"
						placeholder="내용을 입력하세요."></textarea>
				</div>
			</div>
		</div>

		<!-- 글올리기 버튼 -->
		<div>
			<input type="submit" value="글 등록" class="form-control">
		</div>
		<input type="hidden" value="<%=loginMember.getMemberId()%>"
			name="userId">
	</form>
</section>

<script>
    //파일 업로드 처리
    $("#postup").click(e => {
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
    });



    //이미지태그 클릭시 파일업로드창 열기
    // $("#c").click(e => {
    //     $("#upload").click();
    // });

    // 미리보기 띄우기
    // $("#upload").change(e => {
    //     $("#imgContainer").html("");//리셋

    //     $.each(e.target.files, (i, v) => {
    //         let reader = new FileReader();
    //         reader.onload = e => {
    //             /*    let img=$("<img>",{"src":e.target.result,"width":"100","height":"100"});
    //                $("#imgContainer").append(img); */
    //             $("#c").attr("src", e.target.result);
    //         }
    //         reader.readAsDataURL(v);
    //     });

    // });

    /* $("#title").attr("value",$("#customNo").val()); */

    $("#customNo").change(e => {
        $.ajax({
            url: "<%=request.getContextPath()%>/view/custom/customValue.jsp",
            data: { "data1": $(e.target).val() },
            success: data => {
                $("#title").attr("value", data);
            }
        })

    });



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
.cimg {
	width: 500px;
	height: 500px;
	padding: 30px;
}

.cbox {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cbox_imgbox, .cbox_textbox {
	width: 50%;
}


.cbox_textbox {
	display: block;
	padding: 40px 25px;
}

section.contents-wrap {
	position: relative;
	top: 100px;
	min-height: 100%;
	padding-bottom: 100px;
}

.custom-write-form {
	max-width: 1024px;
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
input.form-control{
	width:100px;
	background-color: green;
	font-size: 25px;
	color: white;
}
</style>

<%@ include file="/view/common/footer2.jsp"%>