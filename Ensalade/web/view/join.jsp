<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>

<section>

	<form action="<%=request.getContextPath()%>/loginjoin/join.do" method="post">
		<div style="text-align: center;">
			<h1>Ensalad</h1>
		</div>

		<div style="margin-top: 10px;">
			<h3>계정 정보</h3>
			<div class="margin_">
				<label for="userId" class="font_">아이디<label class="star">*</label></label>
				<div style="display:flex" class="id_ margin_">
					<input type="text" name="userId" id="userId_" required class="text_">
					<input type='button' value='중복확인' class="btn_1" id="cBtn_">
					<!--아이디 중복확인을 위한 기능 / 4글자 이상 입력-->
				</div>
					<p id="cId" style="font-size:12px;"></p>
			</div>
			<label for="password">비밀번호<label class="star">*</label></label>
			<input type="password" name="password" id="password_" placeholder="비밀번호 4글자 이상 입력 (숫자와 문자포함)" required
				class="text_">
				<p id="pc"></p>
				<br>
			<!--8글자 이상 입력, 영문 대소문자 포함-->

			<label for="password2">비밀번호 재확인<label class="star">*</label></label><br>
			<input type="password" name="password2" id="password2" placeholder="비밀번호 재입력" class="text_" required>
			<p id="pc2"></p>
			<!-- <br> -->
			<div style="margin-top: 10px;">
				<h3>개인 정보</h3>
				<label for="userName">이름<label class="star">*</label></label>
				<input type="text" name="userName" id="userName_" class="text_" required>

				<label for="email">이메일<label class="star">*</label></label>
				<div style="display:flex;margin-bottom:10px">
				<input type="text" name="email" id="email_" class="text_" required>
				<input type="button" value="인증" id="check_1" style="padding: 0px 30px 0px;border-radius: 5px;border: 1px solid #fff;color: honeydew;background-color: #27b06e;cursor:pointer;">
				</div>
				<p id="emailText"></p>
				<div id="emailCheck">
				<label for="emailCheck" id="clabel">인증번호</label>
				<div style="display:flex;">
				<input type="text" name="email" id="cNo_" class="text_" required>
				<input type="button" value="확인" id="cCheck" style="padding: 0px 30px 0px;border-radius: 5px;border: 1px solid #fff;color: honeydew;background-color: #27b06e;cursor:pointer;">
				</div>
				</div>
				<label for="phone">연락처<label class="star">*</label></label>
				<input type="text" name="phone" id="phone_" class="text_" required>
				<p id="pCh"></p>

				<!--주소검색기능 추후 추가-->
				<!-- <label for="address">주소<label class="star">*</label></label>
				<input type="text" name="address" id="address_" class="text_" required> -->
				<input style="margin-top:20px" type="text" name="address" id="sample6_postcode" placeholder="우편번호" class="text_" required readonly>
				<input type="button" id="search" name="address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn_1"><br>
				<input type="text" name="address" id="sample6_address" placeholder="주소" class="text_" required><br>
				<input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소" class="text_" required><br>

				<label for="birth">생년월일<label class="star">*</label></label>
				<div style="display:flex">
					<input type="number" name="year" id="year_" placeholder="YYYY" class="text_" max="2020" min="1900" required>
					<input type="number" name="month" id="month_" placeholder="MM" class="text_" max="12" min="1" required>
					<input type="number" name="date" id="date_" placeholder="DD" class="text_" max="31" min="1" required><br>
				</div>
				<div style="margin-top: 20px;">
					<label for="gender">성별<label class="star">*</label></label>
					<input type="radio" name="gender" id="gender_m" value="M" required>남자
					<input type="radio" name="gender" id="gender_f" value="F" required>여자<br>
				</div>
			</div>

			<div style="margin-top:30px">
				<h4>이용약관</h4>
				<!--이용약관 선택 시 세부내용 팝업창처럼 띄움-->
				<!--전체동의 선택 시 아래 두가지 체크박스 자동 체크할 수 있도록-->
				<div><input type="checkbox" name="checkAll" id="checkAll_"><label class="1" id="1"><svg id="11"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" data-v-a6949f1c class="check_">
							<path fill="currentColor" fill-rule="nonzero"
								d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"
								data-v-a6949f1c></path>
						</svg></label>
					<label class="font_" style="margin-left: 3px;">전체 동의</label></div>
				<div><input type="checkbox" name="terms1" id="terms1_"><label class="1" id="2"><svg id="22"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" data-v-a6949f1c class="check_">
							<path fill="currentColor" fill-rule="nonzero"
								d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"
								data-v-a6949f1c></path>
						</svg></label><label class="font2_">(필수) 이용약관에 동의합니다.</label></div>
				<div><input type="checkbox" name="terms2" id="terms2_"><label class="1" id="3"><svg id="33"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" data-v-a6949f1c class="check_">
							<path fill="currentColor" fill-rule="nonzero"
								d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"
								data-v-a6949f1c></path>
						</svg></label><label class="font2_">(필수) 개인정보처리방침에
						동의합니다.</label></div>
				<br>
				<div>
					<input type="submit" value="가입하기" onclick="return enrollDeny();"
					class="btn_1 text_" style="width:100%">
				</div>
			</div>

	</form>
	<form action="" method="post" name="checkDuplicate">
		<input type="hidden" name="userId">
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
            margin-bottom: 10px;
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
            color: gray;
            transition: color .24s ease-out;
        }

