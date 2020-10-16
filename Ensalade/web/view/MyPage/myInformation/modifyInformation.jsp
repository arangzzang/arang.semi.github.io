<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<%
	//회원 정보 수정 view 정보 수정 버튼 이 주소로 연결
	  if(loginMember==null){
		response.sendRedirect(request.getContextPath());
		return;
	}
	 String[] address=loginMember.getMemberAddress().split(",");

%>

<section>

	<form action="<%=request.getContextPath()%>/view/MyPage/myInformation/modifyInfo.jsp" method="post">
		<div style="text-align: center;">
			<h1>Ensalad</h1>
			<h4>내 정보 수정</h4>
		</div>

		<div style="margin-top: 10px;">
			
			<label for="oldPassword">비밀번호<label class="star">*</label></label>
			<input type="password" name="password" id="oldPassword_" required
				class="text_"><br>
		
			<label for="password">새 비밀번호<label class="star">*</label></label>
			<input type="password" name="newPw" id="password_" placeholder="비밀번호 4글자 이상 입력 (문자와 숫자 혼합)"
				class="text_">
				<p id="cPw" class="mb"></p>
				<br>
			<!--8글자 이상 입력, 영문 대소문자 포함-->
			</div>
 	
			<label for="password2">새 비밀번호 재확인<label class="star">*</label></label><br>
			<input type="password" name="password2" id="password2" placeholder="비밀번호 재입력" class="text_">
			<p id="cPw2" class="mb"></p>

			<!-- <br> -->
			<div style="margin-top: 10px;">
				<h3>개인 정보</h3>

				<label for="email">이메일<label class="star">*</label></label>
				<input type="text" name="email" id="email_" class="text_" value="<%=loginMember.getEmail()%>" required>
				<p id="emailText"></p>

				<label for="phone">연락처<label class="star">*</label></label>
				<input type="text" name="phone" id="phone_" class="text_" value="<%=loginMember.getMemberPhone()%>" required>
				<p id="pCh"></p>

				<!--주소검색기능 추후 추가-->
				<!-- <label for="address">주소<label class="star">*</label></label>
				<input type="text" name="address" id="address_" class="text_" required> -->
				<input style="margin-top:20px" type="text" name="address" id="sample6_postcode" value="<%=address[0]%>" class="text_" required readonly>
				<input type="button" id="search" name="address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn_1"><br>
				<input type="text" name="address" id="sample6_address" placeholder="주소" class="text_" value="<%=address[1]%>" required><br>
				<input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소" class="text_" value="<%=address[2]%>" required><br>

			</div>

			<div style="margin-top:30px">
				<div>
					<input type="submit" value="수정하기" onclick="return checkPw();"
					class="btn_1 text_" style="width:100%">
				</div>
			</div>

	</form>
</section>

<style>
	 #search{
	 	margin-top: 15px;
	    margin-bottom: 15px;
	    width: 150px;
	    height: 35px;
	 }
	 section {
            flex-grow: 1;
            margin: 0;
            min-width: 320px;
            font-size: 16px;
            background: #fff;
            width: 500px;
            height: 1;
            margin: 0 auto;
            padding: 80px 50px 50px;
        }

        .text_ {
            border-radius: 5px;
            height: 50px;
            border-color: #ddd;
            font-size: 13px;

            display: block;
            padding: 0 15px;
            width: 100%;
            height: 43px;
            box-sizing: border-box;
            border: 1px solid #e7e7e7;
            box-shadow: 0 0 0;
            background: #fff;
            font-size: 15px;
            line-height: normal;
            font-weight: 300;
            color: #3d3d3d;
            -webkit-tap-highlight-color: transparent;
            transition: box-shadow .24s ease-out;
            -webkit-appearance: none;
            -moz-appearance: none;
            outline-color: rgb(120, 228, 106);
            /* outline-style: inherit; */
            outline-width: thin;
        }

        .id_ {
            width: 100%;
        }

        .btn_1 {
            background-color: #27b06e;
            border-radius: 5px;
            border: 1px solid #fff;
            color: honeydew;
            width: 40%;
        }

        .form_ {
            padding: 80px 50px 50px;
            max-width: 500px;
            line-height: 1.5;
            margin-bottom: 10px;
        }

        .margin_ {
            margin-bottom: 20px;
        }

        .font_ {
            font-weight: 600;
            line-height: 2;
        }

        .font2_ {
            font-size: 14px;
            color: #6f7174;
            margin-left: 3px;
            line-height: 1.5;
        }

        .star {
            color: red;
        }

        .check_ {
            width: 20px;
            height: 20px;
            color: #e7e7e7;
            transition: color .24s ease-out;
        }

</style>

<script>
	let ch=0;
$("#password_").keyup(e => {
	let pw = $("#password_").val();
	let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
	if(pw==""){
		$("#cPw").html("");
	}
	if (!regPw.test(pw)&&pw!="") {
		$("#cPw").attr("style","color:red;font-size:12px;");
		$("#cPw").html("사용할 수 없습니다.");
		ch=0;
		return;
	}else if(regPw.test(pw)&&pw!=""){
		$("#cPw").attr("style","color:green;font-size:12px;");
		$("#cPw").html("사용가능합니다.");
		ch=1;
	}
});
 

$("#password2").keyup(e => {
	let pw = $("#password_").val();
	let pw2 = $("#password2").val();
	let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
	if(pw2==""){
			$("#cPw2").html("");
			return;
		}
	if (pw != pw2) {
		$("#cPw2").attr("style","color:red;font-size:12px;");
		$("#cPw2").html("일치하지 않습니다.");
		ch=0;
		return;
	}else if(regPw.test(pw)&&pw==pw2){
		$("#cPw2").attr("style","color:green;font-size:12px;");
		$("#cPw2").html("비밀번호가 일치합니다.");
		ch=1;
	}else{
		$("#cPw2").attr("style","color:red;font-size:12px;");
		$("#cPw2").html("사용할 수 없습니다.");
		ch=0;
	}
	
});

$("#newPw").blur(e => {
	let pw = $("#password_").val();
	let pw2 = $("#password2").val();
	if(pw!=pw2){
		ch=0;
	}
})
$("#password2").blur(e => {
	let pw = $("#password_").val();
	let pw2 = $("#password2").val();
	if(pw!=pw2){
		ch=0;
	}
})

function checkPw(){
	console.log(ch);
	if(ch==0){
		alert('비밀번호를 확인하세요.');
		return false;
	}
		return true;
}
$("#phone_").keyup(e=>{
	   let reg=/^[0-9]{3,4}[-]?[0-9]{3,4}[-]?[0-9]{4}$/;
	   if(!reg.test($(e.target).val())){
		   $("#pCh").attr("style","font-size:12px;color:red");
		   $("#pCh").html("전화번호 형식을 확인해주세요.");
	   }else{
		   $("#pCh").html("");
	   }
	   if($(e.target).val()==""){
		   $("#pCh").html("");
	   }
})
$("#email_").keyup(e=>{
	  let reg=/^[0-9a-zA-Z]+@[0-9a-zA-Z.]+.[a-zA-Z]{2,6}$/;
	   let email=$("#email_").val();
	   if(!reg.test(email)){
		   $("#emailText").attr("style","font-size:12px;color:red;");
		   $("#emailText").html("이메일 형식을 확인해주세요.");
		   return;
	   }else{
		   $("#emailText").html("사용가능 합니다.");
	   }
})
</script>


<%@include file="/view/common/footer2.jsp"%>