</style>

<script>
	let a=0;
	let b=0;
	let c=0;
	/*  전체버튼으로 체크박스의 온오프를 위한 구문 */
	$("[type=checkbox]").css("display","none");
	$("#2").click(e=>{
		if($("#terms1_").prop('checked')==true){
		$("#terms1_").prop('checked', false);
		$("#22").css("color","gray");
		}else{
			$("#terms1_").prop('checked', true);
			$("#22").css("color","#27b06e");
		}
	});
	$("#3").click(e=>{
		if($("#terms2_").prop('checked')==true){
		$("#terms2_").prop('checked', false);
		$("#33").css("color","gray");
		}else{
			$("#terms2_").prop('checked', true);
			$("#33").css("color","#27b06e");
		}
	});
	
	$(document).ready(function () {
		$("#1").click(function () {
			console.log(a);
			if($("#checkAll_").prop("checked")!=true){
				$("#checkAll_").prop("checked",true);
			}else{
				$("#checkAll_").prop("checked",false);
			}

			if ($("#checkAll_").prop('checked')) {
				$("#terms1_").prop('checked', true)
				$("#terms2_").prop('checked', true)
				// console.log($("#terms1_").prop('checked'));
				$("svg").css("color","#27b06e");
			} else {
				$("#terms1_").prop('checked', false)
				$("#terms2_").prop('checked', false)
				$("svg").css("color","gray");
			}
		})

	});
	/*  체크박스 두 개가 체크되어있지않으면 다음으로 넘어갈 수 없게 하는 구문 */
	function enrollDeny() {
		
		if ($("#terms1_").prop('checked') == false || $("#terms2_").prop('checked') == false) {
			alert('모두 체크해주세요.');
			return false;
		}else if(a==0){
			alert('아이디 중복 확인을 해주세요.');
			return false;
		}else if(b==0){
			alert('비밀 번호를 확인해주세요.');
			return false;
		}else if(c==0){
			alert('이메일 인증이 필요합니다.');
			return false;
		}else{
			return true;
		}
	}
	/* 아이디 4글자 이상을 위해 */
	<%-- function doubleCheck() {
		let userId = $("#userId_").val();
		if ($("#userId_").val().trim().length < 4) {
			alert('아이디를 4글자 이상 입력하세요.');
			return;
		}
		const url = "<%=request.getContextPath()%>/checkDuplicate.do";
		const title = "checkDuplicate";
		const status = "left=500,top=200,width=500,height=300";
		open("", title, status);

		checkDuplicate.target = title;
		checkDuplicate.action = url;
		checkDuplicate.userId.value = userId;
		checkDuplicate.submit();
	} --%>

	/* 비밀번호 영문과 숫자 포함을 위한 패스워드 이벤트 */
	$("#password_").keyup(e => {
		let pw = $("#password_").val();
		let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
		if(pw==""){
			$("#pc").html("");
		}
		if (!regPw.test(pw)&&pw!="") {
			$("#pc").attr("style","color:red;font-size:12px;");
			$("#pc").html("사용 가능하지 않습니다.");
			b=0;
			return;
		}else if(regPw.test(pw)&&pw!=""){
			$("#pc").attr("style","color:green;font-size:12px;");
			$("#pc").html("사용가능합니다.");
			b=1;
		}
	});

	$("#password2").keyup(e => {
		let pw = $("#password_").val();
		let pw2 = $("#password2").val();
		let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
		if(pw2==""){
			$("#pc2").html("");
		}
		if(pw!=""&&pw2!=""){
		if (pw != pw2) {
			$("#pc2").attr("style","color:red;font-size:12px;");
			$("#pc2").html("일치하지 않습니다.");
			b=0;
			return;
		}else if(regPw.test(pw)){
			$("#pc2").attr("style","color:green;font-size:12px;");
			$("#pc2").html("일치합니다.");
			b=1;
			return;
		}else{
			$("#pc2").attr("style","color:red;font-size:12px;");
			$("#pc2").html("사용할 수 없습니다.");
			b=0;
			return;
		}	
		}
	});
	
	$("#password_").blur(e => {
		let pw = $("#password_").val();
		let pw2 = $("#password2").val();
		if(pw!=pw2){
			b=0;
		}
	})
	$("#password2").blur(e => {
		let pw = $("#password_").val();
		let pw2 = $("#password2").val();
		if(pw!=pw2){
			b=0;
		}
	})
	
	$("#userId_").keyup(e=>{//아이디 한글 못받게
		let t=/[^a-zA-Z0-9]/g;
		if(t.test($(e.target).val())){
			alert('아이디는 영문자만 입력해주세요.');
			$(e.target).val("");
		}
	})
       /* $("#password_").click(e=>{
		if($("#password_").next().attr("type")==("P")){
			$("#password_").next().remove();
		}
		} */

    //    $("#password_").on({"click":
    // 	   function(e){
    // 	   if($(e.target).next().filter("p")!=null){
    //     	   $(e.target).next().remove();
    //        }
    //    },"blur":function(e){
    // 	   let pw=$(e.target).val();
    //        let regPw=/^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
    //    if(!regPw.test(pw)){
    //        alert("비밀번호 4~13글자로 작성하고 숫자, 문자");
    //        $(e.target).val("");
    //    }}
    //    });

          
        </script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         <script>
        	//api
           function sample6_execDaumPostcode() {
               new daum.Postcode({
                   oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                       // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var addr = ''; // 주소 변수
                       var extraAddr = ''; // 참고항목 변수

                       //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                       if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                           addr = data.roadAddress;
                       } else { // 사용자가 지번 주소를 선택했을 경우(J)
                           addr = data.jibunAddress;
                       }
                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       document.getElementById('sample6_postcode').value = data.zonecode;
                       document.getElementById("sample6_address").value = addr;
                       // 커서를 상세주소 필드로 이동한다.
                       document.getElementById("sample6_detailAddress").focus();
                   }
               }).open();
           }
           $(".text_").focus(e=>{
          	 $(e.target).css("outline-color","#27b06e");
           })
           
           $("#cBtn_").click(e=>{
        	   $.ajax({
        		   url:'<%=request.getContextPath()%>/view/check/checkDuplicate.jsp',
        		   data:{'id':$("#userId_").val()},
        		   success:data=>{
        			   
        			   $("#cId").html(data);
        	   			a=$("#h1").val();
        	   			console.log(a);
        		   }
        	   });
           })
           $("#check_1").click(e=>{
        	   let reg=/^[0-9a-zA-Z]+@[0-9a-zA-Z.]+.[a-zA-Z]{2,6}$/;
        	   let email=$("#email_").val();
        	   if(!reg.test(email)){
        		   $("#emailText").attr("style","font-size:12px;color:red;");
        		   $("#emailText").html("이메일 형식을 확인해주세요.");
        		   return;
        	   }
        	   
        	   $("#emailCheck").css("display","block");
        	   $.ajax({
        		   url:'<%=request.getContextPath()%>/view/search/searchIdPw.jsp',
        		   data:{'name':$("#userName_").val(),'email':$("#email_").val()},
        		   success:data=>{
        			   $("#emailCheck").append(data);
        			   $("#emailText").html("");
        		   }
        		   
        		   
        	   });
           })
           
           $("#cCheck").click(e=>{
        	   let c2=$("#cNo_").val();
        	   let cc=$("#h3").val();
        	   console.log(c);
        	   if(c2==cc){
        		   alert("인증되었습니다.");
        		   c=1;
        		   $("#emailCheck").css("display","none");
        	   }else{
        		   alert("인증번호가 일치하지않습니다.");
        		   c=0;
        	   }
           })
           
           $("#emailCheck").css("display","none");
           
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
       </script>
       
       <style>
       		.btn_1:hover{
       			background-color:#3B966E;
       			cursor:pointer;
       		}
       		svg:hover{
       			cursor:pointer;
       		}
       </style>
<%-- <%@include file="/view/common/footer.jsp"%> --%>
	
	
	

